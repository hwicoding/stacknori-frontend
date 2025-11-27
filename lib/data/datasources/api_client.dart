import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/config/api_config.dart';
import '../../core/config/storage_keys.dart';

/// API 클라이언트 (Dio 기반)
class ApiClient {
  ApiClient._();

  static final ApiClient instance = ApiClient._();

  late final Dio _dio;

  /// Dio 인스턴스 초기화
  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.apiBaseUrl,
        connectTimeout: Duration(seconds: ApiConfig.timeoutSeconds),
        receiveTimeout: Duration(seconds: ApiConfig.timeoutSeconds),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // 인터셉터 추가
    _dio.interceptors.add(_AuthInterceptor());
    _dio.interceptors.add(_ErrorInterceptor());
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  /// Dio 인스턴스 반환
  Dio get dio => _dio;
}

/// 인증 인터셉터 (JWT 토큰 자동 추가)
class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Access Token 가져오기
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(StorageKeys.accessToken);

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // 401 Unauthorized 에러 시 토큰 갱신 시도
    if (err.response?.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString(StorageKeys.refreshToken);

      if (refreshToken != null) {
        try {
          // 토큰 갱신 시도
          final dio = Dio(BaseOptions(baseUrl: ApiConfig.apiBaseUrl));
          final response = await dio.post(
            ApiConfig.refresh,
            data: {'refresh_token': refreshToken},
          );

          if (response.statusCode == 200) {
            final data = response.data;
            await prefs.setString(
              StorageKeys.accessToken,
              data['access_token'],
            );
            await prefs.setString(
              StorageKeys.refreshToken,
              data['refresh_token'],
            );

            // 원래 요청 재시도
            final opts = err.requestOptions;
            opts.headers['Authorization'] = 'Bearer ${data['access_token']}';
            final retryResponse = await ApiClient.instance.dio.request(
              opts.path,
              options: Options(
                method: opts.method,
                headers: opts.headers,
              ),
              data: opts.data,
              queryParameters: opts.queryParameters,
            );
            return handler.resolve(retryResponse);
          }
        } catch (e) {
          // 토큰 갱신 실패 시 로그아웃 처리 필요
          await prefs.remove(StorageKeys.accessToken);
          await prefs.remove(StorageKeys.refreshToken);
        }
      }
    }

    handler.next(err);
  }
}

/// 에러 인터셉터 (에러 처리 및 로깅)
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    // 에러 처리 로직 (필요시 확장)
    handler.next(err);
  }
}


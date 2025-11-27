import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/config/api_config.dart';
import '../../core/config/storage_keys.dart';
import '../../core/utils/result.dart';
import '../../data/datasources/api_client.dart';
import '../../data/models/token_pair.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

/// 인증 Repository 구현
class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio = ApiClient.instance.dio;

  @override
  Future<Result<User>> signup({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConfig.signup,
        data: {
          'email': email,
          'password': password,
        },
      );

      final userModel = UserModel.fromJson(response.data as Map<String, dynamic>);
      return Success(userModel.toEntity());
    } on DioException catch (e) {
      return Failure(
        e.response?.data?['detail']?.toString() ?? '회원가입에 실패했습니다.',
        e,
      );
    } catch (e) {
      return Failure('알 수 없는 오류가 발생했습니다.', e);
    }
  }

  @override
  Future<Result<TokenPair>> login({
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({
        'username': email, // OAuth2PasswordRequestForm은 username 필드 사용
        'password': password,
      });

      final response = await _dio.post(
        ApiConfig.login,
        data: formData,
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );

      final tokenPair = TokenPair.fromJson(response.data as Map<String, dynamic>);

      // 토큰 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(StorageKeys.accessToken, tokenPair.accessToken);
      await prefs.setString(StorageKeys.refreshToken, tokenPair.refreshToken);

      return Success(tokenPair);
    } on DioException catch (e) {
      return Failure(
        e.response?.data?['detail']?.toString() ?? '로그인에 실패했습니다.',
        e,
      );
    } catch (e) {
      return Failure('알 수 없는 오류가 발생했습니다.', e);
    }
  }

  @override
  Future<Result<TokenPair>> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        ApiConfig.refresh,
        data: {'refresh_token': refreshToken},
      );

      final tokenPair = TokenPair.fromJson(response.data as Map<String, dynamic>);

      // 새 토큰 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(StorageKeys.accessToken, tokenPair.accessToken);
      await prefs.setString(StorageKeys.refreshToken, tokenPair.refreshToken);

      return Success(tokenPair);
    } on DioException catch (e) {
      return Failure(
        e.response?.data?['detail']?.toString() ?? '토큰 갱신에 실패했습니다.',
        e,
      );
    } catch (e) {
      return Failure('알 수 없는 오류가 발생했습니다.', e);
    }
  }

  @override
  Future<Result<User>> getCurrentUser() async {
    try {
      final response = await _dio.get(ApiConfig.me);
      final userModel = UserModel.fromJson(response.data as Map<String, dynamic>);
      return Success(userModel.toEntity());
    } on DioException catch (e) {
      return Failure(
        e.response?.data?['detail']?.toString() ?? '사용자 정보 조회에 실패했습니다.',
        e,
      );
    } catch (e) {
      return Failure('알 수 없는 오류가 발생했습니다.', e);
    }
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeys.accessToken);
    await prefs.remove(StorageKeys.refreshToken);
    await prefs.remove(StorageKeys.user);
  }
}


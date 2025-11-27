/// API 설정 상수
class ApiConfig {
  ApiConfig._();

  /// Base URL for API requests
  static const String baseUrl = 'https://stacknori-api.livbee.co.kr';

  /// API prefix
  static const String apiPrefix = '/api';

  /// Full API base URL
  static const String apiBaseUrl = '$baseUrl$apiPrefix';

  /// Auth endpoints
  static const String signup = '/auth/signup';
  static const String login = '/auth/login';
  static const String refresh = '/auth/refresh';
  static const String me = '/auth/me';

  /// Request timeout duration (in seconds)
  static const int timeoutSeconds = 30;
}


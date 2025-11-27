import '../../core/utils/result.dart';
import '../entities/user.dart';
import '../../data/models/token_pair.dart';

/// 인증 Repository 인터페이스
abstract class AuthRepository {
  /// 회원가입
  Future<Result<User>> signup({
    required String email,
    required String password,
  });

  /// 로그인
  Future<Result<TokenPair>> login({
    required String email,
    required String password,
  });

  /// 토큰 갱신
  Future<Result<TokenPair>> refreshToken(String refreshToken);

  /// 현재 사용자 정보 조회
  Future<Result<User>> getCurrentUser();

  /// 로그아웃
  Future<void> logout();
}


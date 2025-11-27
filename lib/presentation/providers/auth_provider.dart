import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../../core/utils/result_extension.dart';

/// AuthRepository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

/// 인증 상태 Provider
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  AuthNotifier(this._authRepository) : super(const AsyncValue.loading()) {
    _checkAuth();
  }

  final AuthRepository _authRepository;

  /// 인증 상태 확인
  Future<void> _checkAuth() async {
    try {
      final result = await _authRepository.getCurrentUser();
      result.when(
        success: (user) => state = AsyncValue.data(user),
        failure: (message, error) => state = const AsyncValue.data(null),
      );
    } catch (e) {
      state = const AsyncValue.data(null);
    }
  }

  /// 로그인
  Future<bool> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await _authRepository.login(
        email: email,
        password: password,
      );

      return result.when(
        success: (tokenPair) async {
          // 로그인 성공 후 사용자 정보 조회
          final userResult = await _authRepository.getCurrentUser();
          userResult.when(
            success: (user) => state = AsyncValue.data(user),
            failure: (message, error) => state = AsyncValue.error(error ?? message, StackTrace.current),
          );
          return true;
        },
        failure: (message, error) {
          state = AsyncValue.error(error ?? message, StackTrace.current);
          return false;
        },
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  /// 로그아웃
  Future<void> logout() async {
    await _authRepository.logout();
    state = const AsyncValue.data(null);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository);
});


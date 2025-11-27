import 'result.dart';

/// Result 확장 메서드
extension ResultExtension<T> on Result<T> {
  /// 성공 시 콜백 실행
  R when<R>({
    required R Function(T data) success,
    required R Function(String message, Object? error) failure,
  }) {
    return switch (this) {
      Success<T>(:final data) => success(data),
      Failure<T>(:final message, :final error) => failure(message, error),
    };
  }
}


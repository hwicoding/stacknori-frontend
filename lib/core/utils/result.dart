/// 결과 타입 (성공 또는 실패)
sealed class Result<T> {
  const Result();
}

/// 성공 결과
class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

/// 실패 결과
class Failure<T> extends Result<T> {
  final String message;
  final Object? error;

  const Failure(this.message, [this.error]);
}


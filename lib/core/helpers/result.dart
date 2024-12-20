sealed class Result<R, T> {
  const Result();
}

class Success<R, T> extends Result<R, T> {
  const Success(this.object) : super();

  final T object;

}

class Failure<R, T> extends Result<R, T>{
  const Failure(this.error) : super();

  final R error;
}
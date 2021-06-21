abstract class Failure implements Exception {
  final String? message;

  Failure({this.message});

  @override
  String toString() => message!;
}

class ApiError extends Failure {
  ApiError(String message) : super(message: message);
}

class UnknowError extends Failure {
  UnknowError(String message) : super(message: message);
}

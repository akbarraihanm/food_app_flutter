abstract class ApiException implements Exception {
  final String prefix;
  final String message;

  ApiException({this.prefix, this.message});

  String toString() {
    return "$prefix $message";
  }
}

class UnauthorizedException extends ApiException {
  final errorBody;
  UnauthorizedException({this.errorBody}) : super(prefix: "Unauthorized", message: "$errorBody");
}

class NetworkException extends ApiException {
  final String message;
  NetworkException({this.message}) : super(prefix : "Network error", message: message);
}

class ErrorRequestException extends ApiException {
  final errorCode;
  final errorBody;

  ErrorRequestException({this.errorCode, this.errorBody}) : super(
      prefix: "Error code : $errorCode",
      message: "\n$errorBody"
  );
}
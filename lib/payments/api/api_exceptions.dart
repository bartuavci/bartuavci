class AppException implements Exception {
  final String message;

  AppException({
    required this.message,
  });

  String toString() {
    return "$message";
  }
}

// class FetchDataException extends AppException {
//   FetchDataException({required String message}) : super(message: message);
// }


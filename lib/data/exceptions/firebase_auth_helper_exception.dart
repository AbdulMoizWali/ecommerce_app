enum FirebaseAuthHelperExceptionType {
  userNotFound,
  wrongPassword,
  userDisabled,
  userAlreadyExists,
  emailAlreadyInUse,
  weakPassword,
  operationNotAllowed,
  tooManyRequests,
  unknown,
}

class FirebaseAuthHelperException implements Exception {
  final String message;
  final FirebaseAuthHelperExceptionType type;
  FirebaseAuthHelperException(this.message,
      {this.type = FirebaseAuthHelperExceptionType.unknown});
  @override
  String toString() => message;
}

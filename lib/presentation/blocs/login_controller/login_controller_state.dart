class LoginControllerState {
  final bool? status;
  final String? message;

  LoginControllerState(this.status, {this.message});
}

final class LoginControllerInit extends LoginControllerState {
  LoginControllerInit(super.status);
}

final class LoginControllerLoading extends LoginControllerState {
  LoginControllerLoading(super.status);
}

final class LoginControllerError extends LoginControllerState {
  LoginControllerError(super.status, {super.message});
}

final class LoginControllerSuccesful extends LoginControllerState {
  LoginControllerSuccesful(super.status);
}

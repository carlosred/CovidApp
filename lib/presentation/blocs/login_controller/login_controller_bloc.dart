import 'package:bloc/bloc.dart';

import '../../../core/services/service_locator.dart';
import '../../../data/repositories/login_repository.dart';
import 'login_controller_state.dart';

class LoginControllerCubit extends Cubit<LoginControllerState> {
  LoginControllerCubit() : super(LoginControllerInit(null));

  Future<bool?> login({
    required String username,
    required String password,
  }) async {
    bool? result;
    emit(LoginControllerLoading(null));
    try {
      await Future.delayed(
        const Duration(
          seconds: 3,
        ),
      );
      var auth = await getIt<AuthRepository>().login(
        username: username,
        password: password,
      );

      emit(LoginControllerSuccesful(auth));
      result = auth;
    } catch (error) {
      emit(LoginControllerError(null, message: error.toString()));
      result = null;
    }
    return result;
  }

  void logout() {
    emit(LoginControllerSuccesful(false));
  }
}

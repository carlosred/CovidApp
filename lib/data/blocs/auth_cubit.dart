import 'package:bloc/bloc.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(false);

  void setAuthCubit({required bool authStatus}) => emit(authStatus);
}

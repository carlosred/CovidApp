import 'package:flutter_bloc/flutter_bloc.dart';

class HomeControllerBloc extends Bloc<HomeControllerEvent, HomeControllerState> {
  HomeControllerBloc() : super(HomeControllerInitial()) {
    on<HomeControllerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
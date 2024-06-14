import 'package:bloc/bloc.dart';

class DeviceInfoCubit extends Cubit<Map<String, dynamic>?> {
  DeviceInfoCubit() : super(null);

  void setDeviceInfo({required Map<String, dynamic> deviceInfo}) =>
      emit(deviceInfo);
}

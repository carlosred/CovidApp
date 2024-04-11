import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  static Future<Map<String, dynamic>?> getDeviceInfo() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final allInfo = deviceInfo.data;

    return allInfo;
  }
}

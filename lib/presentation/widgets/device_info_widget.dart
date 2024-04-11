import 'package:covid_app/presentation/providers/presentation_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DeviceInfoWidget extends ConsumerWidget {
  const DeviceInfoWidget({
    super.key,
    required this.width,
    required this.height,
    required this.deviceInfo,
  });

  final double width;
  final double height;
  final Map<String, dynamic>? deviceInfo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dateTimeNow = ref.watch(dateTimeProvider);
    var nowString = DateFormat('HH:mm:ss').format(
      dateTimeNow,
    );
    var amPmString = DateFormat('a').format(
      dateTimeNow,
    );
    var platformString =
        (Theme.of(context).platform == TargetPlatform.iOS) ? 'IOS' : 'ANDROID';
    return Positioned(
      right: width * 0.04,
      top: -(height * 0.12),
      left: width * 0.04,
      child: Container(
        height: height * 0.22,
        width: width * 0.93,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              40.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          nowString,
                          style: const TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        Text(amPmString),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nombre del dispositivo'),
                        Text(deviceInfo?['device'] ?? '')
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Marca del dispositivo'),
                        Text(
                          deviceInfo?['brand'] ?? '',
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Tipo del dispositivo'),
                        Text(
                          deviceInfo?['product'] ?? '',
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Modelo del dispositivo'),
                        Text(deviceInfo?['model'] ?? '')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sistema operativo y su versión'),
                        Text(
                            '$platformString - ${deviceInfo?['version']['release']}')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

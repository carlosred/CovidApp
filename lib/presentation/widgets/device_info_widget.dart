import 'package:covid_app/core/services/service_locator.dart';
import 'package:covid_app/presentation/providers/presentation_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../utils/contants.dart';

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
    var dateTimeNow = DateTime.now();
    var nowString = DateFormat('HH:mm:ss').format(
      dateTimeNow,
    );
    var amPmString = DateFormat('a').format(
      dateTimeNow,
    );
    var platformString = (Theme.of(context).platform == TargetPlatform.iOS)
        ? Constants.ios
        : Constants.android;
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
                        const Text(Constants.deviceName),
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
                        const Text(Constants.deviceBrand),
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
                        const Text(Constants.deviceType),
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
                        const Text(Constants.deviceModel),
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
                        const Text(Constants.osVersion),
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

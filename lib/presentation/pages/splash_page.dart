// ignore_for_file: use_build_context_synchronously

import 'package:covid_app/core/routes/routes.dart';

import 'package:covid_app/services/device_info_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/presentation_providers.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var deviceInfo = await DeviceInfoService.getDeviceInfo();

      if (deviceInfo != null) {
        ref.read(deviceInfoProvider.notifier).state = deviceInfo;
        Navigator.of(context).pushNamed(
          Routes.loginRoute,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 25 / 50,
                  child: Image.asset('assets/images/splash.webp'),
                ),
              ),
            ),
            const Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading...'),
                  SizedBox(
                    height: 25.0,
                  ),
                  CircularProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

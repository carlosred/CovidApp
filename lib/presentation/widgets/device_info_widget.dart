import 'package:flutter/material.dart';

class DeviceInfoWidget extends StatelessWidget {
  const DeviceInfoWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
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
        child: const Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '02:35:00',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        Text('pm'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Nombre del dispositivo'), Text('XXXX')],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Marca del dispositivo'),
                        Text(
                          'XXXX',
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Tipo del dispositivo'), Text('XXXX')],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Modelo del dispositivo'), Text('XXXX')],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sistema operativo y su versión'),
                        Text('XXXX')
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

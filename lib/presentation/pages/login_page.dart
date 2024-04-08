import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
            flex: 7,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenido a:',
                        softWrap: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Evertec',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        const Expanded(
          flex: 6,
          child: SizedBox(),
        ),
      ]),
    );
  }
}

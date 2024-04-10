import 'dart:developer';

import 'package:covid_app/data/providers/data_providers.dart';
import 'package:covid_app/presentation/controllers/login_controller.dart';
import 'package:covid_app/presentation/widgets/login_button.dart';
import 'package:covid_app/utils/enum.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String _selectedOption = 'CC';
  var _usermameController = TextEditingController();
  var _passwordController = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          30.0,
        ),
      ),
    ),
  );
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
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var loginController = ref.watch(loginControllerProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Flexible(
              fit: FlexFit.loose,
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
          Flexible(
            fit: FlexFit.loose,
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 25.0,
                right: 25.0,
                bottom: 10.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tipo de documento:'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    DropdownButtonFormField(
                      value: _selectedOption,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedOption = newValue.toString();
                        });
                      },
                      items: ['CC', 'TI', 'Pasaporte']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            18.0,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Número de documento:'),
                    ),
                    TextFormField(
                      controller: _usermameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            18.0,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Contraseña:'),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            18.0,
                          ),
                        ),
                      ),
                    ),
                    loginController.when(
                      data: (data) {
                        if (data != null) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: LoginButton(
                              ref: ref,
                              status: LoginStatus.success,
                              onPressed: () {},
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: LoginButton(
                              ref: ref,
                              onPressed: () async {
                                /*
                                if (_selectedOption == 'CC') {
                                  await ref
                                      .read(loginControllerProvider.notifier)
                                      .login(
                                        username:
                                            _usermameController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      );
                                }
                                */

                                var result = await ref
                                    .read(covidRepositoryProvider)
                                    .getCovidTotalData();

                                log(result!.toJson().toString());
                              },
                              status: LoginStatus.login,
                            ),
                          );
                        }
                      },
                      error: (error, stack) => Text(
                        'Error:${error.toString()}',
                      ),
                      loading: () => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: LoginButton(
                          ref: ref,
                          status: LoginStatus.loading,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Center(
                        child: Text('Registrar usuario'),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  spreadRadius: 5,
                                  offset: const Offset(-10, -10)),
                            ],
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          child: const Center(
                            child: Text('Facebook'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

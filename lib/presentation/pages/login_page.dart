// ignore_for_file: use_build_context_synchronously

import 'package:covid_app/core/routes/routes.dart';
import 'package:covid_app/data/providers/data_providers.dart';
import 'package:covid_app/presentation/controllers/login_controller.dart';

import 'package:covid_app/presentation/widgets/login_button.dart';
import 'package:covid_app/utils/enum.dart';
import 'package:covid_app/utils/toast.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/contants.dart';
import '../widgets/login_image_widget.dart';
import '../widgets/login_welcome_widget.dart';
import '../widgets/register_user_widget.dart';
import '../widgets/social_media_row_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String _selectedOption = Constants.cc;
  final _usermameController = TextEditingController();
  final _passwordController = TextEditingController();

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
    ref.listenManual(loginControllerProvider, (previous, next) {
      if (next.hasValue && next.value != null) {
        if (next.value == true) {
          ref.read(authProvider.notifier).state = true;

          Navigator.of(context).pushNamed(
            Routes.homeRoute,
          );
        }
      }
    });
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
          const Flexible(
              fit: FlexFit.loose,
              flex: 7,
              child: Stack(
                children: [
                  LoginImageWidget(),
                  LoginWelcomeWidget(),
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
                    const Text(Constants.documentType),
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
                      items: [Constants.cc, Constants.ti, Constants.passport]
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
                      child: Text(Constants.documentNumber),
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
                      child: Text(Constants.password),
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
                        if (data != null && data == true) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: LoginButton(
                              ref: ref,
                              status: LoginStatus.success,
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
                                if (_selectedOption == Constants.cc) {
                                  var logged = await ref
                                      .read(loginControllerProvider.notifier)
                                      .login(
                                        username:
                                            _usermameController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      );

                                  if (logged != null && logged == false) {
                                    Toast.showToast(
                                        context: context,
                                        message: Constants.wrongPassword);
                                  }
                                }
                              },
                              status: LoginStatus.login,
                            ),
                          );
                        }
                      },
                      error: (error, stack) => Text(
                        '${Constants.error}${error.toString()}',
                      ),
                      loading: () => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: LoginButton(
                          ref: ref,
                          status: LoginStatus.loading,
                        ),
                      ),
                    ),
                    const RegisterUserWidget(),
                    const SocialMediaRowWidget(),
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

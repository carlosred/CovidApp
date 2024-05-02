import 'package:flutter/material.dart';

import '../../utils/contants.dart';

class RegisterUserWidget extends StatelessWidget {
  const RegisterUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            showAboutDialog(context: context, children: [
              const Center(
                child: Text(
                  Constants.registerUser,
                ),
              )
            ]);
          },
          child: const Text(
            Constants.registerUser,
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}

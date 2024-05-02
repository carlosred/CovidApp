import 'package:flutter/material.dart';

import '../../utils/contants.dart';

class LoginImageWidget extends StatelessWidget {
  const LoginImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Constants.loginImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

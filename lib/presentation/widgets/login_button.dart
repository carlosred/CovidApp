import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/contants.dart';
import '../../utils/enum.dart';
import '../../utils/styles.dart';

import 'loader.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.ref,
    required this.status,
    this.onPressed,
  });

  final WidgetRef ref;
  final LoginStatus status;
  final VoidCallback? onPressed;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  List<Widget> _buildButton() {
    List<Widget> result = [];
    switch (widget.status) {
      case LoginStatus.success:
        result = const [
          Icon(
            Icons.done,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            Constants.successfulLogin,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ];
        break;

      case LoginStatus.loading:
        result = const [
          SizedBox(
            height: 20,
            width: 20,
            child: Loader(),
          )
        ];
        break;

      case LoginStatus.login:
        result = const [
          Text(
            Constants.login,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ];
        break;
      default:
        result = const [
          Text(
            Constants.login,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ];
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 27 / 3,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Styles.orangeColor,
          ),
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildButton(),
        ),
      ),
    );
  }
}

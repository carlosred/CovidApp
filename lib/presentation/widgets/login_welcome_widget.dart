import 'package:covid_app/utils/contants.dart';
import 'package:flutter/material.dart';

class LoginWelcomeWidget extends StatelessWidget {
  const LoginWelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 0,
      left: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Constants.welcomeTo,
            softWrap: true,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              Constants.company,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

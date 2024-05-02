import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import 'social_media_widget.dart';

class SocialMediaRowWidget extends StatelessWidget {
  const SocialMediaRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaWidget(
          image: 'assets/images/facebook.png',
          message: Constants.facebook,
        ),
        SocialMediaWidget(
          image: 'assets/images/google.png',
          message: Constants.google,
        ),
        SocialMediaWidget(
          image: 'assets/images/instagram.png',
          message: Constants.instagram,
        ),
      ],
    );
  }
}

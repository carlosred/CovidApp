import 'package:covid_app/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/routes/routes.dart';

class FloatingShowStatesButton extends ConsumerStatefulWidget {
  const FloatingShowStatesButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FloatingShowStatesButtonState();
  }
}

class _FloatingShowStatesButtonState
    extends ConsumerState<FloatingShowStatesButton> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return FloatingActionButton.extended(
      label: const Text(
        Constants.seeMoreDetails,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      onPressed: () async {
        Navigator.of(context).pushNamed(
          Routes.statesRoute,
        );
      },
      tooltip: 'Ver Mas detalles',
      icon: const Icon(
        Icons.list,
        color: Colors.white,
      ),
      backgroundColor: Colors.grey,
      extendedTextStyle: const TextStyle(color: Colors.white),
      isExtended: true,
    );
  }
}

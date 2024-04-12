import 'package:flutter/material.dart';

import '../../utils/contants.dart';

class CovidTotalRowWidget extends StatelessWidget {
  const CovidTotalRowWidget({
    super.key,
    required this.primaryTitle,
    required this.primarySubtitle,
    this.secondaryTitle,
    this.secondarySubtitle,
  });
  final String? primaryTitle,
      secondaryTitle,
      primarySubtitle,
      secondarySubtitle;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 7.0,
              ),
              child: Container(
                height: height * 0.10,
                width: width * 0.50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      primaryTitle ?? Constants.noData,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      primarySubtitle ?? Constants.noData,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: (secondarySubtitle != null && secondaryTitle != null)
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 7.0,
                    ),
                    child: Container(
                      height: height * 0.10,
                      width: width * 0.50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 25,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              secondaryTitle!,
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              secondarySubtitle!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}

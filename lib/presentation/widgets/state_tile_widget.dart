import 'package:covid_app/core/routes/routes.dart';
import 'package:flutter/material.dart';

class StateTileWidget extends StatelessWidget {
  const StateTileWidget({
    super.key,
    required this.width,
    required this.height,
    required this.state,
  });

  final double width;
  final double height;
  final Map<String, dynamic> state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            Routes.statesDetailRoute,
            arguments: state['code'],
          );
        },
        child: Container(
          width: width,
          height: height * 0.1,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: Colors.grey,
                )
              ]),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/states.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state['name'],
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Casos totales:  ${state['positive']}',
                        style: const TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Ultima modificacion: ${state['lastUpdated']}',
                        style: const TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  child: Center(
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.grey[700],
                  size: 35,
                  weight: 30,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

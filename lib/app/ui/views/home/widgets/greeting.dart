import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  const Greeting({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Text(
        "Good Afternoon, $name",
        style: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

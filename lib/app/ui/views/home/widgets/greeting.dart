import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: const Text(
        "Buenos días, Carlos",
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}

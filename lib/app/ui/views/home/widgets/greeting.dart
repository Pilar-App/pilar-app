import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Greeting extends StatelessWidget {
  const Greeting({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final DateFormat formatter = DateFormat("H");
    final String dateFormatted = formatter.format(currentDate);
    final int dateNumber = int.parse(dateFormatted);
    String greeting = "Good Evenning";
    if (dateNumber >= 6 && dateNumber < 12) {
      greeting = "Good Morning";
    } else if (dateNumber >= 12 && dateNumber < 19) {
      greeting = "Good Afternoon";
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 35.0,
        left: 16.0,
        right: 16.0,
        bottom: 15.0,
      ),
      child: Text(
        "$greeting, $name.",
        style: const TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

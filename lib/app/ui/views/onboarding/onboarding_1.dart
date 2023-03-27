import 'package:flutter/material.dart';
import 'package:pilar_app/app/ui/components/toolbar.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Toolbar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [Text("Prueba")],
      ),
    );
  }
}

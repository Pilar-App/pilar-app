import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PreCronotipo extends StatelessWidget {
  const PreCronotipo({super.key});

  Future<void> logout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Cronotipo Page'),
        ElevatedButton(
          onPressed: () async {
            await logout();
            Navigator.pop(context);
          },
          child: Text('Logout'),
        ),
      ])),
    );
  }
}

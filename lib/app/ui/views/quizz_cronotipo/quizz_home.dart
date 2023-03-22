import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';

class QuizzHome extends StatelessWidget {
  const QuizzHome({super.key});

  Future<void> logout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
              ),
              const Text('Quizz Cronotipo'),
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

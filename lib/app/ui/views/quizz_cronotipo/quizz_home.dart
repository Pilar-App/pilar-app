import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizzHome extends StatelessWidget {
  const QuizzHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Theme.of(context).primaryColorDark,

      body: Center(
        child: Column(
          children: [
            SizedBox(
                    height: 60,
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 100,
              margin: const EdgeInsets.only(top: 30, bottom: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/isotipo_blanco.png'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  descriptionCronotype(),
                  SizedBox(
                    height: 50,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/quizzPage');
                    },
                    child: const Text('START TEST', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF33C9F2),
                      elevation: 4,
                      minimumSize: Size.fromHeight(60),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/quizzInfo');
                    },
                    child: const Text('WHY AM I DOING THIS?', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF33C9F2),
                      backgroundColor: Colors.white,
                      elevation: 4,
                      minimumSize: Size.fromHeight(60),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget descriptionCronotype() {
  return Text(
    "Let's first find out what your chronotype is, this will help me to better understand how I can help optimize your time",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

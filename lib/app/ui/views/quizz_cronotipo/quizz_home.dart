import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_controller.dart';

class QuizzHome extends GetView<QuizzController> {
  const QuizzHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Container(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 60.0,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 120,
              margin: const EdgeInsets.only(top: 30, bottom: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/isotipo_blanco.png'),
                ),
              ),
            ),
            Text(
              "Excellent decision, ${controller.user.displayName!.split(" ")[0]}!",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                descriptionCronotype(),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quizzPage');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF33C9F2),
                    elevation: 0,
                    minimumSize: const Size.fromHeight(60),
                  ),
                  child: const Text(
                    'START TEST',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quizzInfo');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF33C9F2),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size.fromHeight(60),
                  ),
                  child: const Text(
                    'WHY AM I DOING THIS?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget descriptionCronotype() {
  return const Text(
    "Let's first find out what your chronotype is, this will help me to better understand how I can help optimize your time",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:pilar_app/app/ui/views/home/widgets/diary.dart';
import 'package:pilar_app/app/ui/views/home/widgets/greeting.dart';
import 'package:pilar_app/app/ui/views/home/widgets/plan_today.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [Greeting(), PlanToday(), Diary()],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pilar_app/app/ui/views/home/widgets/card_schedule.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your schedule",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CardSchedule(
                  title: "Good morning",
                  hour: "8:00 a.m",
                  image: "assets/images/bg_3.jpg",
                  positionImage: Alignment.topCenter,
                ),
                CardSchedule(
                  title: "Good Afternoon",
                  hour: "2:30 p.m",
                  image: "assets/images/bg_2.jpg",
                  positionImage: Alignment.bottomCenter,
                ),
                CardSchedule(
                  title: "Good evenning",
                  hour: "7:00 p.m",
                  image: "assets/images/bg_4.jpg",
                  positionImage: Alignment.bottomCenter,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pilar_app/app/ui/views/home/widgets/card_diary.dart';

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Preparé esta agenda",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.event,
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      size: 22.0,
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      "Hoy",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const CardDiary(
                  title: "Ritual matutino",
                  hour: "8:00 a.m",
                  background: Colors.red,
                ),
                const CardDiary(
                  title: "Ritual vespertino",
                  hour: "2:30 p.m",
                  background: Colors.blue,
                ),
                const CardDiary(
                  title: "Ritual nocturno",
                  hour: "7:00 p.m",
                  background: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PlanToday extends StatelessWidget {
  const PlanToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Nuestro plan para hoy",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18.0),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(254, 87, 34, 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.15),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.assignment_turned_in_outlined,
                        color: Colors.white,
                        size: 22.0,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "Tu objetivo actual",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Escribe tu Lista de Tareas",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          "Hazlo 3 veces esta semana para lograrlo",
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 36.0,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 36.0,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Icon(
                        Icons.three_mp,
                        color: Colors.white,
                        size: 36.0,
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Objetivo en progreso",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

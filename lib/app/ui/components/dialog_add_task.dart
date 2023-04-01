import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/components/dialog_loading.dart';

class DialogAddTask {
  static void showDialog(User user) {
    Get.dialog(
      DialogAddTaskContent(user: user),
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}

class DialogAddTaskContent extends StatefulWidget {
  const DialogAddTaskContent({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _DialogAddTaskContentState createState() => _DialogAddTaskContentState();
}

class _DialogAddTaskContentState extends State<DialogAddTaskContent> {
  final controller = TextEditingController();
  final controllerTime = TextEditingController();

  double _valueQuestion1 = 0;
  double _valueQuestion2 = 0;
  double _valueQuestion3 = 0;
  double _valueQuestion4 = 0;
  double _valueQuestion5 = 0;
  double _valueQuestion6 = 0;
  double _valueQuestion7 = 0;
  double _valueQuestion8 = 0;
  double _valueQuestion9 = 0;
  double _valueQuestion10 = 0;
  double _valueQuestion11 = 0;

  Future createTask({
    required String title,
    required String uid,
    required double hours,
    required double totalEnergy,
  }) async {
    DialogLoading.showDialog();
    final docTask = FirebaseFirestore.instance.collection("taskTest");

    final task = Task(
      uid: uid,
      title: title,
      hours: hours,
      totalEnergy: totalEnergy,
    );

    final json = task.toJson();

    await docTask.add(json);
    DialogLoading.cancelDialog();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 120.0, // todo
      ),
      scrollable: true,
      title: const Text(
        "Add task",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                isCollapsed: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "Title",
                labelStyle: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: TextField(
              controller: controllerTime,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                isCollapsed: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "Hours",
                labelStyle: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "* Keep in mind that the minimum is little or bad and the maximum is a lot or good",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          Container(
            height: 20.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "Physical energy",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            height: 10.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How are you physically?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 10,
              value: _valueQuestion1,
              max: 10,
              label: _valueQuestion1.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion1 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "Emotional energy",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            height: 10.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How much emotional effort do you think this activity requires?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 4,
              value: _valueQuestion2,
              max: 4,
              label: _valueQuestion2.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion2 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How stressful do you feel this activity is?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 4,
              value: _valueQuestion3,
              max: 4,
              label: _valueQuestion3.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion3 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How overwhelmed or overwhelmed do you feel while doing this activity?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 4,
              value: _valueQuestion4,
              max: 4,
              label: _valueQuestion4.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion4 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How demanding do you feel this activity is?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 4,
              value: _valueQuestion5,
              max: 4,
              label: _valueQuestion5.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion5 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How frustrating do you feel this activity is?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 4,
              value: _valueQuestion6,
              max: 4,
              label: _valueQuestion6.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion6 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "Welfare",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            height: 10.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How happy do you feel right now?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 2,
              value: _valueQuestion7,
              max: 10,
              label: _valueQuestion7.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion7 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How stressed are you feeling right now?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 2,
              value: _valueQuestion8,
              max: 10,
              label: _valueQuestion8.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion8 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How connected do you feel to your interpersonal relationships right now?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 2,
              value: _valueQuestion9,
              max: 10,
              label: _valueQuestion9.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion9 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How in control of your life do you feel you are right now?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 2,
              value: _valueQuestion10,
              max: 10,
              label: _valueQuestion10.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion10 = value;
                });
              },
            ),
          ),
          Container(
            height: 5.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "How optimistic are you about your future right now?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 2,
              value: _valueQuestion11,
              max: 10,
              label: _valueQuestion11.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _valueQuestion11 = value;
                });
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Close"),
        ),
        ElevatedButton(
          onPressed: () {
            final title = controller.text;
            final hours = double.parse(controllerTime.text);
            final physicalEnergy = _valueQuestion1;
            final emotionalEnergy = _valueQuestion2 +
                _valueQuestion3 +
                _valueQuestion4 +
                _valueQuestion5 +
                _valueQuestion6;
            final welfareEnergy = _valueQuestion7 +
                _valueQuestion8 +
                _valueQuestion9 +
                _valueQuestion10 +
                _valueQuestion11;

            final energyTotal =
                (physicalEnergy * 0.5 + emotionalEnergy * 0.5) * 1 * hours;

            createTask(
              title: title,
              uid: widget.user.uid,
              totalEnergy: energyTotal,
              hours: hours,
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
          ),
          child: const Text("Add"),
        ),
      ],
    );
  }
}

class Task {
  final String uid;
  final String title;
  final double hours;
  final double totalEnergy;

  Task({
    required this.uid,
    required this.title,
    required this.hours,
    required this.totalEnergy,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'hours': hours,
        'totalEnergy': totalEnergy,
      };

  static Task fromJson(Map<String, dynamic> json) => Task(
        uid: json['uid'],
        title: json['title'],
        hours: json['hours'],
        totalEnergy: json['totalEnergy'],
      );
}

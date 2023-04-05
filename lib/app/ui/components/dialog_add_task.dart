import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/components/dialog_loading.dart';

class DialogAddTask {
  static void showTitleDialog({required User user, String? title}) {
    Get.dialog(
      barrierDismissible: false,
      DialogAddTaskTitle(user: user, title: title),
    );
  }

  static void showContentDialog(User user, String title) {
    Get.dialog(
      barrierDismissible: false,
      DialogAddTaskContent(user: user, title: title),
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}

class DialogAddTaskTitle extends StatefulWidget {
  const DialogAddTaskTitle({Key? key, required this.user, this.title = ""})
      : super(key: key);

  final User user;
  final String? title;

  @override
  _DialogAddTaskTitleState createState() => _DialogAddTaskTitleState();
}

class _DialogAddTaskTitleState extends State<DialogAddTaskTitle> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.title != null ? widget.title! : "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Add task",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      contentPadding: const EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
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
              controller: _controller,
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
            Get.back();
            DialogAddTask.showContentDialog(widget.user, _controller.text);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
          ),
          child: const Text("Next"),
        ),
      ],
    );
  }
}

class DialogAddTaskContent extends StatefulWidget {
  const DialogAddTaskContent({
    Key? key,
    required this.user,
    required this.title,
  }) : super(key: key);

  final User user;
  final String title;

  @override
  _DialogAddTaskContentState createState() => _DialogAddTaskContentState();
}

class _DialogAddTaskContentState extends State<DialogAddTaskContent> {
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  String _labelStartTime = "Select";
  String _labelEndTime = "Select";

  double _valueImportanceFactor = 5.0;
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
    required double totalEnergy,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    DialogLoading.showDialog();
    final docTask = FirebaseFirestore.instance.collection("tasks").doc();

    final task = Task(
      id: docTask.id,
      uid: uid,
      title: title,
      minutes: endTime.difference(startTime).inMinutes,
      totalEnergy: totalEnergy,
      startTime: Timestamp.fromDate(startTime),
      endTime: Timestamp.fromDate(endTime),
    );

    final json = task.toJson();

    await docTask.set(json);
    DialogLoading.cancelDialog();
    Get.back();
  }

  void _selectStartTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      setState(() {
        _startTime = newTime;
        _labelStartTime =
            '${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  void _selectEndTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      setState(() {
        _endTime = newTime;
        _labelEndTime =
            '${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: (MediaQuery.of(context).size.height) / 8, // todo
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
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "Start time",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: OutlinedButton(
              onPressed: _selectStartTime,
              style: ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(
                  color: Color.fromRGBO(190, 190, 190, 1.0),
                  width: 0.5,
                )),
                minimumSize:
                    MaterialStateProperty.all(const Size.fromHeight(41.0)),
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  _labelStartTime,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(100, 100, 100, 1.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Text(
              "End time",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: OutlinedButton(
              onPressed: _selectEndTime,
              style: ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(
                  color: Color.fromRGBO(190, 190, 190, 1.0),
                  width: 0.5,
                )),
                minimumSize:
                    MaterialStateProperty.all(const Size.fromHeight(41.0)),
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  _labelEndTime,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(100, 100, 100, 1.0),
                    fontWeight: FontWeight.w400,
                  ),
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
              "Importance factor",
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Slider(
              divisions: 10,
              value: _valueImportanceFactor,
              min: 0.0,
              max: 10.0,
              label:
                  "${(_valueImportanceFactor / 10).toString()}  |  ${((10 - _valueImportanceFactor) / 10).toString()}",
              onChanged: (double value) {
                setState(() {
                  _valueImportanceFactor = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Physical energy",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "${(_valueImportanceFactor * 10).toInt().toString()}%",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Emotional energy",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "${((10 - _valueImportanceFactor) * 10).toInt().toString()}%",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
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
              "How are you physically?", // todo
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
            DialogAddTask.showTitleDialog(
              user: widget.user,
              title: widget.title,
            );
          },
          child: const Text("Previous"),
        ),
        ElevatedButton(
          onPressed: () {
            final dateTimeStartTime = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              _startTime.hour,
              _startTime.minute,
            );
            final dateTimeEndTime = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              _endTime.hour,
              _endTime.minute,
            );

            final hours =
                (dateTimeEndTime.difference(dateTimeStartTime).inMinutes / 60)
                    .toDouble();
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

            final energyTotal = (physicalEnergy *
                        (_valueImportanceFactor / 10) +
                    emotionalEnergy * ((10 - _valueImportanceFactor) / 10)) *
                0.8 *
                hours;

            createTask(
              title: widget.title,
              uid: widget.user.uid,
              totalEnergy: energyTotal,
              startTime: dateTimeStartTime,
              endTime: dateTimeEndTime,
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
  final String id;
  final String uid;
  final String title;
  final int minutes;
  final double totalEnergy;
  final bool isCompleted;
  final Timestamp startTime;
  final Timestamp endTime;

  Task({
    required this.id,
    required this.uid,
    required this.title,
    required this.minutes,
    required this.totalEnergy,
    this.isCompleted = false,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'title': title,
        'minutes': minutes,
        'totalEnergy': totalEnergy,
        'isCompleted': isCompleted,
        'startTime': startTime,
        'endTime': endTime,
      };

  static Task fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        uid: json['uid'],
        title: json['title'],
        minutes: json['minutes'],
        totalEnergy: json['totalEnergy'],
        isCompleted: json['isCompleted'],
        startTime: json['startTime'],
        endTime: json['endTime'],
      );
}

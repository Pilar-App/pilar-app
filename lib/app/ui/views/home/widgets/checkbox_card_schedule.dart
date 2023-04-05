import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pilar_app/app/ui/components/dialog_add_task.dart';
import 'package:pilar_app/app/ui/components/dialog_loading.dart';

class CheckboxCardSchedule extends StatefulWidget {
  const CheckboxCardSchedule({
    Key? key,
    required this.idTask,
  }) : super(key: key);

  final String idTask;

  @override
  _CheckboxCardScheduleState createState() => _CheckboxCardScheduleState();
}

class _CheckboxCardScheduleState extends State<CheckboxCardSchedule> {
  bool _isChecked = false;

  Future<bool> getTaskStatus() async {
    final docTask =
        FirebaseFirestore.instance.collection("tasks").doc(widget.idTask);

    final response = await docTask.get();

    return Task.fromJson(response.data()!).isCompleted;
  }

  Future changeStatusTask({
    required bool value,
  }) async {
    DialogLoading.showDialog();
    final docTask =
        FirebaseFirestore.instance.collection("tasks").doc(widget.idTask);

    docTask.update({
      'isCompleted': value,
    });

    DialogLoading.cancelDialog();
  }

  @override
  void initState() {
    super.initState();
    getTaskStatus().then((value) {
      setState(() {
        _isChecked = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      activeColor: Colors.white,
      checkColor: Colors.green.shade400,
      onChanged: (newValue) {
        setState(() {
          _isChecked = newValue!;
        });
        changeStatusTask(value: newValue!);
      },
    );
  }
}

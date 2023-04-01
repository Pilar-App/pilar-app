import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/components/dialog_add_task.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';

class YourTasks extends GetView<NavigationController> {
  const YourTasks({Key? key}) : super(key: key);

  Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection("taskTest")
      .where("uid", isEqualTo: controller.user.uid)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Tasks"),
        elevation: 0.0,
      ),
      body: StreamBuilder<List<Task>>(
        stream: readTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error!");
          } else if (snapshot.hasData) {
            final tasks = snapshot.data!;
            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    children: tasks
                        .map(
                          (Task task) => Column(
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                  color: tasks[0].title == task.title
                                      ? Colors.green.shade200
                                      : const Color.fromRGBO(37, 138, 216, 0.1),
                                ),
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 20.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task.title,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Hours: ${task.hours.round()}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Points: ${task.totalEnergy}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogAddTask.showDialog(controller.user);
        },
        elevation: 0.0,
        child: const Icon(
          Icons.add,
          size: 28.0,
        ),
      ),
    );
  }
}

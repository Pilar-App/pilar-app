import 'package:accordion/accordion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/components/dialog_add_task.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';
import 'package:pilar_app/app/ui/views/home/widgets/checkbox_card_schedule.dart';

class CardSchedule extends GetView<NavigationController> {
  const CardSchedule({
    Key? key,
    required this.title,
    required this.hour,
    required this.image,
    required this.type,
    required this.positionImage,
  }) : super(key: key);

  final String title;
  final String hour;
  final String image;
  final int type;
  final AlignmentGeometry positionImage;

  Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection("tasks")
      .where("uid", isEqualTo: controller.user.uid)
      .where(
        "startTime",
        isGreaterThanOrEqualTo: Timestamp.fromDate(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            type == 1 ? 0 : (type == 2 ? 12 : 19),
            0,
            0,
          ),
        ),
      )
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList())
      .map(
        (docs) => docs
            .where(
              (doc) =>
                  doc.startTime.millisecondsSinceEpoch <
                  Timestamp.fromDate(
                    DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      type == 1 ? 12 : (type == 2 ? 19 : 24),
                      0,
                      0,
                    ),
                  ).millisecondsSinceEpoch,
            )
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              hour,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Accordion(
              disableScrolling: true,
              paddingListTop: 0.0,
              paddingListBottom: 0.0,
              paddingListHorizontal: 0.0,
              children: [
                AccordionSection(
                  headerBackgroundColor: Colors.grey.shade200,
                  rightIcon: const SizedBox.shrink(),
                  contentBorderColor: Colors.grey,
                  isOpen: true,
                  headerPadding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 0.0,
                  ),
                  header: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 30.0,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                        alignment: positionImage,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
                          BlendMode.darken,
                        ),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  content: Column(
                    children: [
                      StreamBuilder<List<Task>>(
                        stream: readTasks(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Error!");
                          } else {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.active:
                                final tasks = snapshot.data!;
                                if (tasks.isEmpty) {
                                  return Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "No tasks",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
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
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(15.0),
                                                    ),
                                                    color: task.isCompleted
                                                        ? Colors.green.shade400
                                                        : Colors.grey.shade200,
                                                  ),
                                                  width: double.infinity,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 14.0,
                                                    vertical: 10.0,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${task.startTime.toDate().hour.toString().padLeft(2, '0')}:${task.startTime.toDate().minute.toString().padLeft(2, '0')} - ${task.endTime.toDate().hour.toString().padLeft(2, '0')}:${task.endTime.toDate().minute.toString().padLeft(2, '0')} ~ ( ${Duration(minutes: task.minutes).inHours < 1 ? "${Duration(minutes: task.minutes).inMinutes} minutes" : "${Duration(minutes: task.minutes).inHours} ${Duration(minutes: task.minutes).inHours == 1 ? "hour" : "hours"}"} )",
                                                            style: TextStyle(
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: task
                                                                      .isCompleted
                                                                  ? Colors.white
                                                                  : const Color
                                                                          .fromRGBO(
                                                                      120,
                                                                      120,
                                                                      120,
                                                                      1.0),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 2.0,
                                                          ),
                                                          Text(
                                                            task.title,
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: task
                                                                      .isCompleted
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Text(
                                                            "${task.totalEnergy} points",
                                                            style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: task
                                                                      .isCompleted
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      CheckboxCardSchedule(
                                                        idTask: task.id,
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
                                  );
                                }
                              case ConnectionState.done:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                            }
                          }
                        },
                      ),
                      const Divider(),
                      const Text("Reuniones de Calendar")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

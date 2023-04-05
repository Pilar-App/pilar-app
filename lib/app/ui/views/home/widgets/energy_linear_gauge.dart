import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/components/dialog_add_task.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class EnergyLinearGauge extends GetView<NavigationController> {
  const EnergyLinearGauge({Key? key, required this.title, required this.type})
      : super(key: key);

  final String title;
  final int type;

  Stream<double> getTotalTasksEnergy() => FirebaseFirestore.instance
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
      )
      .map((tasks) => tasks.map((task) => task.totalEnergy))
      .map((totalEnergies) =>
          totalEnergies.reduce((value, element) => value + element));

  Stream<double> getCompletedTasksEnergy() => FirebaseFirestore.instance
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
        (docs) => docs.where((doc) => doc.isCompleted == true).toList(),
      )
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
      )
      .map((tasks) => tasks.map((task) => task.totalEnergy))
      .map((totalEnergies) =>
          totalEnergies.reduce((value, element) => value + element));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: getTotalTasksEnergy(),
        builder: (context, snapshot) {
          return StreamBuilder<double>(
              stream: getCompletedTasksEnergy(),
              builder: (context, snapshot2) {
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
                    final value = snapshot.hasData ? snapshot.data! : 0.0;
                    final value2 = snapshot2.hasData ? snapshot2.data! : 0.0;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        SfLinearGauge(
                          showLabels: false,
                          showTicks: false,
                          axisTrackStyle: const LinearAxisTrackStyle(
                            edgeStyle: LinearEdgeStyle.bothCurve,
                            thickness: 9.0,
                          ),
                          barPointers: [
                            LinearBarPointer(
                              value:
                                  snapshot.hasData ? value2 / value * 100 : 0.0,
                              color: const Color.fromRGBO(37, 138, 216, 1.0),
                              thickness: 9.0,
                              edgeStyle: LinearEdgeStyle.bothCurve,
                            )
                          ],
                        ),
                      ],
                    );
                  case ConnectionState.done:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              });
        });
  }
}

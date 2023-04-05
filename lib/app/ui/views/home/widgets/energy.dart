import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/ui/components/dialog_add_task.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';
import 'package:pilar_app/app/ui/views/home/widgets/energy_linear_gauge.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Energy extends GetView<NavigationController> {
  const Energy({
    Key? key,
    required this.uid,
  }) : super(key: key);

  final String uid;

  Stream<double> getTotalTasksEnergy() => FirebaseFirestore.instance
      .collection("tasks")
      .where("uid", isEqualTo: uid)
      .where(
        "startTime",
        isGreaterThanOrEqualTo: Timestamp.fromDate(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            0,
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
                  doc.endTime.millisecondsSinceEpoch <
                  Timestamp.fromDate(
                    DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      24,
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
      .where("uid", isEqualTo: uid)
      .where(
        "startTime",
        isGreaterThanOrEqualTo: Timestamp.fromDate(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            0,
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
                  doc.endTime.millisecondsSinceEpoch <
                  Timestamp.fromDate(
                    DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      24,
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
    final DateTime currentDate = DateTime.now();
    final DateFormat formatter = DateFormat("EEEE, d");
    final String dateFormatted = formatter.format(currentDate);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.event,
                color: Colors.black,
                size: 24.0,
              ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                dateFormatted,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: 160.0,
                  height: 160.0,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return StreamBuilder<double>(
                        stream: getTotalTasksEnergy(),
                        builder: (context, snapshot) {
                          return StreamBuilder(
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
                                    final value =
                                        snapshot.hasData ? snapshot.data! : 0.0;
                                    final value2 = snapshot2.hasData
                                        ? snapshot2.data!
                                        : 0.0;
                                    return SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          showLabels: false,
                                          showTicks: false,
                                          startAngle: 270,
                                          endAngle: 270,
                                          radiusFactor: 0.8,
                                          isInversed: true,
                                          axisLineStyle: const AxisLineStyle(
                                            thicknessUnit: GaugeSizeUnit.factor,
                                            thickness: 0.15,
                                          ),
                                          annotations: <GaugeAnnotation>[
                                            GaugeAnnotation(
                                              axisValue: 40,
                                              positionFactor: 0.1,
                                              widget: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Text(
                                                        '$value2',
                                                        style: const TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' / $value',
                                                        style: const TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Text(
                                                    "points",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                              value: snapshot.hasData
                                                  ? value2 / value * 100
                                                  : 0.0,
                                              cornerStyle: value == value2
                                                  ? CornerStyle.bothFlat
                                                  : CornerStyle.bothCurve,
                                              enableAnimation: true,
                                              animationDuration: 1200,
                                              sizeUnit: GaugeSizeUnit.factor,
                                              color: const Color.fromRGBO(
                                                  37, 138, 216, 1.0),
                                              // color: Colors.red,
                                              width: 0.15,
                                            ),
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
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            EnergyLinearGauge(
                              title: "Morning",
                              type: 1,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            EnergyLinearGauge(
                              title: "Afternoon",
                              type: 2,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            EnergyLinearGauge(
                              title: "Evenning",
                              type: 3,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.lessEnergy);
                      },
                      color: const Color.fromRGBO(73, 92, 104, 1.0),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      elevation: 0,
                      child: const Icon(
                        Icons.flash_off,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Energy",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "drains",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        DialogAddTask.showTitleDialog(user: controller.user);
                      },
                      color: const Color.fromRGBO(37, 138, 216, 1.0),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      elevation: 0,
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "To-dos",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.boostYourWellness);
                      },
                      color: const Color.fromRGBO(73, 92, 104, 1.0),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      elevation: 0,
                      child: const Icon(
                        Icons.volunteer_activism,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Boost your",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "wellness",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

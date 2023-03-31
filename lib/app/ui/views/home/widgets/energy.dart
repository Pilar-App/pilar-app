import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Energy extends StatelessWidget {
  const Energy({Key? key}) : super(key: key);

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
                  width: 150.0,
                  height: 150.0,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            showLabels: false,
                            showTicks: false,
                            startAngle: 270,
                            endAngle: 270,
                            radiusFactor: 0.8,
                            axisLineStyle: const AxisLineStyle(
                              thicknessUnit: GaugeSizeUnit.factor,
                              thickness: 0.15,
                            ),
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                axisValue: 40,
                                positionFactor: 0.1,
                                widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          ' / 10',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "points",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            pointers: const <GaugePointer>[
                              RangePointer(
                                value: 80,
                                cornerStyle: CornerStyle.bothFlat,
                                enableAnimation: true,
                                animationDuration: 1200,
                                sizeUnit: GaugeSizeUnit.factor,
                                color: Color.fromRGBO(37, 138, 216, 1.0),
                                // color: Colors.red,
                                width: 0.15,
                              ),
                            ],
                          ),
                        ],
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
                          children: [
                            const Text(
                              "Morning",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            SfLinearGauge(
                              showLabels: false,
                              showTicks: false,
                              barPointers: const [
                                LinearBarPointer(
                                  value: 65,
                                  color: Color.fromRGBO(37, 138, 216, 1.0),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Afternoon",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            SfLinearGauge(
                              showLabels: false,
                              showTicks: false,
                              barPointers: const [
                                LinearBarPointer(
                                  value: 85,
                                  color: Color.fromRGBO(37, 138, 216, 1.0),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Night",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            SfLinearGauge(
                              showLabels: false,
                              showTicks: false,
                              barPointers: const [
                                LinearBarPointer(
                                  value: 15,
                                  color: Color.fromRGBO(37, 138, 216, 1.0),
                                )
                              ],
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
                      onPressed: () {},
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
                      "Less",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "energy",
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
                        Get.toNamed(AppRoutes.yourTasks);
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
                      "Your",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "Tasks",
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
                      onPressed: () {},
                      color: const Color.fromRGBO(73, 92, 104, 1.0),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      elevation: 0,
                      child: const Icon(
                        Icons.flash_on,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "More",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "energy",
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

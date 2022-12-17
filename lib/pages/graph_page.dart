import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/graph_controller.dart';
import '../utilities/line_graph.dart';
import '../utilities/widgets.dart';

class Chart extends StatelessWidget {
  final String coin;
  final controller = Get.put(Controller());
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a)
  ];

  Chart({required this.coin});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  const SizedBox(
                    height: 37,
                  ),
                  const GraphHeading(),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    coin,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    flex: 2,
                    child: LineGraph(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.minX.value = 20;
                          controller.maxX.value = 110;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value == 20
                              ? MaterialStateProperty.all(Colors.grey[800])
                              : MaterialStateProperty.all(Colors.grey[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: const CustomGraphText(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontsize: 20,
                          text: "1m",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.minX.value = 80;
                          controller.maxX.value = 110;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value == 80
                              ? MaterialStateProperty.all(Colors.grey[800])
                              : MaterialStateProperty.all(Colors.grey[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: const CustomGraphText(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontsize: 20,
                          text: "3m",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.minX.value = 103;
                          controller.maxX.value = 110;
                        },
                        style: ButtonStyle(
                          backgroundColor: controller.minX.value == 103
                              ? MaterialStateProperty.all(Colors.grey[800])
                              : MaterialStateProperty.all(Colors.grey[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: const CustomGraphText(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontsize: 20,
                          text: "1w",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 500,
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomGraphText(
                                  color: Colors.white70,
                                  text: "Min. Value",
                                  fontsize: 10,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                height: 8,
                              ),
                              CustomGraphText(
                                  color: Colors.white70,
                                  text: controller.minValue.value.toString(),
                                  fontsize: 20,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomGraphText(
                                  text: "Max. Value",
                                  color: Colors.white70,
                                  fontsize: 10,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                height: 8,
                              ),
                              CustomGraphText(
                                  color: Colors.white70,
                                  text: controller.maxValue.value.toString(),
                                  fontsize: 20,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(controller.minValue.value.toString()),
                  RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Max Price :",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        TextSpan(text: controller.maxValue.toString())
                      ]))
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

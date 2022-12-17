import 'package:crypto_price_prediction/pages/graph_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/graph_controller.dart';

class BottomCard extends StatelessWidget {
  final controller = Get.put(Controller());


  final String coinForApi;
  final String cryptoCurrency;
  final String subtitle;
  final String price;
  final Icon icon;
  final String desc;
  BottomCard({
    super.key,
    required this.coinForApi,
    required this.cryptoCurrency,
    required this.subtitle,
    required this.icon,
    required this.price,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(
              height: 25,
            ),
            Text(
              cryptoCurrency,
              style: TextStyle(fontSize: 30),
            ),
            Text(subtitle),
            SizedBox(
              height: 25,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  child: ListTile(
                    title: Center(child: Text("RANK")),
                    subtitle: Center(child: Text("256")),
                  ),
                ),
                Container(
                  width: 120,
                  child: ListTile(
                    title: Center(child: Text("LIVE PRICE")),
                    subtitle: Center(child: Text("256")),
                  ),
                ),
                Container(
                  width: 130,
                  child: ListTile(
                    title: Center(child: Text("MARKET CAP")),
                    subtitle: Center(child: Text("256")),
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  controller.fetchPrice(coinForApi);
                  print("pressed");
                  Get.to(() => Chart(
                        coin: cryptoCurrency,
                      ));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "PRICE HISTORY",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}

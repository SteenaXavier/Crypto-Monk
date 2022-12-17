import 'package:crypto_price_prediction/controller/coin_details_controller.dart';
import 'package:crypto_price_prediction/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text("This is the Welcome page"),
          ),
          Text(
              "This is about the crypto price predictor an app made by using flutter with python as backend"),
          GestureDetector(
              child: Icon(Icons.abc),
              onTap: () {
                
                Get.to(() => HomePage());
                // Get.to(HomePage());
              }),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../model/price_point.dart';

class Controller extends GetxController {
  var actualPriceList = [].obs;
  var predictedPriceList = [].obs;
  var isLoading = true.obs;
  var minX = 20.obs;
  var maxX = 110.obs;
  var minValue = 0.0.obs;
  var maxValue = 0.0.obs;

  fetchPrice(String coin) async {
    isLoading.value = true;
    try {
      var uri = Uri.https('gktc123.pythonanywhere.com', coin);
      final response = await http.get(uri);
      print("Status Code:${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var json = jsonDecode(jsonString);
        var a = List<double>.from(json['actual_price']);
        var p = List<double>.from(json['predicted_price']);

        print(p);
        actualPriceList.value = a
            .mapIndexed(((index, element) =>
                PricePoint(x: index.toDouble(), y: element)))
            .toList();
        predictedPriceList.value = p
            .mapIndexed(((index, element) =>
                PricePoint(x: index.toDouble(), y: element)))
            .toList();
        //Get the minimum value in a list.
        minValue.value =
            a.reduce((current, next) => current < next ? current : next);
          
        print(minValue);
        // Get the maximum value in a list.
        maxValue.value =
            a.reduce((current, next) => current > next ? current : next);
        print(maxValue);

      } else {
        print("error fetching data");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

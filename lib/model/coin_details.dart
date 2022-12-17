import 'dart:convert';

import 'package:http/http.dart' as http;

const baseURL = "https://api.coincap.io/v2/assets/";

class CoinDetails {
  final String coin;

  CoinDetails({required this.coin});

  fetchDetails(coin) async {
    final id;
    final rank;
    final priceUSD;
    final symbol;
    final marketCapUSD;
    try {
      var uri = Uri.https(baseURL, coin);
      final response = await http.get(uri);
      print("Status Code:${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var json = jsonDecode(jsonString);
        id = json['data']['id'];
        rank = json['data']['rank'];
        symbol = json['data']['symbol'];
        priceUSD = json['data']['prceUsd'];
        marketCapUSD = json['data']['marketCapUsd'];

        return Map();
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}

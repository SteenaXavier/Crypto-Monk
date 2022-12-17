import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const baseURL = "api.coincap.io";
const api = "/v2/assets/";

class CoinDetailsController extends GetxController {
  
  var bitcoinId = "No data".obs;
  var bitcoinRank = "No data".obs;
  var bitcoinSymbol = "No data".obs;
  var bitcoinPriceUSD = "No data".obs;
  var bitcoinMarketCapUsd = "No data".obs;

  var ethereumId = "No data".obs;
  var ethereumRank = "No data".obs;
  var ethereumSymbol = "No data".obs;
  var ethereumPriceUSD = "No data".obs;
  var ethereumMarketCapUsd = "No data".obs;

  var dogecoinId = "No data".obs;
  var dogecoinRank = "No data".obs;
  var dogecoinSymbol = "No data".obs;
  var dogecoinPriceUSD = "No data".obs;
  var dogecoinMarketCapUsd = "No data".obs;

  var usdtId = "No data".obs;
  var usdtRank = "No data".obs;
  var usdtSymbol = "No data".obs;
  var usdtPriceUSD = "No data".obs;
  var usdtMarketCapUsd = "No data".obs;

  var isLoading = true.obs;

  fetchDetails() async {
    isLoading.value = true;
    try {
      var uri = Uri.https(
        baseURL,
        api,
      );
      final response = await http.get(uri);
      print("Status Code:${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var json = jsonDecode(jsonString);
        print(json['data'][0]['id']);
        bitcoinId.value = json['data'][0]['id'];
        bitcoinRank.value = json['data'][0]['rank'];
        bitcoinSymbol.value = json['data'][0]['symbol'];
        bitcoinPriceUSD.value = json['data'][0]['prceUsd'];
        bitcoinMarketCapUsd.value = json['data'][0]['marketCapUsd'];

        ethereumId.value = json['data'][1]['id'];
        ethereumRank.value = json['data'][1]['rank'];
        ethereumSymbol.value = json['data'][1]['symbol'];
        ethereumPriceUSD.value = json['data'][1]['prceUsd'];
        ethereumMarketCapUsd.value = json['data'][1]['marketCapUsd'];

        usdtId.value = json['data'][2]['id'];
        usdtRank.value = json['data'][2]['rank'];
        usdtSymbol.value = json['data'][2]['symbol'];
        usdtPriceUSD.value = json['data'][2]['prceUsd'];
        usdtMarketCapUsd.value = json['data'][2]['marketCapUsd'];

        dogecoinId.value = json['data'][7]['id'];
        dogecoinRank.value = json['data'][7]['rank'];
        dogecoinSymbol.value = json['data'][7]['symbol'];
        dogecoinPriceUSD.value = json['data'][7]['prceUsd'];
        dogecoinMarketCapUsd.value = json['data'][7]['marketCapUsd'];
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}


// "data": {
// "id": "bitcoin",
// "rank": "1",
// "symbol": "BTC",
// "name": "Bitcoin",
// "supply": "19235968.0000000000000000",
// "maxSupply": "21000000.0000000000000000",
// "marketCapUsd": "321571709723.9850511875409920",
// "volumeUsd24Hr": "9822957153.8439974538935162",
// "priceUsd": "16717.2096420614263440",
// "changePercent24Hr": "-4.2940340970025076",
// "vwap24Hr": "16927.3117247869954029",
// "explorer": "https://blockchain.info/"
// },

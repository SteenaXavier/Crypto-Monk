import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:crypto_price_prediction/controller/coin_details_controller.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:crypto_price_prediction/utilities/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final coinDetailsController = Get.put(CoinDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldBG,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        // if (coinDetailsController.isLoading.value) {
        //   return Center(
        //     child: const CircularProgressIndicator(),
        //   );
        // } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                coinForApi: 'bitcoin',
                cryptoCurrency: coinDetailsController.bitcoinSymbol.value,
                subtitle: coinDetailsController.bitcoinId.value,
                icon: const Icon(CryptoFontIcons.BTC),
                price: coinDetailsController.bitcoinPriceUSD.value,
                desc: btc_desc,
              ),
              CryptoCard(
                coinForApi: 'ethereum',
                cryptoCurrency: coinDetailsController.ethereumSymbol.value,
                subtitle: coinDetailsController.ethereumId.value,
                icon: const Icon(CryptoFontIcons.ETH),
                price: coinDetailsController.ethereumPriceUSD.value.toString(),
                desc: eth_desc,
              ),
              CryptoCard(
                coinForApi: 'dogecoin',
                cryptoCurrency:
                    coinDetailsController.dogecoinSymbol.value.toString(),
                subtitle: coinDetailsController.dogecoinId.value.toString(),
                icon: const Icon(CryptoFontIcons.DOGE),
                price: coinDetailsController.dogecoinPriceUSD.value.toString(),
                desc: polygon_desc,
              ),
              CryptoCard(
                coinForApi: 'usdt',
                cryptoCurrency:
                    coinDetailsController.usdtSymbol.value.toString(),
                subtitle: coinDetailsController.usdtId.value.toString(),
                icon: const Icon(CryptoFontIcons.USDT),
                price: coinDetailsController.usdtPriceUSD.value.toString(),
                desc: bnb_desc,
              ),
            ],
          );
        }
      ),
    );
  }
}

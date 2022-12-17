import 'package:crypto_price_prediction/utilities/bottom_card.dart';
import 'package:crypto_price_prediction/utilities/constants.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String cryptoCurrency;
  final String subtitle;
  final String price;
  final Icon icon;
  final String desc;
  final String coinForApi;
  const CryptoCard(
      {super.key,
      required this.coinForApi,
      required this.cryptoCurrency,
      required this.subtitle,
      required this.icon,
      required this.price,
      required this.desc});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          builder: ((context) => Container(
                color: Colors
                    .transparent, //could change this to Color(0xFF737373),
                //so you don't have to change MaterialApp canvasColor
                child: BottomCard(
                  coinForApi: coinForApi,
                  cryptoCurrency: cryptoCurrency,
                  price: price,
                  subtitle: subtitle,
                  icon: icon,
                  desc: desc,
                ),
              )),
        );
      },
      child: Container(
        decoration: kcryptoCardColour,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              icon,
              Container(
                width: 250,
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text(cryptoCurrency, style: kcoinAbbreviationStyle),
                  subtitle: Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              Text(
                price,
                style: kcoinPriceStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

const String btc_desc =
    "On 3 January 2009, the bitcoin network was created when Nakamoto mined the starting block of the chain, known as the genesis block.";
const String eth_desc =
    "Ethereum was conceived in 2013 by programmer Vitalik Buterin";
const String polygon_desc =
    " Polygon aka \"Ethereum's Internet of Blockchains\" launched under the name Matic Network in 2017 by four software engineers";
const String bnb_desc =
    "Binance Coin was created in July 2017 and initially worked on the ethereum blockchain with the token ERC-20";

const kcryptoCardColour = BoxDecoration(
    gradient: LinearGradient(
  colors: [Color.fromARGB(255, 17, 38, 18), Color(0xff171717)],
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
));

const kcoinSymbolStyle = TextStyle(color: Colors.white70);
const kscaffoldBG = Color.fromARGB(96, 63, 59, 59);

const kcoinAbbreviationStyle = TextStyle(color: Colors.white70);
const kcoinPriceStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 29, 147, 33),
    fontSize: 14);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGraphText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  const CustomGraphText(
      {Key? key,
      required this.text,
      required this.fontsize,
      required this.fontWeight,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class GraphHeading extends StatelessWidget {
  const GraphHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Predicted Price Vs Actual Price',
      style: GoogleFonts.abel(
        textStyle: TextStyle(
          color: Color(0xff827daa),
          fontSize: 16,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}

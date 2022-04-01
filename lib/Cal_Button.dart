import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int textColor;
  final double textSize;
  final Function callback;
  const CalculatorButton({
    Key? key,
    required this.text,
    this.textColor = 0xFF000000,
    this.textSize = 36,
     required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 75,
        width: 75,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(text,
              style: GoogleFonts.abel(
                textStyle: TextStyle(
                  fontSize: textSize,
                ),
              )),
        ),
      ),
    );
  }
}

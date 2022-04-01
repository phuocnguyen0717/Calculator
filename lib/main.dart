import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculator_test/Cal_Button.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      home: new Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {

  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final NumberFormat f = NumberFormat.decimalPattern('en');
  String _history = "0";
  String _cal = "";
  String _chuoi = '';
  String kq = '';
  String _out = '';
  List<String> dau = ['+','-','*','/'];
  void click(String text) {
    if(dau.contains(text) == true){
      setState(() {
        if(_chuoi == '')
          _chuoi = _out + text;
        else
          _chuoi = _chuoi + _out + text;
        _cal = '';
      });
    }else{
      setState(() {
        _cal += text;
        _cal = f.format(double.parse(_cal));
        _out = _cal;
      });
    }
  }

  void allClear(String text) {
    setState(() {
      _history = "0";
      _cal = "0";
    });
  }

  void clear(String text) {
    setState(() {
      _cal = "0";
    });
  }

  void del(String text) {
    setState(() {
      _cal = _cal.substring(0, _cal.length - 1);
      if (_cal == "") {
        _cal = "0";
      }
    });
  }


  void result(String text) {
    String a = (_chuoi + _out).replaceAll(',', '');
    Parser p = Parser(); // tao 1 toan hoc 12tu 1 chuoi dau vao.
    Expression e = p.parse(a); //doi tuong ho tro phep toan
    ContextModel c = ContextModel(); // theo doi su kien thay doi cua cac bien va ham

    setState(() {
      // _history = _chuoi + _cal;
      _cal = '';
      _chuoi = f.format(e
          .evaluate(EvaluationType.REAL, c))
          .toString(); // xu ly va dua ra ket qua bieu thuc
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_chuoi);
    return Scaffold(
      backgroundColor: Color(0xFF173CC9),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Text(
                f.format(double.parse(_history)),

                style: GoogleFonts.abel(
                    textStyle: TextStyle(fontSize: 40, color: Colors.grey)),
              ),
            ),
            Container(
              child: Text(
                _chuoi + _cal,
                style: GoogleFonts.abel(
                    textStyle: TextStyle(fontSize: 40, color: Colors.white)),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: "AC",
                  textColor: 0x42000000,
                  callback: allClear,
                ),
                CalculatorButton(
                    text: "C", textColor: 0x42000000, callback: clear),
                CalculatorButton(
                    text: "%", textColor: 0x42000000, callback: click),
                CalculatorButton(
                    text: "⌫", textColor: 0x42000000, callback: del),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: "7",
                  textColor: 0xFF65BDAC,
                  callback: click,
                ),
                CalculatorButton(
                    text: "8", textColor: 0xFF65BDAC, callback: click),
                CalculatorButton(
                    text: "9", textColor: 0xFF65BDAC, callback: click),
                CalculatorButton(
                    text: "/", textColor: 0x42000000, callback: click),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: "4",
                  textColor: 0xFF65BDAC,
                  callback: click,
                ),
                CalculatorButton(
                    text: "5", textColor: 0xFF65BDAC, callback: click),
                CalculatorButton(
                    text: "6", textColor: 0xFF65BDAC, callback: click),
                CalculatorButton(
                    text: "*", textColor: 0x42000000, callback: click),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: "1",
                  textColor: 0xFF65BDAC,
                  callback: click,
                ),
                CalculatorButton(
                    text: "2", textColor: 0xFF65BDAC, callback: click),
                CalculatorButton(
                    text: "3", textColor: 0xFF65BDAC, callback: click),
                CalculatorButton(
                    text: "-", textColor: 0x42000000, callback: click),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: "0",
                  textColor: 0xFF65BDAC,
                  callback: click,
                ),
                CalculatorButton(
                    text: ".", textColor: 0xFF65BDAC, callback: click),
                CalculatorButton(
                    text: "=", textColor: 0x42000000, callback: result),
                CalculatorButton(
                    text: "+", textColor: 0x42000000, callback: click),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

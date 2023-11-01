import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        input = '';
        num1 = 0;
        num2 = 0;
        operand = '';
      });
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      setState(() {
        num1 = double.parse(input);
        operand = buttonText;
        input = '';
      });
    } else if (buttonText == '=') {
      setState(() {
        num2 = double.parse(input);
        if (operand == '+') {
          input = (num1 + num2).toString();
        }
        if (operand == '-') {
          input = (num1 - num2).toString();
        }
        if (operand == '*') {
          input = (num1 * num2).toString();
        }
        if (operand == '/') {
          input = (num1 / num2).toString();
        }
        num1 = 0;
        num2 = 0;
        operand = '';
      });
    } else {
      setState(() {
        input += buttonText;
      });
    }
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my Application'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                input,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              buildButton('7', 1, Colors.grey),
              buildButton('8', 1, Colors.grey),
              buildButton('9', 1, Colors.grey),
              buildButton('/', 1, Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('4', 1, Colors.grey),
              buildButton('5', 1, Colors.grey),
              buildButton('6', 1, Colors.grey),
              buildButton('*', 1, Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1', 1, Colors.grey),
              buildButton('2', 1, Colors.grey),
              buildButton('3', 1, Colors.grey),
              buildButton('-', 1, Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('C', 1, Colors.red),
              buildButton('0', 1, Colors.grey),
              buildButton('=', 1, Colors.green),
              buildButton('+', 1, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}

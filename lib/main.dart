import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorLayout3(),
    );
  }
}

class CalculatorLayout3 extends StatefulWidget {
  const CalculatorLayout3({super.key});

  @override
  State<CalculatorLayout3> createState() => _CalculatorLayout3State();
}

class _CalculatorLayout3State extends State<CalculatorLayout3> {
  String display = "0";

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        display = "0";
        return;
      }
      if (value == "=") {
        return;
      }

      final isDigitOrDot = RegExp(r'^[0-9.]$').hasMatch(value);
      if (isDigitOrDot) {
        if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      } else {
        if (display == "0") {
          display = "0" + value;
        } else {
          display += value;
        }
      }
    });
  }

  // สร้างปุ่มแบบเดียวกันเพื่อใช้งานซ้ำได้
  Widget buildButton(
    String text, {
    double flex = 1,
    Color? bg,
    Color? txtColor,
  }) {
    return Expanded(
      flex: flex.toInt(),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            backgroundColor: bg ?? Colors.grey[200],
            foregroundColor: txtColor ?? Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12, 200, 16, 12),
            alignment: Alignment.centerRight,
            child: Text(
              display,
              style: const TextStyle(fontSize: 44, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const Divider(height: 1),

          Expanded(
            child: Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      buildButton("C"),
                      buildButton("%", bg: Colors.grey[300]),
                      buildButton("/", bg: Colors.blue[100]),
                      buildButton("×", bg: Colors.blue[100]),
                    ],
                  ),

                  Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton(
                        "-",
                        bg: const Color.fromRGBO(187, 222, 251, 1),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("+", bg: Colors.blue[100]),
                    ],
                  ),

                  Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton(
                        "=",
                        bg: Colors.orange[300],
                        txtColor: Colors.white,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      buildButton("0", flex: 2),
                      buildButton("."),
                      buildButton("⌫", bg: Colors.grey[300]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

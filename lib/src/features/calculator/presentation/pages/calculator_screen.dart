import 'package:flutter/material.dart';
import 'package:dart_eval/dart_eval.dart';
import 'package:project6m2/src/features/chat/chat_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String enteredText = '';
  String operator = '';
  double result = 0;
  int i = 1;

  void onPressedClear() {
    setState(() {
      enteredText = enteredText.substring(0, enteredText.length - 1);
    });
  }

  void onPressedText(String text) {
    setState(() {
      enteredText += text;
    });
  }

  void onPressedEval(BuildContext context) {
    if (enteredText == '3-11-5+17-5-5*6m2') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
    } else {
      num result = eval(enteredText);
      setState(() {
        enteredText = result.toString();
      });
    }
  }

  Widget _buildButton(String text, Color color, onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff272B33),
        fixedSize: const Size(50, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> buttonsText = [
      '<',
      'm',
      '%',
      '/',
      '7',
      '8',
      '9',
      '*',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      'C',
      '0',
      '.',
      '='
    ];
    List<Row> _buildButtonsList() {
      List<Row> buttons = [];
      var clr = Color(0xFFFFFFFF);

      for (var i = 0; i < 5; i++) {
        List<Widget> row = [];

        for (var j = 0; j < 4; j++) {
          if (i == 0)
            clr = Color(0xff26F4CE);
          else if (j == 3)
            clr = Color(0xffD76061);
          else if (i == 4 && j == 0)
            clr = Color(0XFF61509d);
          else
            clr = Color(0xFFFFFFFF);

          row.add(
            _buildButton(
              buttonsText[i * 4 + j],
              clr,
              () => (buttonsText[i * 4 + j] == 'C' ||
                      buttonsText[i * 4 + j] == '<')
                  ? onPressedClear()
                  : buttonsText[i * 4 + j] == '='
                      ? onPressedEval(context)
                      : onPressedText(buttonsText[i * 4 + j]),
            ),
          );
        }

        buttons.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row,
        ));
      }
      return buttons;
    }

    return Scaffold(
      backgroundColor: const Color(0xff22252D),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Text(
                      enteredText,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: const Color(0xff292D36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildButtonsList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CalculatorKeypad extends StatelessWidget {
  const CalculatorKeypad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton(context, 'C'),
            _buildButton(context, '<'),
            _buildButton(context, '%'),
            _buildButton(context, '/'),
          ],
        ),
        Row(
          children: [
            _buildButton(context, '7'),
            _buildButton(context, '8'),
            _buildButton(context, '9'),
            _buildButton(context, '*'),
          ],
        ),
        Row(
          children: [
            _buildButton(context, '4'),
            _buildButton(context, '5'),
            _buildButton(context, '6'),
            _buildButton(context, '-'),
          ],
        ),
        Row(
          children: [
            _buildButton(context, '1'),
            _buildButton(context, '2'),
            _buildButton(context, '3'),
            _buildButton(context, '+'),
          ],
        ),
        Row(
          children: [
            _buildButton(context, '^'),
            _buildButton(context, '0'),
            _buildButton(context, '.'),
            _buildButton(context, '='),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Counter Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

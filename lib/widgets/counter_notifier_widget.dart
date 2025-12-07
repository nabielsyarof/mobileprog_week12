import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifiers/counter_notifier.dart';

class CounterNotifierWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterNotifier = Provider.of<CounterNotifier>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Counter: ${counterNotifier.counter}',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: counterNotifier.increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}

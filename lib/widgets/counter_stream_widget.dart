import 'dart:async';
import 'package:flutter/material.dart';

class CounterStreamWidget extends StatelessWidget {
  Stream<int> counterStream() {
    StreamController<int>? controller;
    controller = StreamController<int>.broadcast(
      onListen: () async {
        int i = 0;
        while (true) {
          await Future.delayed(Duration(seconds: 1));
          controller!.add(i++);
        }
      },
      onCancel: () {
        controller?.close();
      },
    );
    return controller.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counterStream(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) return Text("Loading...");
        return Text(
          snapshot.data.toString(),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  CounterNotifier() {
    _loadCounter();
  }

  void increment() {
    _counter++;
    notifyListeners();
    _saveCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  void _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _counter);
  }
}

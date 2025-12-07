import 'package:flutter/material.dart';
import '../locator.dart';
import '../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = locator<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil User'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.account_circle, size: 80, color: Colors.indigo),
                SizedBox(height: 20),
                Text(
                  'Username:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  controller.user ?? '-',
                  style: TextStyle(fontSize: 24, color: Colors.indigo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

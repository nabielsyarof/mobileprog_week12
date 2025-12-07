import 'package:flutter/material.dart';
import '../locator.dart';
import '../controllers/auth_controller.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = locator<AuthController>();
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 80, color: Colors.indigo),
                SizedBox(height: 16),
                Text(
                  "Welcome! Please login",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
                SizedBox(height: 32),
                TextField(
                  controller: userCtrl,
                  decoration: InputDecoration(labelText: "Username", prefixIcon: Icon(Icons.person)),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passCtrl,
                  decoration: InputDecoration(labelText: "Password", prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                SizedBox(height: 28),
                controller.loading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.login),
                        label: Text("Login"),
                        onPressed: () async {
                          final success = await controller.login(userCtrl.text, passCtrl.text);
                          if (success) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => DashboardPage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login gagal"))
                            );
                          }
                        },
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
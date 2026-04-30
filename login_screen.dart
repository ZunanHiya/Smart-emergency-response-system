import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  String role = "User";

  void login() {
    if (role == "User") {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (role == "Dispatcher") {
      Navigator.pushReplacementNamed(context, '/dispatcher');
    } else if (role == "Responder") {
      Navigator.pushReplacementNamed(context, '/responder');
    } else {
      Navigator.pushReplacementNamed(context, '/admin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_hospital, size: 80, color: Colors.red),

            SizedBox(height: 20),

            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),

            SizedBox(height: 10),

            DropdownButtonFormField(
              value: role,
              items: [
                "User",
                "Dispatcher",
                "Responder",
                "Admin",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) {
                setState(() {
                  role = val.toString();
                });
              },
              decoration: InputDecoration(labelText: "Select Role"),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: login, child: Text("Login")),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
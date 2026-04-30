import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final name = TextEditingController();
  final phone = TextEditingController();
  final nid = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();

  Widget field(controller, label, icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            field(name, "Full Name", Icons.person),
            field(phone, "Phone", Icons.phone),
            field(nid, "NID Number", Icons.badge),
            field(email, "Email", Icons.email),
            field(address, "Address", Icons.location_on),
            field(password, "Password", Icons.lock),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
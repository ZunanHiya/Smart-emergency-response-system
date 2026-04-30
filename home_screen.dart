import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget card(context, title, icon, route, color) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency Dashboard")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 🚨 SOS BUTTON
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Icon(Icons.warning, size: 60, color: Colors.white),
                  Text(
                    "SOS EMERGENCY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // STATUS CARD
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("System Status: ACTIVE"),
                  Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                card(context, "Report", Icons.warning, '/report', Colors.pink),
                card(context, "Track", Icons.map, '/track', Colors.blue),
              ],
            ),

            Row(
              children: [
                card(
                  context,
                  "Dispatcher",
                  Icons.dashboard,
                  '/dispatcher',
                  Colors.green,
                ),
                card(
                  context,
                  "Responder",
                  Icons.local_hospital,
                  '/responder',
                  Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
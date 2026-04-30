import 'package:flutter/material.dart';

class TrackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tracking")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.local_hospital, size: 80, color: Colors.red),
            SizedBox(height: 20),

            Text(
              "Ambulance On The Way",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text("Estimated Arrival: 5 mins"),

            SizedBox(height: 30),

            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
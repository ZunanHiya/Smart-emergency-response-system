import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  final List<Map> stats = [
    {"title": "Active Emergencies", "value": "12", "color": Colors.red},
    {"title": "Responders Online", "value": "8", "color": Colors.green},
    {"title": "Pending Requests", "value": "5", "color": Colors.orange},
  ];

  Widget statCard(title, value, color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionTile(icon, title, color) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Control Center")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 📊 STATS ROW
            Row(
              children: stats
                  .map((e) => statCard(e['title'], e['value'], e['color']))
                  .toList(),
            ),

            SizedBox(height: 20),

            // ⚙️ MANAGEMENT SECTION
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "System Management",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  actionTile(Icons.people, "Manage Users", Colors.blue),
                  actionTile(
                    Icons.local_hospital,
                    "Manage Responders",
                    Colors.green,
                  ),
                  actionTile(Icons.warning, "View Emergency Logs", Colors.red),
                  actionTile(Icons.settings, "System Settings", Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

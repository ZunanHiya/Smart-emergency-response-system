import 'package:flutter/material.dart';

class DispatcherScreen extends StatelessWidget {
  final List<Map> emergencies = [
    {"type": "Medical", "status": "Pending"},
    {"type": "Fire", "status": "Assigned"},
    {"type": "Crime", "status": "Pending"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dispatcher Panel")),

      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: emergencies.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              title: Text(emergencies[i]['type']),
              subtitle: Text("Status: ${emergencies[i]['status']}"),
              trailing: ElevatedButton(onPressed: () {}, child: Text("Assign")),
            ),
          );
        },
      ),
    );
  }
}
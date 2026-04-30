import 'package:flutter/material.dart';

class ResponderScreen extends StatefulWidget {
  @override
  _ResponderScreenState createState() => _ResponderScreenState();
}

class _ResponderScreenState extends State<ResponderScreen> {
  String status = "Available";

  List<Map<String, String>> assignedCases = [
    {"type": "Medical Emergency", "location": "Sector 5", "priority": "High"},
    {"type": "Fire Incident", "location": "Block B", "priority": "Critical"},
  ];

  Color getStatusColor() {
    if (status == "Available") return Colors.green;
    if (status == "Busy") return Colors.orange;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Responder Dashboard")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔵 STATUS CARD
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Status",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  DropdownButton(
                    value: status,
                    items: ["Available", "Busy", "Offline"]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        status = val.toString();
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            // 🟢 ACTIVE CASES TITLE
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Assigned Emergencies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            // 📋 CASE LIST
            Expanded(
              child: ListView.builder(
                itemCount: assignedCases.length,
                itemBuilder: (context, index) {
                  var item = assignedCases[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['type']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text("📍 ${item['location']}"),
                        Text("⚡ Priority: ${item['priority']}"),

                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {},
                              child: Text("Accept"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {},
                              child: Text("Navigate"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {},
                              child: Text("Complete"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
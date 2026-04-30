import 'package:flutter/material.dart';

class ReportEmergencyScreen extends StatefulWidget {
  @override
  _ReportEmergencyScreenState createState() => _ReportEmergencyScreenState();
}

class _ReportEmergencyScreenState extends State<ReportEmergencyScreen> {
  String type = "Medical";
  String severity = "High";

  final descriptionController = TextEditingController();
  final locationController = TextEditingController(
    text: "Detecting location...",
  );

  bool isSending = false;

  void sendEmergency() async {
    setState(() {
      isSending = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isSending = false;
    });

    Navigator.pushNamed(context, '/track');
  }

  Widget sectionTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency SOS"), backgroundColor: Colors.red),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🚨 HEADER CARD
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(Icons.warning, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Send Emergency Alert",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Help will be dispatched immediately",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // 📌 EMERGENCY TYPE
            sectionTitle("Emergency Type"),
            SizedBox(height: 10),

            DropdownButtonFormField(
              value: type,
              items: [
                "Medical",
                "Fire",
                "Police",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) {
                setState(() {
                  type = val.toString();
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 15),

            // ⚡ SEVERITY
            sectionTitle("Severity Level"),
            SizedBox(height: 10),

            DropdownButtonFormField(
              value: severity,
              items: [
                "Low",
                "Medium",
                "High",
                "Critical",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) {
                setState(() {
                  severity = val.toString();
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 15),

            // 📍 LOCATION (SIMULATED)
            sectionTitle("Location"),
            SizedBox(height: 10),

            TextField(
              controller: locationController,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 15),

            // 📝 DESCRIPTION
            sectionTitle("Description (Optional)"),
            SizedBox(height: 10),

            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Describe the situation...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 25),

            // 🚨 SEND BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: isSending
                    ? CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                )
                    : Icon(Icons.send),

                label: Text(
                  isSending ? "Sending Alert..." : "SEND EMERGENCY SOS",
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onPressed: isSending ? null : sendEmergency,
              ),
            ),

            SizedBox(height: 10),

            Center(
              child: Text(
                "Emergency will be sent to nearest responders",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
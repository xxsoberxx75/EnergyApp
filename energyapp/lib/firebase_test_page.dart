import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTestPage extends StatefulWidget {
  const FirebaseTestPage({super.key});

  @override
  State<FirebaseTestPage> createState() => _FirebaseTestPageState();
}

class _FirebaseTestPageState extends State<FirebaseTestPage> {
  String message = "Click the button to test Firebase.";

  Future<void> _testFirebase() async {
    try {
      // Write test data to Firestore
      await FirebaseFirestore.instance
          .collection("test_collection")
          .doc("test_doc")
          .set({"time": DateTime.now().toString()});

      // Read the data back
      final doc = await FirebaseFirestore.instance
          .collection("test_collection")
          .doc("test_doc")
          .get();

      setState(() {
        message = "Firebase OK ✔\nSaved time:\n${doc['time']}";
      });
    } catch (e) {
      setState(() {
        message = "❌ Firebase ERROR:\n$e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Test")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _testFirebase,
                child: const Text("Run Firebase Test"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

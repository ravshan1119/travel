import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddData extends StatelessWidget {
  AddData({super.key});

  String location = "";
  String description = "";
  String img = "";

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('data');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({'location': location, 'description': description, 'img': img})
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: const InputDecoration(
                  hintText: "Location",
                ),
                onChanged: (value) {
                  location = value;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              onChanged: (value) {
                description = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Image",
              ),
              onChanged: (value) {
                img = value;
              },
            ),
          ),
          TextButton(
            onPressed: addUser,
            child: const Text(
              "Add Data",
            ),
          ),
        ],
      ),
    );
  }
}

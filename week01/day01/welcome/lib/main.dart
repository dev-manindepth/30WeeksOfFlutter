import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to 30 Weeks of flutter",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blueAccent),
            
            ),
          ),
        ),
      ),
    );
  }
}

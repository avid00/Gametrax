// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';

class Onboarding_1 extends StatefulWidget {
  const Onboarding_1({Key key}) : super(key: key);

  @override
  _Onboarding_1State createState() => _Onboarding_1State();
}

class _Onboarding_1State extends State<Onboarding_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Text("Onboarding screen 1"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Onboarding_2()),
            ),
            child: Text("go to screen 3"),
          ),
        ],
      ),
    );
  }
}

class Onboarding_2 extends StatelessWidget {
  const Onboarding_2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Text("Onboarding screen 2"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Onboarding_3()),
            ),
            child: Text("go to screen 3"),
          ),
        ],
      ),
    );
  }
}

class Onboarding_3 extends StatelessWidget {
  const Onboarding_3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Text("Onboarding screen 2"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ),
            child: Text("homepage"),
          ),
        ],
      ),
    );
  }
}


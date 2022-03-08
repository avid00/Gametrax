// ignore_for_file: prefer_const_constructors
import 'homePage.dart';
import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key key}) : super(key: key);

  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 400,
            ),
            Text(
              "Lists Page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
              child: Text("go to homepage"),
            ),
          ],
        ),
      ),
    );
  }
}

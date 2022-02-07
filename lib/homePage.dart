import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Text("Hello Amy!"),
          ],
        ),
      ) ,
    );
  }
  Widget appBar() {
    return AppBar(
      title: Text("Home"),
    );
  }

}

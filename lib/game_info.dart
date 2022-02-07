import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gameInfo extends StatefulWidget {
  final String selected_game;
  const gameInfo(this.selected_game, {Key key}) : super(key: key);

  @override
  _gameInfoState createState() => _gameInfoState();
}

class _gameInfoState extends State<gameInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Center(child: Text(widget.selected_game))
          ],
        ),
      ),
    );
  }

  Widget appBar(){
    return AppBar(
      title: Text("About ${widget.selected_game}",
      style: TextStyle(
        fontSize: 15,
      ),),
    );
  }
}

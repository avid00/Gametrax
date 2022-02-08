import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class gameInfo extends StatefulWidget {
  final String selected_game;
  final String selected_gameimage;
  const gameInfo(this.selected_gameimage, this.selected_game, {Key key})
      : super(key: key);

  @override
  _gameInfoState createState() => _gameInfoState();
}

class _gameInfoState extends State<gameInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff212121),
              ),
              height: MediaQuery.of(context).size.height / 1.296,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(widget.selected_gameimage),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 70, 0),
                    child: Text(
                      widget.selected_game,
                      style: GoogleFonts.rubik(
                        color: Colors.white70,
                        fontSize: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.black26,
      title: Text(
        "About ${widget.selected_game}",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

///TODO: add powered by RAWG at the bottom
class GameInfo extends StatefulWidget {
  final String selectedGame;
  final String selectedGameImage;
  final String gameDate;
  const GameInfo(
      this.selectedGameImage,
      this.selectedGame,
      this.gameDate,
      {Key key})
      : super(key: key);

  @override
  _GameInfoState createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  @override
  void initState() {
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SingleChildScrollView(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff212121),
                ),
                height: MediaQuery.of(context).size.height / 1.22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(widget.selectedGameImage,
                    fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 70, 0),
                      child: Text(
                        widget.selectedGame,
                        style: GoogleFonts.rubik(
                          color: Colors.white70,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Date Released: ${widget.gameDate}",
                      style: GoogleFonts.rubik(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 225, 0),
                      child: Text(
                        "Genre: RPG, Action",
                        style: GoogleFonts.rubik(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 225, 0),
                      child: ElevatedButton.icon(onPressed: null, icon: Icon(
                        Icons.add_circle_outline,
                      ), label: Text("add to library",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final url = "https://www.google.com/search?q=${widget.selectedGame}";
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                            );
                          }
                        },
                        icon: Icon(
                        Icons.screen_search_desktop,
                      ), label: Text("search on google",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
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
        "About ${widget.selectedGame}",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

///TODO: add powered by RAWG at the bottom
class GameInfo extends StatefulWidget {
  final String selectedGameName;
  final String selectedGameImage;
  final String gameDate;
  final String gameGenre;
  const GameInfo(
      this.selectedGameImage, this.selectedGameName, this.gameDate, this.gameGenre,
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
    bool toggle = true;
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 330,
                        child: Image.network(
                          widget.selectedGameImage,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    Row(
                      //has two column children for:
                      //1. name, genre, buttons etc
                      //2. heart and bookmark icons + platform icons
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Column( //1. name, genre, buttons etc
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 220,
                                child: Text(
                                  widget.selectedGameName,
                                  style: GoogleFonts.rubik(
                                    color: Colors.white70,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  "Date Released: ${widget.gameDate}",
                                  ///TODO: parse date
                                  style: GoogleFonts.rubik(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Genre: ${widget.gameGenre}",
                                style: GoogleFonts.rubik(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton.icon(
                                onPressed: () async => {
                                  addToFirestore()
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                ),
                                label: Text(
                                  "add to library",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  final url =
                                      "https://www.google.com/search?q=${widget.selectedGameName}";
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.screen_search_desktop,
                                ),
                                label: Text(
                                  "Search on Google",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,10,10,10),
                          child: Column(  //2. heart and bookmark icons + platform icons
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row( //row for 2 icons
                                  children: [
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        icon: toggle
                                            ? Icon(Icons.favorite_border,
                                        color: Colors.white,
                                        size: 30
                                        )
                                            : Icon(
                                          Icons.favorite,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            // Here we changing the icon.
                                            toggle = !toggle;
                                          });
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        icon: toggle
                                            ? Icon(Icons.bookmark_border_sharp,
                                            color: Colors.white,
                                            size: 30
                                        )
                                            : Icon(
                                          Icons.bookmark,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            // Here we changing the icon.
                                            toggle = !toggle;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset('assets/images/windows.png',
                                      scale: 2,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset('assets/images/ps.png',
                                      scale: 3,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset('assets/images/xbox.png',
                                      scale: 2,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  addToFirestore() async{
    List gameName =[];
    List gameImage= [];
    // String
    setState(() async {
      gameName.add(widget.selectedGameName);
      gameImage.add(widget.selectedGameImage);
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'Favourite Games' : FieldValue.arrayUnion(gameName),
        'Favourite Game Image': gameImage,
      } ,
      );

    });

    ///add loop for running more?
    ///
    //await FirebaseFirestore.instance.collection('post')
    // .doc(postId).update({"like": FieldValue.increment(1)});
///TODO: adding is deleting other fields i . Alos, creating a new document like wtf?
///TODO: list is not expanding on firestore (deletes one list item to add another)
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.black26,
      title: Text(
        "About ${widget.selectedGameName}",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}

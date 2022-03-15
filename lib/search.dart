// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game_info.dart';
import 'services/variables.dart';

Widget _appbartitle = Text('Game Name');
final dio = Dio(); // for http requests
TextEditingController _gamenamecontroller = TextEditingController();
String gamename = _gamenamecontroller.text.toString();

class TrendingGames extends StatefulWidget {
  const TrendingGames({Key key}) : super(key: key);

  @override
  State<TrendingGames> createState() => _TrendingGamesState();
}

class _TrendingGamesState extends State<TrendingGames> {
  @override
  void initState() {
    super.initState();
    fetchTrendingGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: gotoAppBar(),

      ///TODO: add reused widgets to a separate file
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                "Trending Right Now",
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Divider(
                color: Color(0xFF393939),
              ),
            ),
///Game rank 1 and 2-------------------------------------------------------------------------------------------------------------------------
            Row(
              children: [
///Game 1--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[0],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[0],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #1",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                  children: const [
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.favorite_border,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.bookmark_border_sharp,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
///Game 2--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[1],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[1],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #2",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
///Game rank 3 and 4-------------------------------------------------------------------------------------------------------------------------
            Row(
              children: [
///Game 3--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[2],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[2],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #3",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
///Game 4--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[3],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[3],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #4",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
///Game rank 5 and 6-------------------------------------------------------------------------------------------------------------------------
            Row(
              children: [
///Game 5--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[4],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[4],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #5",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
///Game 6--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[5],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[5],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #6",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
///Game rank 7 and 8-------------------------------------------------------------------------------------------------------------------------
            Row(
              children: [
///Game 7--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[6],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[6],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #7",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
///Game 8--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[7],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[7],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #8",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
///Game rank 9 and 10-------------------------------------------------------------------------------------------------------------------------
            Row(
              children: [
///Game 9--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[8],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[8],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #9",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
///Game 10--------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF6A6A6A),
                          Color(0xFF3F3F3F),
                          Color(0xFF131313),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.2, 0.6, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
//Image----------------------------------------------------------------------------------------------------------------------------------
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                ),
                              ],
                              ///TODO: add border
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  popularimagelist[9],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
//Info column----------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          popularnamelist[9],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Rank: #10",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Metacritic: 92%",
                                          ///TODO: add metacritic variable
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.rubik(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//Icons column-------------------------------------------------------------------------------------------------------------------------
                                Expanded(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.bookmark_border_sharp,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  fetchTrendingGames() async {
    ///fetching popular games for default page body---------------------------------------------------------------------------------------------
    var popularGamesURL = 'https://rawg.io/api/games/lists/main';
    Map<String, dynamic> queryParams = {
      'key': 'e8bfd125c87243ad941d54f7933bf318',

      ///TODO: USE MY OWN KEY LOL
      'page': '1',
      'page_size': '10',
      'ordering': '-relevance',
      'discover': 'true',
    };
    try {
      // if (newstitlelist.isNotEmpty) {
      //   newstitlelist.clear();
      // }
      final response =
          await dio.get(popularGamesURL + '?', queryParameters: queryParams);
      setState(() {
        final data = response.data as Map;
        for (int i = 0; i <= 10; i++) {
          //parsing data
          popularGameName = data["results"][i]["name"].toString();
          popularGameImage = data["results"][i]["background_image"].toString();
          //add to list
          popularnamelist.add(popularGameName);
          popularimagelist.add(popularGameImage);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  gotoAppBar() {
    return AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Color(0xFF212121),
        title: TextField(
          onTap: () async => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SearchPage()),
          ),
          decoration: InputDecoration(
            hintText: "Search for a Game",
            hintStyle: TextStyle(
              color: Colors.white24,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.search_sharp, color: Colors.white70),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SearchPage()),
          ),
        ));
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //int _currentIndex;
  String _gamenamedata;
  String _gamedatedata;
  String _gameimagedata;
  String _gamegenredata;
  // String _gameplatformdata;
  @override
  void initState() {
    super.initState();
    _buildList();
    _searchPressed();
  }

  @override
  void dispose() {
    _gamenamecontroller.dispose();
    _buildList().dispose();
    super.dispose();
  }

  _SearchPageState() {
    _gamenamecontroller.addListener(() {
      if (_gamenamecontroller.text.isEmpty) {
        setState(() {
          gamename = "";
        });
      } else {
        gamename = _gamenamecontroller.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildBar(context),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Color(0xFF212121),
      title: _appbartitle,
      leading: IconButton(
        icon: Icon(Icons.search_sharp, color: Colors.white70),
        onPressed: _searchPressed(),
      ),
    );
  }

  _buildList() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Container();
        }
        return ListView.builder(
          itemCount: nameList == null ? 0 : 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameInfo(
                      imageList[index],
                      nameList[index],
                      dateList[index],
                      genreList[index],
                    ),
                  ),
                )
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.5),
                ),
                color: Color(0xFF212121),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                          child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Color(0xFF212121),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )),
                          ),
                        ],
                      )),
                      Expanded(
                        child: Text(
                          nameList[index],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  _searchPressed() {
    //dont async
    setState(() {
      _appbartitle = TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          controller: _gamenamecontroller,
          decoration: InputDecoration(
              hintText: 'Search for your favourite Games',
              hintStyle: GoogleFonts.rubik(
                color: Colors.white24,
              )),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) async {
            gamesearch();
            setState(() {});
          });
    });
  }

  gamesearch() async {
    try {
      if (nameList.isNotEmpty && imageList.isNotEmpty) {
        nameList.clear();
        imageList.clear();
        genreList.clear();
        dateList.clear();
      }
      var endpointUrl = 'https://api.rawg.io/api/games';
      Map<String, dynamic> queryParams = {
        'key': 'e8bfd125c87243ad941d54f7933bf318',

        ///TODO: USE MY OWN KEY LOL
        'search': gamename,
        // 'ordering': '-rating',
        'page_size': '20',
      };
      final response =
          await dio.get(endpointUrl + '?', queryParameters: queryParams);

      setState(() {
        searching = true;
        final data = response.data as Map;
        //print("DATAAAAAAAAAAAAAAAA: $data");
        for (int i = 0; i < 20; i++) {
          //data variables parsing from json
          _gamenamedata = data["results"][i]["name"].toString();
          _gamedatedata = data["results"][i]["released"].toString();
          _gameimagedata = data["results"][i]["background_image"]
              .toString(); //use image.network
          _gamegenredata = data["results"][i]["genres"][0]["name"].toString();
          // _gameplatformdata = data["results"][i]["parent_platforms"][0]["platform"]["name"].toString();
          ///TODO: add platforms as well
          //"parent_platforms": [
          //         //                 {
          //         //                     "platform": {
          //         //                         "id": 1,
          //         //                         "name": "PC",
          //         //                         "slug": "pc"
          //         //                     }
          //         //                 },
          //         //                 {
          //         //                     "platform": {
          //         //                         "id": 2,
          //         //                         "name": "PlayStation",
          //         //                         "slug": "playstation"
          //         //                     }
          //         //                 }
          //         //             ],

          //adding data to lists
          dateList.add(_gamedatedata);
          nameList.add(_gamenamedata);
          imageList.add(_gameimagedata);
          genreList.add(_gamegenredata);
        }
        // print(_gameplatformdata);
        namelength = nameList.length;
      });
    } catch (e) {
      print('error $e');
    }
  }
}

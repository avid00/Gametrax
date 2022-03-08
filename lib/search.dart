// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game_info.dart';

Map data = {};
Widget _appbartitle = Text('Game Name');
TextEditingController _gamenamecontroller = TextEditingController();
final dio = Dio(); // for http requests
String gamenamesearch;
int resplength;
List respgamename = [];
List namelist = [];
List imagelist = [];
List dateList = [];
String _gamenamedata;
String _gamedatedata;
String _gameimagedata;
int namelength;
var index = 0;
String gameinfo1;
String gamename = _gamenamecontroller.text.toString();

class searchpage extends StatefulWidget {
  const searchpage({Key key}) : super(key: key);
  @override
  _searchpageState createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  //int _currentIndex;
  @override
  void initState() {
    super.initState();
    _buildList();
    _searchPressed();

  }

  @override
  void dispose() {
    super.dispose();
  }
  _searchpageState() {
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
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
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
          itemCount: namelist == null ? 0 : 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async => {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => GameInfo(imagelist[index], namelist[index], dateList[index]),),)
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
                                    imagelist[index],
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
                            namelist[index],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          },
        );
      },
    );
  }

  _searchPressed() { //dont async
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
            )
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) async {
            gamesearch();
            setState(() {});
          });
    });
  }

  // pushtogameinfo() async {
  //   print("SELECTED: ${namelist[index]}");
  //   setState(() {
  //     _currentIndex = index;
  //   });
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => GameInfo(imagelist[_currentIndex], namelist[_currentIndex],),),);
  // }

  gamesearch() async {
    try {
      if (namelist.isNotEmpty && imagelist.isNotEmpty) {
        namelist.clear();
        imagelist.clear();
      }
      //  String gamename = _gamename.text.toString();
      var endpointUrl = 'https://api.rawg.io/api/games';
      Map<String, dynamic> queryParams = {
        'key': 'e8bfd125c87243ad941d54f7933bf318',

        ///TODO: USE MY OWN KEY LOL
        'search': '$gamename',
        'ordering': '-rating',
        'page_size': '20',
      };
      final response =
      await dio.get(endpointUrl + '?', queryParameters: queryParams);

      setState(() {
        final data = response.data as Map;
        for (int i = 1; i < 10; i++) {
          //data variables parsing from json
          _gamenamedata = data["results"][i]["name"].toString();
          _gamedatedata = data["results"][i]["released"].toString();
          _gameimagedata = data["results"][i]["background_image"].toString(); //use image.network

          //adding data to lists
          dateList.add(_gamedatedata);
          namelist.add(_gamenamedata);
          imagelist.add(_gameimagedata);
        }
        namelength = namelist.length;
      });
    } catch (e) {
      print('error $e');
    }
  }
}

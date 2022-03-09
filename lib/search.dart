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
  @override
  void initState() {
    super.initState();
    //fetchPopularGames();
    _buildList();
    _searchPressed();
  }

  @override
  void dispose() {
    _gamenamecontroller.dispose();
    _buildList().dispose();
    //fetchPopularGames().dispose;
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
      appBar: _buildBar(context),
      body:
      Container(
        child: _buildList(),

        // (searching == true)
        //     ? popularList()
        //     : _buildList(),
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

// ///popular lists body (TODO: make it work)---------------------------------------------------------------------------------------------------
//   popularList() {
//     return FutureBuilder(
//       builder: (context, projectSnap) {
//         if (projectSnap.connectionState == ConnectionState.none &&
//             projectSnap.hasData == null) {
//           return Container();
//         }
//         return ListView.builder(
//           itemCount: nameList == null ? 0 : 10,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () async => {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => GameInfo(
//                         popularimagelist[index],
//                         popularnamelist[index],
//                         dateList[index]),
//
//                   ),
//                 ),
//               },
//               child: Card(
//                   clipBehavior: Clip.antiAlias,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.5),
//                   ),
//                   color: Color(0xFF212121),
//                   child: SizedBox(
//                     height: 100,
//                     child: Row(
//                       children: [
//                         Expanded(
//                             child: Stack(
//                               children: [
//                                 Positioned.fill(
//                                   child: Image.network(
//                                     popularimagelist[index],
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 Container(
//                                   decoration: const BoxDecoration(
//                                       gradient: LinearGradient(
//                                         colors: [
//                                           Colors.transparent,
//                                           Color(0xFF212121),
//                                         ],
//                                         begin: Alignment.centerLeft,
//                                         end: Alignment.centerRight,
//                                       ),
//                                   ),
//                                 ),
//                               ],
//                             )),
//                         Expanded(
//                           child: Text(
//                            popularnamelist[index],
//                             textAlign: TextAlign.right,
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

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
                  genreList[index]),),)
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

// ///fetching popular games for default page body---------------------------------------------------------------------------------------------
//   fetchPopularGames() async {
//     var popularGamesURL = 'https://api.rawg.io/api/games';
//     Map<String, dynamic> queryParams = {
//       'key': 'e8bfd125c87243ad941d54f7933bf318',
//       ///TODO: USE MY OWN KEY LOL
//       'page_size': '20',
//     };
//       try {
//         // if (newstitlelist.isNotEmpty) {
//         //   newstitlelist.clear();
//         // }
//         final response =
//         await dio.get(popularGamesURL + '?', queryParameters: queryParams);
//         setState(() {
//           final data = response.data as Map;
//           for (int i = 0; i <= 10; i++) {
//             //parsing data
//             popularGameName = data["results"][i]["name"].toString();
//             popularGameImage = data["results"][i]["background_image"].toString();
//
//             //add to list
//             popularnamelist.add(popularGameName);
//             popularimagelist.add(popularGameImage);
//           }
//         });
//       } catch (e) {
//         print(e);
//       }
//   }

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

  gamesearch() async {
    try {
      if (nameList.isNotEmpty && imageList.isNotEmpty) {
        nameList.clear();
        imageList.clear();
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
        // final genre = _gamegenredata as Map;
        // List _genreList = [];
        // String _genre;

        print("DATAAAAAAAAAAAAAAAA: $data");
        for (int i = 0; i < 20; i++) {
          //data variables parsing from json
          _gamenamedata = data["results"][i]["name"].toString();
          _gamedatedata = data["results"][i]["released"].toString();
          _gameimagedata = data["results"][i]["background_image"].toString(); //use image.network
          // _gamegenredata = data ["results"][i]["genres"].toString();
          _gamegenredata = data ["results"][i]["genres"].toString();

          ///TODO: add platforms as well
          //adding data to lists
          dateList.add(_gamedatedata);
          nameList.add(_gamenamedata);
          imageList.add(_gameimagedata);
          genreList.add(_gamegenredata);
        }
        namelength = nameList.length;
      });
    } catch (e) {
      print('error $e');
    }
  }
}

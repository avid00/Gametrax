//ignore_for_file: prefer_const_constructors
//import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/lists.dart';
import 'package:untitled2/onboarding_screens.dart';
import 'package:untitled2/register/sign_in.dart';
import 'package:untitled2/services/auth.dart';
import 'search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/variables.dart';

///TODO: add changing background image
///TODO: load page after sign up idk why tf it's not working.
///https://pub.dev/packages/cached_map
//variables
// TextEditingController _name = TextEditingController();
// int index = 0;
// String currentPage;
// List<String> pageKeys =[
//   "home",
//   "search",
//   "lists",
// ];
// Map<String,GlobalKey<NavigatorState>> _navigatorKeys ={
//   "home": GlobalKey<NavigatorState>(),
//   "search": GlobalKey<NavigatorState>(),
//   "lists": GlobalKey<NavigatorState>(),
// };

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentIndex = 0;
  // var _currentTab;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getNews());
    getTime();
    // time = "${date.hour}:${date.minute}";
    // timer = Timer.periodic(Duration(seconds: 1), (_) => getTime());
  }
// @override
//   void dispose() {
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                    "https://images.unsplash.com/photo-1567027757540-7b572280fa22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.darken),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height:40,
                      ),
                      Text(
                        "Greetings",
                        style: GoogleFonts.rubikMonoOne(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "david",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubikMonoOne(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                              Text(
                                time,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubikMonoOne(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 230, 0, 0),
                  child: Text(
                    "   | Here's what's happening in the gaming world",
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ///news tile 1 -----------------------------------------------------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 270, 10, 0),
                  child: Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        color: Colors.black,
                        image: DecorationImage(
                            image: NetworkImage(newsimagelist[1]),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.7),
                                BlendMode.dstATop)),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newstitlelist[1],
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 11,
                            child: Text(
                              newsdatelist[1], //TODO: Parse date
                              style: GoogleFonts.rubik(
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 8,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () async {
                                final url = newsurllist[1];
                                if (await canLaunch(url)) {
                                  await launch(
                                    url,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.open_in_new,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),

                ///news tile 2 ------------------------------------------------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 370, 10, 0),
                  child: Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(newsimagelist[2]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.7),
                                  BlendMode.dstATop))),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newstitlelist[2],
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 11,
                            child: Text(
                              newsdatelist[2], //TODO: Parse date
                              style: GoogleFonts.rubik(
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 8,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () async {
                                final url = newsurllist[2];
                                if (await canLaunch(url)) {
                                  await launch(
                                    url,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.open_in_new,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),

                ///news tile 3-----------------------------------------------------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 470, 90, 0),
                  child: Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(newsimagelist[3]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.7),
                                  BlendMode.dstATop))),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newstitlelist[3],
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 11,
                            child: Text(
                              newsdatelist[3], //TODO: Parse date
                              style: GoogleFonts.rubik(
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 8,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () async {
                                final url = newsurllist[3];
                                if (await canLaunch(url)) {
                                  await launch(
                                    url,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.open_in_new,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),

                ///news tile 4 -----------------------------------------------------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 570, 10, 0),
                  child: Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(newsimagelist[4]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.7),
                                  BlendMode.dstATop))),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newstitlelist[4],
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 11,
                            child: Text(
                              newsdatelist[4], //TODO: Parse date
                              style: GoogleFonts.rubik(
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 8,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () async {
                                final url = newsurllist[4];
                                if (await canLaunch(url)) {
                                  await launch(
                                    url,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.open_in_new,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),

                ///news tile 5 ----------------------------------------------------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 670, 10, 0),
                  child: Container(
                      height: 80,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(newsimagelist[5]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.7),
                                  BlendMode.dstATop))),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newstitlelist[5],
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 11,
                            child: Text(
                              newsdatelist[5], //TODO: Parse date
                              style: GoogleFonts.rubik(
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 8,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () async {
                                final url = newsurllist[5];
                                if (await canLaunch(url)) {
                                  await launch(
                                    url,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.open_in_new,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.insert_chart,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
                  label: Text("login"),
                ),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.insert_chart,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding_1()),
                  ),
                  label: Text("onboarding"),
                ),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.insert_chart,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await AuthService().signOut();
                  },
                  label: Text("logout"),
                ),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.insert_chart,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await getPrices();
                  },
                  label: Text("prices"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getPrices() async {
      // var headers = {
      //   'Content-Type': 'application/x-www-form-urlencoded',
      // };

      var parameters = {
        'token': 'ZXMKHAWFOFLZWNKBRLADUDKSBMEWAYDMEEUWTUZPJVXOOVINOEIKWHDUVKOZHQNW',
        'country': 'in',
        'source': 'amazon',
        'topic': 'search_results',
        'key': 'term',
        'max_age': '43200',
        'max_pages': '1',
        'sort_by': 'relevance_descending',
        'values': 'NieR: Automata',
      };

      var url = 'https://api.priceapi.com/v2/jobs';
      final response = await dio.post(url, queryParameters: parameters);
     // if (response.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
     final responsedata= response.data as Map;
     print("RESPONSE: $responsedata");
    }

  getTime() {
    setState(() {
      time = "${date.hour}:${date.minute}";
    });
  }

  appBarHome() {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Color(0xFF212121),
      centerTitle: true,
      title: Text(
        "Gametrax",
        style: GoogleFonts.rubik(
          fontSize: 19,
          fontWeight: FontWeight.w200,
        ),
      ),
      leading: IconButton(
        onPressed: () async => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TrendingGames()),
        ),
        icon: Icon(Icons.search_sharp),
      ),
      actions: [
        IconButton(
          onPressed: () async => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ListsPage()),
          ),
          icon: Icon(Icons.list_sharp),
        ),
      ],
    );
    // return AppBar(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     backgroundColor: Color(0xFF212121),
    //     title: TextField(
    //       onTap: () async => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => SearchPage()),
    //       ),
    //       decoration: InputDecoration(
    //         hintText: "Search for a Game",
    //         hintStyle: TextStyle(
    //           color: Colors.white24,
    //         ),
    //       ),
    //     ),
    //     leading: IconButton(
    //       icon: Icon(Icons.search_sharp, color: Colors.white70),
    //       onPressed: () => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => SearchPage()),
    //       ),
    //     ));
  }

  // getBackgroundImage(){
  //   // String _key = "B-1LeqNhvdDdmWEM94JIRz9I1t__OctghnK67rY2_6Q";
  //   var urlUnsplash = "https://api.unsplash.com/photos/random/?topics=Video Games&query=Wallpaper&client_id=B-1LeqNhvdDdmWEM94JIRz9I1t__OctghnK67rY2_6Q&count=20";
  //   final response_unsplash = dio.get(urlUnsplash);
  // }

  ///gets news headlines----------------------------------------------------------------------------------------------------------------------
  getNews() async {
    var urlNews =
        "https://newsapi.org/v2/everything?q=gaming&apiKey=0ef79622f62947498f5dcf9d653f9b7c";

    try {
      if (newstitlelist.isNotEmpty) {
        newstitlelist.clear();
      }
      final response = await dio.get(urlNews);

      setState(() {
        final data = response.data as Map;
        for (int i = 0; i <= 10; i++) {
          //parsing data
          newsData = data["articles"][i]["title"].toString();
          newsURL = data["articles"][i]["url"].toString();
          newsImage = data["articles"][i]["urlToImage"].toString();
          newsDate = data["articles"][i]["publishedAt"].toString();
          //add to list
          newstitlelist.add(newsData);
          newsurllist.add(newsURL);
          newsimagelist.add(newsImage);
          newsdatelist.add(newsDate);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}

///TODO: error:
// I/flutter ( 2729): setState() called after dispose(): _HomePageState#36c16(lifecycle state: defunct, not mounted)
// I/flutter ( 2729): This error happens if you call setState() on a State object for a widget that no longer appears in the widget tree (e.g., whose parent widget no longer includes the widget in its build). This error can occur when code calls setState() from a timer or an animation callback.
// I/flutter ( 2729): The preferred solution is to cancel the timer or stop listening to the animation in the dispose() callback. Another solution is to check the "mounted" property of this object before calling setState() to ensure the object is still in the tree.
// I/flutter ( 2729): This error might indicate a memory leak if setState() is being called because another object is retaining a reference to this State object after it has been removed from the tree. To avoid memory leaks, consider breaking the reference to this object during dispose().

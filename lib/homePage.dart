//ignore_for_file: prefer_const_constructors
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/listsPage.dart';
import 'package:untitled2/register/sign_in.dart';
import 'searchPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/variables.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String _timeString;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getNews());
    // _timeString = _formatDateTime(DateTime.now());
    // Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    getTime();

  }
@override
  void dispose() {
    //timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarHome(),
      body: newstitlelist.isEmpty ?
      Center(
        child: CircularProgressIndicator(),
      ) :
      SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                    "https://wallshub.net/wp-content/uploads/2021/09/Gaming-Wallpaper.jpg",
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.darken),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [
                         Color(0x151515C0),
                         Color(0xCC000000),
                         Color(0xCC000000),
                         Color(0xCC000000),
                      ],
                    ),
                  ),
                ),
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
                    "amisha",
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
                              newsdatelist[1],
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
                              newsdatelist[2],
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
                              newsdatelist[3],
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
                              newsdatelist[4],
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
            //     ElevatedButton.icon(
            //       icon: Icon(
            //         Icons.insert_chart,
            //         color: Colors.white,
            //       ),
            //       onPressed: () => Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(builder: (context) => Onboarding_1()),
            //       ),
            //       label: Text("onboarding"),
            //     ),
            //     ElevatedButton.icon(
            //       icon: Icon(
            //         Icons.insert_chart,
            //         color: Colors.white,
            //       ),
            //       onPressed: () async {
            //         await AuthService().signOut();
            //       },
            //       label: Text("logout"),
            //     ),
            //     ElevatedButton.icon(
            //       icon: Icon(
            //         Icons.insert_chart,
            //         color: Colors.white,
            //       ),
            //       onPressed: () async {
            //         null;
            //       },
            //       label: Text("prices"),
            //     ),
               ],
             ),
          ],
        ),
      ),
    );
  }

  // void _getTime() {
  //   final DateTime now = DateTime.now();
  //   final String formattedDateTime = _formatDateTime(now);
  //   setState(() {
  //     _timeString = formattedDateTime;
  //   });
  // }

  // String _formatDateTime(DateTime dateTime) {
  //   return DateFormat('hh:mm').format(dateTime);
  // }

  // getPrices() async {
  //     // var headers = {
  //     //   'Content-Type': 'application/x-www-form-urlencoded',
  //     // };
  //
  //     var parameters = {
  //       'token': 'ZXMKHAWFOFLZWNKBRLADUDKSBMEWAYDMEEUWTUZPJVXOOVINOEIKWHDUVKOZHQNW',
  //       'country': 'in',
  //       'source': 'amazon',
  //       'topic': 'search_results',
  //       'key': 'term',
  //       'max_age': '43200',
  //       'max_pages': '1',
  //       'sort_by': 'relevance_descending',
  //       'values': 'NieR: Automata',
  //     };
  //
  //     var url = 'https://api.priceapi.com/v2/jobs';
  //     final response = await dio.post(url, queryParameters: parameters);
  //    // if (response.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  //    final responsedata= response.data as Map;
  //    //print("RESPONSE: $responsedata");
  //   }
  // getUsername() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   usernameFirestore = prefs.getString('username');
  // }
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

  }

  getNews() async {
    var urlNews =
        "https://newsapi.org/v2/everything?q=gaming&apiKey=0ef79622f62947498f5dcf9d653f9b7c";
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

  }
}

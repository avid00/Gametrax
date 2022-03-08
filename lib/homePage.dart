//ignore_for_file: prefer_const_constructors
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/lists.dart';
import 'package:untitled2/onboarding_screens.dart';
import 'package:untitled2/profile_page.dart';
import 'package:untitled2/register/sign_in.dart';
import 'search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:google_fonts/google_fonts.dart';

//variables
TextEditingController _name = TextEditingController();
String newsData;
String newsURL;
String newsImage;
String newsDate;
List newstitlelist = [];
List newsurllist = [];
List newsimagelist = [];
List newsdatelist = [];
int index = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: gotoAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://images.unsplash.com/photo-1550745165-9bc0b252726f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2FtaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  scale: 0.4,
                ),
                Center(
                  heightFactor: 5,
                  child: Text(
                    "Greetings",
                    style: GoogleFonts.rubikMonoOne(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                Center(
                  heightFactor: 7,
                  child: Text(
                    "david",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubikMonoOne(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
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
                  ],
                ),

///news tile 1 -----------------------------------------------------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 300, 10, 0),
                  child: Container(
                      height: 80,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          color: Colors.black,
                          image: DecorationImage(
                            image: NetworkImage(newsimagelist[1]),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.7),
                                BlendMode.dstATop)
                          )),
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
                  padding: const EdgeInsets.fromLTRB(80, 400, 10, 0),
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
                                  BlendMode.dstATop)
                          )),
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
                  padding: const EdgeInsets.fromLTRB(10, 500, 10, 0),
                  child: Container(
                      height: 80,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(newsimagelist[3]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.7),
                                  BlendMode.dstATop)
                          )),
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
                  padding: const EdgeInsets.fromLTRB(10, 600, 10, 0),
                  child: Container(
                      height: 80,
                      width: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(newsimagelist[4]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.7),
                                  BlendMode.dstATop)
                          )),
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
                  padding: const EdgeInsets.fromLTRB(10, 700, 10, 0),
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
                                  BlendMode.dstATop)
                          )),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        //TODO: make nav bar persistent
        backgroundColor: Colors.black45,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: GestureDetector(
              child: Icon(Icons.home),
              onTap: () async => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
            ),
            title: Text('Home'),
            activeColor: Colors.white70,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: GestureDetector(
              child: Icon(Icons.search_sharp),
              onTap: () async => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              ),
            ),
            title: Text('Games'),
            activeColor: Colors.white70,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: GestureDetector(
              child: Icon(Icons.view_list_sharp),
              onTap: () async => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ListsPage()),
              ),
            ),
            title: Text(
              'Lists',
            ),
            activeColor: Colors.white70,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: GestureDetector(
              child: Icon(Icons.person_sharp),
              onTap: () async => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              ),
            ),
            title: Text('Me'), //TODO: add user's name/nicname
            activeColor: Colors.white70,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
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

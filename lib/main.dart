// ignore_for_file: prefer_const_constructors
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/register/sign_up.dart';
import 'search.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() => runApp(_searchgamesState());

//variables
TextEditingController _name = TextEditingController();
String newsdata;
class _searchgamesState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GAMES',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: GoogleFonts.rubik(),
        ),
        // primarySwatch: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: gotoAppBar(),
      body: Column(
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
                heightFactor: 4,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _name,
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
                    onPressed: () async => getNews(),
                    label: Text("News"),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.insert_chart,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    ),
                    label: Text("login"),
                  ),
                ],
              )
              // Container(
              //   decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           Colors.transparent,
              //           Color(0xFFEF0000),
              //         ],
              //         begin: Alignment.bottomCenter,
              //       )),
              // ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
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
            MaterialPageRoute(builder: (context) => searchpage()),
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
            MaterialPageRoute(builder: (context) => searchpage()),
          ),
        ));
  }

  // getBackgroundImage(){
  //   String _key = "B-1LeqNhvdDdmWEM94JIRz9I1t__OctghnK67rY2_6Q";
  //   var urlUnsplash = "https://api.unsplash.com/photos/random/?topics=Video Games&query=Wallpaper&client_id=$_key&count=20";
  //
  //   final response_unsplash = dio.get(urlUnsplash);
  //
  // }

  getNews() async {
    //String _key = "6XwYELZ9DeIYextaDlz9H6mIaNVTfZtX9JpENTOPI-g";
    var urlGoogleNews = "https://google-news.p.rapidapi.com/v2/search?q=Video Games, gaming&country=UK";
    dio.options.headers["key"] = "6XwYELZ9DeIYextaDlz9H6mIaNVTfZtX9JpENTOPI-g";
    // Map<String, dynamic> queryParams = {
    //   'x-api-key': '6XwYELZ9DeIYextaDlz9H6mIaNVTfZtX9JpENTOPI-g',
    // };

  try {
    final response = await dio.get(urlGoogleNews);
    setState(() {
      final data = response.data as Map;
      for (int i=0;i<=6;i++){
        newsdata = data["articles"]["title"].toString();
        print(newsdata);
      }
    });

  }catch(e){
    print(e);
  }
}
}

//----------------------------------
//https://rapidapi.com/SapphireWare/api/video-game-price/
// newsapi.ord key: 014429d2731c4bb6b1d2830bae54e1d0
//gamespot: c9353d017f27e4448a12f53c22c94b3a09ee01f7

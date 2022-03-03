// ignore_for_file: prefer_const_constructors
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/lists.dart';
import 'package:untitled2/onboarding_screens.dart';
import 'package:untitled2/profile_page.dart';
import 'package:untitled2/register/sign_in.dart';
import 'search.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() => runApp(_searchgamesState());

//variables
TextEditingController _name = TextEditingController();
String newsdata;
String news_url;
String news_image;
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
              ) ,
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
              MaterialPageRoute(builder: (context) => searchpage()),
            ) ,
            ),
            title: Text('Games'),
            activeColor: Colors.white70,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: GestureDetector(
              child: Icon(Icons.view_list_sharp),
              onTap: () async =>
                  Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ListsPage()),
              ) ,
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
              onTap: () async =>
                  Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              ) ,
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
    var url_news = "https://newsapi.org/v2/everything?q=gaming&apiKey=0ef79622f62947498f5dcf9d653f9b7c";
    // Map<String, dynamic> queryParams = {
    //   'x-api-key': '6XwYELZ9DeIYextaDlz9H6mIaNVTfZtX9JpENTOPI-g',
    // };

  try {
    final response = await dio.get(url_news);
   // print('Response ============>$response');
    setState(() {
      final data = response.data as Map;
      for (int i=0;i<=10;i++){
        newsdata = data["articles"][i]["title"].toString();
        news_url = data["articles"][i]["url"].toString();
        news_image = data["articles"][i]["urlToImage"].toString();
       // print(newsdata);
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

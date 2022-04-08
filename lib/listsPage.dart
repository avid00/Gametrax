// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/register/sign_in.dart';
import 'package:untitled2/searchPage.dart';
import 'package:untitled2/services/variables.dart';
import 'homePage.dart';
import 'package:flutter/material.dart';
import 'services/auth.dart';


class ListsPage extends StatefulWidget {
  const ListsPage({Key key}) : super(key: key);

  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
@override
  void initState() {
    super.initState();
    getListItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF484848),
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: IconButton(
                    onPressed: () async => {
                      getListItems(),
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Color(0xFFE5E5E5FF),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF484848),
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: IconButton(
                    onPressed: () async => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TrendingGames()),
                    ),
                    icon: Icon(
                      Icons.change_history_sharp,
                      color: Color(0xFFE5E5E5FF),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF484848),
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.bookmark,
                      color: Color(0xFFE5E5E5FF),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF484848),
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      await AuthService().signOut();
                      Navigator.of(context).pushAndRemoveUntil(
                           MaterialPageRoute(
                              builder: (context) =>
                              LoginPage()),
                              (route) => false);
                    },
                    icon:Icon(
                      Icons.logout,
                      color: Color(0xFFE5E5E5FF),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 528, //length of container for lists
              decoration: BoxDecoration(
                color: Color(0xFF262626),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "       Your To-Buy List",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    gameNameListFromFirestore.isEmpty ?
                    Center(
                      child: CircularProgressIndicator(),
                    ) :
                   getGamesFromFirestore(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(85, 10, 0, 20),
                      child: Row(
                        children: [
                          Text(
                            "Game Information is powered by  ",
                                style: GoogleFonts.rubik(
                                    color: Colors.white,
                                  fontSize: 12,
                                ),
                          ),
                          Image.asset('assets/images/RAWG.jpg',
                          scale: 4,
                          ),
                        ],
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () => Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => HomePage()),
                    //   ),
                    //   child: Text("go to homepage"),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getGamesFromFirestore(){
  return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null)        {
          return Container();
        }
   return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: gameNameListFromFirestore.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
            child: Card(
              color: Colors.black,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: SizedBox(
                height: 90,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      ("${index+1}"),
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            10, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(10.0),
                          child: Image.network(
                            gameImageListFromFirestore[
                            index]
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                            height: 70,
                            width: 100.0,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            40, 10, 10, 30),
                        child: Text(
                          gameNameListFromFirestore[index]
                              .replaceAll('[', '')
                              .replaceAll(']', ''),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
        }
  );
  }
  Widget firestoreList() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Container();
        }
        return ListView.builder(
          itemCount: gameNameListFromFirestore.isEmpty ? null : gameNameListFromFirestore.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: null,
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
                              gameImageListFromFirestore[index],
                              fit: BoxFit.fitHeight,
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
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(
                            gameNameListFromFirestore[index],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              shadows: const <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 30.0,
                                  color: Colors.black,
                                ),
                              ],
                            ),
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

  getListItems() async {
    if(gameNameListFromFirestore.isNotEmpty){
      setState(() {
        gameNameListFromFirestore.clear();
        gameImageListFromFirestore.clear();
      });
    }
    var collection = FirebaseFirestore.instance.collection('users');
    var user = FirebaseAuth.instance.currentUser;
    var docSnapshot = await collection.doc(user.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      datalength = data.length;

      for (int i = 0; i < datalength; i++) {
          setState(() {
            gameNameFromFirestore = data['Favourite Games'][i].toString();
            gameImageFromFirestore = data['Favourite Game Image'][i].toString();
            //adding to lists
            gameNameListFromFirestore.add(gameNameFromFirestore);
            gameImageListFromFirestore.add(gameImageFromFirestore);
          });

      }
    }
  }

  appBar() {
    return AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Color(0xFF212121),
        title: Text(
          "         Your Saved Games",
          style: GoogleFonts.rubik(
            fontSize: 19,
            fontWeight: FontWeight.w200,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white70),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          ),
        ));
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
    );
  }
}

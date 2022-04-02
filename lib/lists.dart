// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/services/variables.dart';

import 'homePage.dart';
import 'package:flutter/material.dart';

///TODO: add to json and upload json to firestore instead

class ListsPage extends StatefulWidget {
  const ListsPage({Key key}) : super(key: key);

  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  List listTitle= [
    Text("List 1"),
    Text("List 2"),
    Text("List 3"),
    Text("List 4"),
  ];

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
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "        | Some Default Lists for you",
            //     style: GoogleFonts.rubik(
            //       color: Colors.white,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
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
                    onPressed: () async =>{
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
                    onPressed: null,
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
                  child: Icon(
                    Icons.bookmark,
                    color: Color(0xFFE5E5E5FF),
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
            //container (scrollable)-----
            Container(
              height: 528,  //length of container for lists
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
                  children:[
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("       Lists Created by you",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:10,
                        itemBuilder: (context,index){
                          return  Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
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
                                    Text(gameNameFromFirestore,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              )
                            ),
                          );
                        }),
                    ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      ),
                      child: Text("go to homepage"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

getListItems() async {
var collection = FirebaseFirestore.instance.collection('users');
var user = FirebaseAuth.instance.currentUser;
var docSnapshot = await collection.doc(user.uid).get();
if (docSnapshot.exists) {
Map<String, dynamic> data = docSnapshot.data();
// You can then retrieve the value from the Map like this:
setState(() {
  gameNameFromFirestore = data['Favourite Games'].toString();
});
///TODO: maybe add a return function instead of global variable and setState
}
}

  appBar() {
    return AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Color(0xFF212121),
        title: Text(
          "  Some Default Lists for you",
          style: GoogleFonts.rubik(
            fontSize: 20,
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

  Widget buildBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
    );
  }
}

//notes:
//once the list items are added,
// just the list can be retrieved from firestore rather than adding it one by one
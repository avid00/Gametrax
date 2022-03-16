// ignore_for_file: prefer_const_constructors
import 'package:google_fonts/google_fonts.dart';

import 'homePage.dart';
import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key key}) : super(key: key);

  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "        | Some Default Lists for you",
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
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
                    onPressed: null,
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
                  child: ImageIcon(
                    AssetImage(assetName) 
                  )
                ),
                SizedBox(
                  width: 28,
                ),
              ],
            ),
            //container (scrollable)-----
            //Listbuilder-----

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
    );
  }
}

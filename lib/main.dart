// ignore_for_file: prefer_const_constructors
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

void main() => runApp(Gametrax());

class Gametrax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GAMES',
      // theme: ThemeData(
      //   // textTheme: TextTheme(
      //   //   bodyText1: GoogleFonts.rubik(),
      //   // ),
      //   // primarySwatch: Colors.black,
      // ),
      home: HomePage(),
    );
  }
}


//----------------------------------
//https://rapidapi.com/SapphireWare/api/video-game-price/
// newsapi.ord key: 014429d2731c4bb6b1d2830bae54e1d0
//gamespot: c9353d017f27e4448a12f53c22c94b3a09ee01f7

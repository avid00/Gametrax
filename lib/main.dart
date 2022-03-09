// ignore_for_file: prefer_const_constructors
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/onboarding_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/register/sign_in.dart';
import 'package:untitled2/services/auth.dart';
import 'package:untitled2/services/wrapper.dart';
import 'homePage.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Gametrax());
}

class Gametrax extends StatefulWidget {
  const Gametrax({Key key}) : super(key: key);

  @override
  State<Gametrax> createState() => _GametraxState();
}

class _GametraxState extends State<Gametrax> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         // home: HomePage(),
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/onboarding': (context) => Onboarding_1(),
          '/login': (context) => LoginPage(),
        }
      ),
    );
  }
}

//
// class Gametrax extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'GAMES',
//
//       // theme: ThemeData(
//       //   // textTheme: TextTheme(
//       //   //   bodyText1: GoogleFonts.rubik(),
//       //   // ),
//       //   // primarySwatch: Colors.black,
//       // ),
//       home: HomePage(),
//     );
//   }
// }


//----------------------------------
//https://rapidapi.com/SapphireWare/api/video-game-price/
// newsapi.ord key: 014429d2731c4bb6b1d2830bae54e1d0
//gamespot: c9353d017f27e4448a12f53c22c94b3a09ee01f7

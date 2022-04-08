// ignore_for_file: prefer_const_constructors
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/homePage.dart';
import 'package:untitled2/onboarding_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled2/register/sign_in.dart';
import 'package:untitled2/services/auth.dart';
import 'package:untitled2/services/wrapper.dart';
import 'package:provider/provider.dart';


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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          //home: HomePage(),
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

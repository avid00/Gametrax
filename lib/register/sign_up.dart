// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/register/sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nickname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/signup_bg.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
                child: Text(
                  'Register with us!',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 280, 40, 0),
                child: Text(
                  'Please enter your details below',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 320, 90, 0),
                //TODO: add lmit of 20
                child: TextField(
                  controller: nickname,
                  style: GoogleFonts.rubik(color: Colors.white, fontSize: 15),
                  decoration: InputDecoration(
                    hintText: 'enter a nickname we can call you by',
                    hintStyle:
                    GoogleFonts.rubik(color: Colors.white60, fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 370, 90, 0),
                //TODO: Add limit of 20
                child: TextField(
                  controller: username,
                  style: GoogleFonts.rubik(color: Colors.white, fontSize: 15),
                  decoration: InputDecoration(
                    hintText: 'your username goes here',
                    hintStyle:
                    GoogleFonts.rubik(color: Colors.white60, fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 420, 90, 0),
                //TODO: add password censor and eye
                child: TextField(
                  controller: password,
                  style: GoogleFonts.rubik(color: Colors.white, fontSize: 15),
                  decoration: InputDecoration(
                    hintText: 'and your password here shhh...',
                    hintStyle:
                    GoogleFonts.rubik(color: Colors.white60, fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(150, 520, 50, 0),
                child: ElevatedButton(onPressed: null, child:
                Text(
                  '   Confirm   ',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(128, 600, 0, 0),
                child: Column(
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TextButton(
                      //TODO: add login link and make text coloured
                     onPressed: () => Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (context) => LoginPage()),
                     ),
                      child: Text(
                        'Sign in here',
                        style: GoogleFonts.rubik(
                          color: Colors.orangeAccent,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          )
        ],
      ),
    );
  }
}

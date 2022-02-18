import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/login_bg.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
                child: Text(
                  'Welcome to Your One-Stop Gaming Centre',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(168, 320, 150, 0),
                child: Text(
                  'Sign In',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 390, 90, 0),
                child: TextField(
                  controller: username,
                  style: GoogleFonts.rubik(color: Colors.white, fontSize: 12),
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
                padding: const EdgeInsets.fromLTRB(90, 440, 90, 0),
                child: TextField(
                  controller: password,
                  style: GoogleFonts.rubik(color: Colors.white, fontSize: 12),
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
                padding: const EdgeInsets.fromLTRB(100, 600, 50, 0),
                child: Text(
                  'Create an Account',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(140, 650, 50, 0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      scale: 2,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.email_outlined,
                          size: 33,
                          color: Colors.white,
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

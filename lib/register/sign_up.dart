import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/login_bg.png'),
Text('Welcome to Your One-Stop Gaming Centre',
style: GoogleFonts.rubik(
  color: Colors.white,
),
),
            ],
          )

        ],
      ),

    );
  }
}

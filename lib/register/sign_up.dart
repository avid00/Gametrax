// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/homePage.dart';
import 'package:untitled2/register/sign_in.dart';
import 'package:untitled2/services/auth.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  UserCredential userCredential;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    Future<void> signUserUp() async {
      final instance = FirebaseAuth.instance;
      userCredential = await instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);


      try{
      await authService.createUserWithEmailAndPassword(
          email.text, password.text);

      } catch(e){
        print("Error: $e");
      }
    }

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
                padding: const EdgeInsets.fromLTRB(70, 330, 70, 100),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'ⓘ enter an email please' : null,
                        controller: TextEditingController.fromValue(
                          TextEditingValue(
                            text:email.text,
                            selection: TextSelection.collapsed(
                                offset: email.text.length-0),
                          ),
                        ),
                        style: GoogleFonts.rubik(
                            color: Colors.white, fontSize: 15),
                        decoration: InputDecoration(
                          hintText: 'we will keep your email safe',
                          hintStyle: GoogleFonts.rubik(
                              color: Colors.white60, fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => {
                                email.text = val,
                              });
                        },
                      ),
                      TextFormField(
                        validator: (val) => val.isEmpty
                            ? 'ⓘ we need to know what to call you'
                            : null,
                       controller: TextEditingController.fromValue(
                           TextEditingValue(
                               text: username.text,
                               selection: TextSelection.collapsed(
                                   offset: username.text.length-0),
                           ),
                       ),
                       // controller: username,
                        style: GoogleFonts.rubik(
                            color: Colors.white, fontSize: 15),
                        decoration: InputDecoration(
                          hintText: 'your good name?',
                          hintStyle: GoogleFonts.rubik(
                              color: Colors.white60, fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => {
                                username.text = val,
                              });
                        },
                      ),
                      TextFormField(
                        validator: (val) => val.length < 9
                            ? 'ⓘ you will need a secure password you know (min 9 chars.)'
                            : null,
                        controller: TextEditingController.fromValue(
                          TextEditingValue(
                            text: password.text,
                            selection: TextSelection.collapsed(
                                offset: password.text.length-0),
                          ),
                        ),
                        style: GoogleFonts.rubik(
                            color: Colors.white, fontSize: 15),
                        decoration: InputDecoration(
                          hintText: "and your password here shhh...",
                          hintStyle: GoogleFonts.rubik(
                              color: Colors.white60, fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => {
                                password.text = val,
                              });
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var user = FirebaseAuth.instance.currentUser;
                          if (_formkey.currentState.validate()) {
                            signUserUp();
                            await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                              'email': email.text,
                              'uid': user.uid,
                              'dateOfCreation': DateTime.now(),
                              'nickname': username.text,
                            });
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString('username', username.text);
                            // Navigator.pop(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => HomePage()),
                            // );
                            Navigator.pop(context);
                           // );
                          }
                        },
                        child: Text(
                          '   Confirm   ',
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(128, 650, 0, 0),
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
          ),
        ],
      ),
    );
  }
}
///TODO: error:
///Failed assertion: line 5128 pos 12: '_history.isNotEmpty': is not true.


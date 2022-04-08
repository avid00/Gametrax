// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:untitled2/homePage.dart';
import 'package:untitled2/register/sign_in.dart';
import 'package:untitled2/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/services/userModel.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User>(
      stream:authService.user ,
      builder: (_, AsyncSnapshot<User> snapshot){
        if (snapshot.connectionState==ConnectionState.active){
          final User user = snapshot.data;
          return user == null ? LoginPage()
              : HomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

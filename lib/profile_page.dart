// // ignore_for_file: prefer_const_constructors
// import 'homePage.dart';
// import 'package:flutter/material.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key key}) : super(key: key);
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 400,
//             ),
//             Text(
//               "Profile Page",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomePage()),
//               ),
//               child: Text("go to homepage"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

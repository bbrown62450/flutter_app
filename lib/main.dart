import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'app/landing_page.dart';
import 'app/services/auth.dart';
import "package:provider/provider.dart";

void main() {
  runApp(MyApp());
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _firebaseMessaging.getToken().then((token) {
    print(token); // Print the Token in Console
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'This Beloved Community',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(),
      ),
    );
  }
}


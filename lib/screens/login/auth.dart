import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krl_info/screens/cari_rute/find_route.dart';
import 'package:krl_info/screens/login/first_screen.dart';
import 'login_screen.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FindRoute();
            } else {
              return FirstScreen();
            }
            ;
          }),
    );
  }
}

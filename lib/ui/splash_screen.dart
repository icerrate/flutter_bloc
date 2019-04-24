import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 64),
        color: Colors.white,
        child: Center(
          child: Image(
            image: AssetImage('assets/ic_logo.png')
          ),
        )
      )
    );
  }
}
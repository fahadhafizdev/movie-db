import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/theme.dart';

class SplashLogoPage extends StatefulWidget {
  @override
  State<SplashLogoPage> createState() => _SplashLogoPageState();
}

class _SplashLogoPageState extends State<SplashLogoPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/splash-data', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/ic_movies.png'),
            ),
          ),
        ),
      ),
    );
  }
}

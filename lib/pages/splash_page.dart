import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/providers/movie_provider.dart';
import 'package:moviez_streaming_dark/providers/nowplaying_movie_provider.dart';
import 'package:moviez_streaming_dark/providers/popular_movie_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_airingtoday_provider.dart';
import 'package:moviez_streaming_dark/providers/upcoming_movie_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  getInit() async {
    Timer(Duration(seconds: 3), () async {
      await Provider.of<MovieProvider>(context, listen: false)
          .getTopMovieList();
      await Provider.of<PopularMovieProvider>(context, listen: false)
          .getPopularMovieList();
      await Provider.of<UpComingMovieProvider>(context, listen: false)
          .getUpComingMovieList();
      await Provider.of<NowPlayingMovieProvider>(context, listen: false)
          .getUpComingMovieList();
      await Provider.of<TvAiringTodayProvider>(context, listen: false)
          .getTvAiringToday();

      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: CircularProgressIndicator(),
            ),
            Text(
              'loading resource API',
              style: whiteTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}

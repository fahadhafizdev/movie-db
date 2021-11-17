import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/pages/home/main_page.dart';
import 'package:moviez_streaming_dark/pages/home/tv_page.dart';
import 'package:moviez_streaming_dark/pages/splash_logo_page.dart';
import 'package:moviez_streaming_dark/pages/splash_page.dart';
import 'package:moviez_streaming_dark/providers/category_menu_provider.dart';
import 'package:moviez_streaming_dark/providers/favorite_movie_provider.dart';
import 'package:moviez_streaming_dark/providers/movie_provider.dart';
import 'package:moviez_streaming_dark/providers/nowplaying_movie_provider.dart';
import 'package:moviez_streaming_dark/providers/page_provider.dart';
import 'package:moviez_streaming_dark/providers/people_popular_provider.dart';
import 'package:moviez_streaming_dark/providers/popular_movie_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_airingtoday_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_ontheair_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_popular_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_toprated_provider.dart';
import 'package:moviez_streaming_dark/providers/upcoming_movie_provider.dart';
import 'pages/home/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieProvider()),
        ChangeNotifierProvider(create: (context) => PopularMovieProvider()),
        ChangeNotifierProvider(create: (context) => CategoryMenuProvider()),
        ChangeNotifierProvider(create: (context) => NowPlayingMovieProvider()),
        ChangeNotifierProvider(create: (context) => UpComingMovieProvider()),
        ChangeNotifierProvider(create: (context) => TvAiringTodayProvider()),
        ChangeNotifierProvider(create: (context) => TvPopularProvider()),
        ChangeNotifierProvider(create: (context) => TvOnTheAirProvider()),
        ChangeNotifierProvider(create: (context) => TvTopRatedProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider()),
        ChangeNotifierProvider(create: (context) => PeoplePopularProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteMovieProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashLogoPage(),
          '/splash-data': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/tv': (context) => TvPage(),
          '/main-page': (context) => MainPage(),
        },
      ),
    );
  }
}

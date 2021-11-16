import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/pages/splash_page.dart';
import 'package:moviez_streaming_dark/providers/movie_provider.dart';
import 'package:moviez_streaming_dark/providers/popular_movie_provider.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}

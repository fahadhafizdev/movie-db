import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/providers/movie_provider.dart';
import 'package:moviez_streaming_dark/providers/popular_movie_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:moviez_streaming_dark/widgets/movie_card.dart';
import 'package:moviez_streaming_dark/widgets/movie_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);
    PopularMovieProvider popularMovieProvider =
        Provider.of<PopularMovieProvider>(context);

    Widget buildTitle() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Moviez',
                  style: whiteTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: black,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Watch much easier',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Container(
              width: 55,
              height: 45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/button_search.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildCarousel() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                movieProvider.movies.map((e) => MovieCard(movies: e)).toList(),
          ),
        ),
      );
    }

    Widget buildSubTitle(String title) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: black,
              ),
            ),
          ],
        ),
      );
    }

    Widget listItem() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Column(
          children: popularMovieProvider.movies
              .map((e) => MovieTile(
                    movies: e,
                  ))
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          buildTitle(),
          buildSubTitle('Top Rated'),
          buildCarousel(),
          buildSubTitle('Popular'),
          listItem(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/providers/moviesearch_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:moviez_streaming_dark/widgets/movie_tile.dart';
import 'package:provider/provider.dart';

class MovieListSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MovieSearchProvider movieSearchProvider =
        Provider.of<MovieSearchProvider>(context);
    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Column(
          children: movieSearchProvider.movies.isEmpty
              ? [
                  Container(
                    height: 200,
                    width: 300,
                    margin: EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/error.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Please Check Your Internet Connection',
                    textAlign: TextAlign.center,
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 20,
                    ),
                  )
                ]
              : movieSearchProvider.movies.map((item) {
                  return MovieTile(
                    movies: item,
                  );
                }).toList(),
        ),
      );
    }

    Widget boxSearch() {
      return GestureDetector(
        onTap: () async {
          await movieSearchProvider.resetSearchMovie();
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 17),
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kBgBottomNavbar,
            borderRadius: BorderRadius.circular(21),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search More',
                style:
                    whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 21),
              ),
              Image.asset(
                'assets/icon_search.png',
                height: 30,
                width: 30,
                color: kWhiteColor,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          boxSearch(),
          content(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/providers/favorite_movie_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:moviez_streaming_dark/widgets/movie_tile.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteMovieProvider favoriteMovieProvider =
        Provider.of<FavoriteMovieProvider>(context);

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
                fontSize: 24,
                fontWeight: black,
              ),
            ),
          ],
        ),
      );
    }

    Widget messageNoData() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100, bottom: defaultMargin),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cloud.png'),
              ),
            ),
          ),
          Text(
            'Tidak ada wishlist',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 24,
            ),
          )
        ],
      );
    }

    Widget itemWishList() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Column(
          children: favoriteMovieProvider.movieList
              .map(
                (e) => MovieTile(
                  movies: e,
                ),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          buildSubTitle('Wishlist Movie'),
          favoriteMovieProvider.movieList.isEmpty
              ? messageNoData()
              : itemWishList(),
        ],
      ),
    );
  }
}

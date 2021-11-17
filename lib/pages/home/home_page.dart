import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/pages/movie_search_page.dart';
import 'package:moviez_streaming_dark/providers/category_menu_provider.dart';
import 'package:moviez_streaming_dark/providers/movie_provider.dart';
import 'package:moviez_streaming_dark/providers/nowplaying_movie_provider.dart';
import 'package:moviez_streaming_dark/providers/popular_movie_provider.dart';
import 'package:moviez_streaming_dark/providers/upcoming_movie_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:moviez_streaming_dark/widgets/category_menu_widget.dart';
import 'package:moviez_streaming_dark/widgets/movie_card.dart';
import 'package:moviez_streaming_dark/widgets/movie_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);
    PopularMovieProvider popularMovieProvider =
        Provider.of<PopularMovieProvider>(context);
    NowPlayingMovieProvider nowPlayingMovieProvider =
        Provider.of<NowPlayingMovieProvider>(context);
    UpComingMovieProvider upComingMovieProvider =
        Provider.of<UpComingMovieProvider>(context);
    CategoryMenuProvider categoryMenuProvider =
        Provider.of<CategoryMenuProvider>(context);
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchMoviePage(),
                  ),
                );
              },
              child: Container(
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
            ),
          ],
        ),
      );
    }

    Widget buildCarousel() {
      return Container(
        margin: EdgeInsets.only(top: 30, right: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: movieProvider.movies.isEmpty
                ? [SizedBox()]
                : movieProvider.movies
                    .map((e) => MovieCard(movies: e))
                    .toList(),
          ),
        ),
      );
    }

    Widget buildCategoryTitle() {
      return movieProvider.movies.isEmpty
          ? SizedBox()
          : Container(
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CategoryMenu(
                    name: 'Popular',
                  ),
                  CategoryMenu(
                    name: 'Now Playing',
                  ),
                  CategoryMenu(
                    name: 'Up Coming',
                  ),
                ],
              ),
            );
    }

    Widget buildSubTitle(String title) {
      return movieProvider.movies.isEmpty
          ? SizedBox()
          : Container(
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

    Widget listItemPopular() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Column(
          children: popularMovieProvider.movies.isEmpty
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
              : popularMovieProvider.movies
                  .map(
                    (e) => MovieTile(
                      movies: e,
                    ),
                  )
                  .toList(),
        ),
      );
    }

    Widget listNowPlaying() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Column(
          children: nowPlayingMovieProvider.movies.isEmpty
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
              : nowPlayingMovieProvider.movies
                  .map(
                    (e) => MovieTile(
                      movies: e,
                    ),
                  )
                  .toList(),
        ),
      );
    }

    Widget listUpComing() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Column(
          children: upComingMovieProvider.movies.isEmpty
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
              : upComingMovieProvider.movies
                  .map(
                    (e) => MovieTile(
                      movies: e,
                    ),
                  )
                  .toList(),
        ),
      );
    }

    Widget listChangedCategory() {
      switch (categoryMenuProvider.categorySelected) {
        case 'Popular':
          return listItemPopular();
        case 'Now Playing':
          return listNowPlaying();
        case 'Up Coming':
          return listUpComing();

        default:
          return listItemPopular();
      }
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          buildTitle(),
          buildSubTitle('Top Rated'),
          buildCarousel(),
          buildCategoryTitle(),
          listChangedCategory(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

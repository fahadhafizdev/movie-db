import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/movie_model.dart';
import 'package:moviez_streaming_dark/models/tv_model.dart';
import 'package:moviez_streaming_dark/pages/movie_list_of_search_page.dart';
import 'package:moviez_streaming_dark/providers/movie_provider.dart';
import 'package:moviez_streaming_dark/providers/moviesearch_provider.dart';
import 'package:moviez_streaming_dark/services/movie_service.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:moviez_streaming_dark/widgets/movie_tile.dart';
import 'package:provider/provider.dart';

class SearchMoviePage extends StatefulWidget {
  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchInput = TextEditingController(text: '');

    Widget searchContainer() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 17),
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kBgBottomNavbar,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: searchInput,
                style: whiteTextStyle.copyWith(fontSize: 20),
                obscureText: false,
                decoration: InputDecoration.collapsed(
                  hintText: 'Cari Movie',
                  hintStyle: greyTextStyle,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                print(isLoading);
                await Provider.of<MovieSearchProvider>(context, listen: false)
                    .getSearchMovie(searchInput.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieListSearchPage(),
                  ),
                );
                setState(() {
                  isLoading = false;
                });
                print(isLoading);
              },
              child: isLoading
                  ? Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: kWhiteColor,
                      ),
                    )
                  : Image.asset(
                      'assets/icon_search.png',
                      height: 30,
                      width: 30,
                      color: kWhiteColor,
                    ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          searchContainer(),
        ],
      ),
    );
  }
}

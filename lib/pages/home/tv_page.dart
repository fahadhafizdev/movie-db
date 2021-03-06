import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/providers/people_popular_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_airingtoday_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_ontheair_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_popular_provider.dart';
import 'package:moviez_streaming_dark/providers/tv_toprated_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:moviez_streaming_dark/widgets/movie_tile.dart';
import 'package:moviez_streaming_dark/widgets/people_tile.dart';
import 'package:moviez_streaming_dark/widgets/tv_card.dart';
import 'package:moviez_streaming_dark/widgets/tv_tile.dart';
import 'package:provider/provider.dart';

import '../movie_search_page.dart';

class TvPage extends StatelessWidget {
  const TvPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TvAiringTodayProvider tvAiringTodayProvider =
        Provider.of<TvAiringTodayProvider>(context);
    TvTopRatedProvider tvTopRatedProvider =
        Provider.of<TvTopRatedProvider>(context);
    TvPopularProvider tvPopularProvider =
        Provider.of<TvPopularProvider>(context);
    TvOnTheAirProvider tvOnTheAirProvider =
        Provider.of<TvOnTheAirProvider>(context);
    PeoplePopularProvider peoplePopularProvider =
        Provider.of<PeoplePopularProvider>(context);

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
                  'TV',
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

    Widget buildCarouselTopRated() {
      return Container(
        margin: EdgeInsets.only(top: 30, right: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tvTopRatedProvider.tv == null
                ? [SizedBox()]
                : tvTopRatedProvider.tv.map((item) {
                    return item.backDropPath != null
                        ? TvCard(tv: item)
                        : SizedBox();
                  }).toList(),
          ),
        ),
      );
    }

    Widget handleErrorConnection() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin),
        child: Text(
          'Please Check Your Internet Connection',
          textAlign: TextAlign.center,
          style: whiteTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 15,
          ),
        ),
      );
    }

    Widget listItemPopular() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tvPopularProvider.tv == null
                ? [handleErrorConnection()]
                : tvPopularProvider.tv
                    .map(
                      (e) => TvTile(
                        tv: e,
                      ),
                    )
                    .toList(),
          ),
        ),
      );
    }

    Widget listItemOnTheAir() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tvOnTheAirProvider.tv == null
                ? [handleErrorConnection()]
                : tvOnTheAirProvider.tv
                    .map(
                      (e) => TvTile(
                        tv: e,
                      ),
                    )
                    .toList(),
          ),
        ),
      );
    }

    Widget listAiringToday() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tvAiringTodayProvider.tv == null
                ? [handleErrorConnection()]
                : tvAiringTodayProvider.tv
                    .map(
                      (e) => TvTile(
                        tv: e,
                      ),
                    )
                    .toList(),
          ),
        ),
      );
    }

    Widget buildPopularPeople() {
      return Container(
        margin: EdgeInsets.only(right: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: peoplePopularProvider.people == null
                ? [handleErrorConnection()]
                : peoplePopularProvider.people
                    .map((item) => PeopleTile(
                          people: item,
                        ))
                    .toList(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          buildTitle(),
          buildSubTitle('Top Rated TV Shows'),
          buildCarouselTopRated(),
          buildSubTitle('Popular People'),
          buildPopularPeople(),
          buildSubTitle('Popular TV'),
          listItemPopular(),
          buildSubTitle('On The Air TV'),
          listItemOnTheAir(),
          buildSubTitle('Airing Today TV'),
          listAiringToday(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

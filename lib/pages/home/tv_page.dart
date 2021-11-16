import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/providers/tv_airingtoday_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:moviez_streaming_dark/widgets/tv_card.dart';
import 'package:provider/provider.dart';

class TvPage extends StatelessWidget {
  const TvPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TvAiringTodayProvider tvAiringTodayProvider =
        Provider.of<TvAiringTodayProvider>(context);

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

    Widget buildSubTitle(String title) {
      return tvAiringTodayProvider.tv.isEmpty
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

    Widget buildCarousel() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tvAiringTodayProvider.tv.isEmpty
                ? [SizedBox()]
                : tvAiringTodayProvider.tv.map((item) {
                    return item.backDropPath != null
                        ? TvCard(tv: item)
                        : SizedBox();
                  }).toList(),
          ),
        ),
      );
    }

    Widget buildList() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Text(
          'From Disney',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: black,
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
          buildCarousel(),
          buildList(),
        ],
      ),
    );
  }
}

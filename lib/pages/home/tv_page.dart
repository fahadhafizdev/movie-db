import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/theme.dart';

class TvPage extends StatelessWidget {
  const TvPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildTitle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
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
            children: [
              //Note: tv card
            ],
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
          buildCarousel(),
          buildList(),
        ],
      ),
    );
  }
}

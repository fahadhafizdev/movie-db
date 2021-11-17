import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/tv_model.dart';
import 'package:moviez_streaming_dark/theme.dart';

class DetailTvPage extends StatefulWidget {
  TvModel tv;
  DetailTvPage(this.tv);
  @override
  State<DetailTvPage> createState() => _DetailTvPageState();
}

class _DetailTvPageState extends State<DetailTvPage> {
  @override
  Widget build(BuildContext context) {
    int rating = (widget.tv.voteAverage).round();
    // FavoriteMovieProvider favoriteMovieProvider =
    //     Provider.of<FavoriteMovieProvider>(context);
    // bool isFavorite = favoriteMovieProvider.isWhistList(widget.movie);
    return Scaffold(
      backgroundColor: Color(0xff19182C),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: widget.tv.backDropPath == null
                        ? AssetImage('assets/image_movie1.png')
                        : NetworkImage(
                            'https://www.themoviedb.org/t/p/w533_and_h300_bestv2' +
                                widget.tv.backDropPath,
                          ),
                  ),
                ),
              ),
              Container(
                height: 271,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0, 1),
                    end: Alignment(0, 0.06),
                    colors: [
                      Color(0xff19182C),
                      Color(0xff19182C).withOpacity(0),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/button_back.png',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // NOTE: TITLE
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    widget.tv.name,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: whiteTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  widget.tv.firstAirDate,
                  style: greyTextStyle.copyWith(
                      fontWeight: medium, color: Colors.white),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: rating / 2 >= 1 ? kYellowColor : kGreyColor,
                    ),
                    Icon(
                      Icons.star,
                      color: rating / 2 >= 2 ? kYellowColor : kGreyColor,
                    ),
                    Icon(
                      Icons.star,
                      color: rating / 2 >= 3 ? kYellowColor : kGreyColor,
                    ),
                    Icon(
                      Icons.star,
                      color: rating / 2 >= 4 ? kYellowColor : kGreyColor,
                    ),
                    Icon(
                      Icons.star,
                      color: rating / 2 >= 5 ? kYellowColor : kGreyColor,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: PLAY BUTTON & FAVORITE BUTTON
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'video player is coming soon',
                        textAlign: TextAlign.center,
                        style: whiteTextStyle.copyWith(fontWeight: regular),
                      ),
                      backgroundColor: Color(0xff38ABBE),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/button_play.png',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          'Wishlist TV is Coming Soon',
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/icon_love_round_nonactived.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.tv.overview,
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          )
        ],
      ),
    );
  }
}

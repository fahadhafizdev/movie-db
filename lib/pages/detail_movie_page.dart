import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/movie_model.dart';
import 'package:moviez_streaming_dark/theme.dart';

// ignore: must_be_immutable
class DetailMoviePage extends StatefulWidget {
  MovieModel movie;
  DetailMoviePage({Key key, this.movie}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    int rating = (widget.movie.voteAverage).round();

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
                    image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w533_and_h300_bestv2' +
                          widget.movie.backDropPath,
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
                    widget.movie.originalTitle,
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
                  widget.movie.releaseDate,
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
                        'Pemutar vidio belum tersedia',
                        style: whiteTextStyle.copyWith(fontWeight: semiBold),
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
                    setState(() {
                      isFavorite = !isFavorite;
                      print(isFavorite);
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: isFavorite
                            ? AssetImage('assets/icon_love_round_actived.png')
                            : AssetImage(
                                'assets/icon_love_round_nonactived.png'),
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
              widget.movie.overview,
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

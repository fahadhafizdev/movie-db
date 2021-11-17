import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/theme.dart';

class DetailMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage('assets/image_movie3.png'),
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
              Container(
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
            ],
          ),

          // NOTE: TITLE
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Text(
                  'The Witcher 2021',
                  style: whiteTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Sci-Fiction',
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
                      color: kYellowColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.star,
                      color: kYellowColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.star,
                      color: kYellowColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.star,
                      color: kYellowColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.star,
                      color: kYellowColor.withOpacity(0.3),
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
                      content: Text('Pemutar vidio belum tersedia'),
                      backgroundColor: Colors.green,
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
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/button_favorite.png',
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
              'dddddddddddddddd dddddddddddddddddddd ddddddddddddddddddddddddddddddddd dddddddddddddddddddddddddddddddd dddddddddddddddddd',
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

import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/movie_model.dart';
import 'package:moviez_streaming_dark/models/tv_model.dart';
import 'package:moviez_streaming_dark/theme.dart';

class TvTile extends StatelessWidget {
  final TvModel tv;

  const TvTile({Key key, this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int rating = (tv.voteAverage).round();

    return Container(
      width: 300,
      margin: EdgeInsets.only(left: defaultMargin),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 127,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
                      tv.posterPath,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tv.name,
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  tv.firstAirDate,
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
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
          SizedBox(width: 12),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/movie_model.dart';
import 'package:moviez_streaming_dark/theme.dart';

class MovieTile extends StatelessWidget {
  final MovieModel movies;

  const MovieTile({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int rating = (movies.voteAverage).round();

    return Container(
      margin: EdgeInsets.only(bottom: 30),
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
                      movies.posterPath,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movies.originalTitle,
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  movies.releaseDate,
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

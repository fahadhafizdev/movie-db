import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/movie_model.dart';
import 'package:moviez_streaming_dark/theme.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movies;

  const MovieCard({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int rating = (movies.voteAverage).round();

    return Container(
      width: 300,
      margin: EdgeInsets.only(
        left: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: Image.network(
              'https://www.themoviedb.org/t/p/w533_and_h300_bestv2' +
                  movies.backDropPath,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                      overflow: TextOverflow.ellipsis,
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
                  ],
                ),
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
        ],
      ),
    );
  }
}

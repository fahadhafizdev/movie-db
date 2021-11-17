import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/models/people_model.dart';
import 'package:moviez_streaming_dark/theme.dart';

class PeopleTile extends StatelessWidget {
  final PeopleModel people;

  const PeopleTile({Key key, this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              people.name,
              style: whiteTextStyle,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color(0xff38ABBE),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: defaultMargin, top: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${people.profilePath}',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

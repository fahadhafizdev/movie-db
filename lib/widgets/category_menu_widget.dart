import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/theme.dart';

class CategoryMenu extends StatelessWidget {
  final String name;
  final bool isActive;

  CategoryMenu({
    Key key,
    this.name,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: kGreyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: whiteTextStyle.copyWith(
          fontSize: 15,
          fontWeight: black,
        ),
      ),
    );
  }
}

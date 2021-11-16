import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/providers/category_menu_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:provider/provider.dart';

class CategoryMenu extends StatelessWidget {
  final String name;

  CategoryMenu({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryMenuProvider categoryMenuProvider =
        Provider.of<CategoryMenuProvider>(context);
    return GestureDetector(
      onTap: () {
        categoryMenuProvider.categorySelected = name;
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: name == categoryMenuProvider.categorySelected
              ? kWhiteColor.withOpacity(0.3)
              : kGreyColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          name,
          style: whiteTextStyle.copyWith(
            fontSize: 15,
            fontWeight: black,
          ),
        ),
      ),
    );
  }
}

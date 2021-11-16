import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/providers/page_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:provider/provider.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;

  final int index;

  const BottomNavbarItem({Key key, this.imageUrl, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);
    return GestureDetector(
      onTap: () {
        pageProvider.currentPage = index;
        print(index);
      },
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            imageUrl,
            width: 26,
            height: 26,
            color:
                (index == pageProvider.currentPage) ? purpleColor : kGreyColor,
          ),
          Spacer(),
          (index == pageProvider.currentPage)
              ? Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(1000),
                      )),
                )
              : Container()
        ],
      ),
    );
  }
}

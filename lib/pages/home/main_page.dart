import 'package:flutter/material.dart';
import 'package:moviez_streaming_dark/pages/home/tv_page.dart';
import 'package:moviez_streaming_dark/pages/home/wishlist_page.dart';
import 'package:moviez_streaming_dark/providers/page_provider.dart';
import 'package:moviez_streaming_dark/theme.dart';
import 'package:moviez_streaming_dark/widgets/bottom_navbar_item_widget.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);

    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return WishListPage();
        case 2:
          return TvPage();

        default:
          return HomePage();
      }
    }

    Widget customNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - 2 * edge,
          margin: EdgeInsets.symmetric(horizontal: edge, vertical: 10),
          decoration: BoxDecoration(
            color: kBgBottomNavbar,
            borderRadius: BorderRadius.all(Radius.circular(
              23,
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavbarItem(
                imageUrl: 'assets/video.png',
                index: 0,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/icon_love.png',
                index: 1,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/tv.png',
                index: 2,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [buildContent(pageProvider.currentPage), customNavigation()],
      ),
    );
  }
}

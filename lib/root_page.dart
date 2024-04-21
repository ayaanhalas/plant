import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/login_page.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/Detail_page.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/screens/favorite_page.dart';
import 'package:plant_app/screens/home_page.dart';
import 'package:plant_app/screens/profile_page.dart';
import 'package:plant_app/screens/scan_page.dart';

class Rootpage extends StatefulWidget {
  const Rootpage({super.key});

  @override
  State<Rootpage> createState() => _RootpageState();
}

class _RootpageState extends State<Rootpage> {
  List<Plant> favorite = [];
  List<Plant> mycart = [];
  int _bottomnavindex = 0;

  //list of the pages
  List<Widget> _widgetOptions() {
    return [
      const Homepage(),
      favoritepage(
        favoriteplants: favorite,
      ),
      Cartpage(
        addedTocartplants: mycart,
      ),
      const Profilepage(),
    ];
  }

  // list of the pages icons
  List<IconData> iconlist = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  // list of the pages titles
  List<String> titleList = [
    'home',
    'fovorite',
    'cart',
    'profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomnavindex],
              style: TextStyle(
                color: Constants.blackcolor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackcolor,
              size: 30.0,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: IndexedStack(index: _bottomnavindex, children: _widgetOptions()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const Scanpage(),
                  type: PageTransitionType.bottomToTop));
        },
        child: Image.asset('assets/code-scan.png', height: 30.0),
        backgroundColor: Constants.primarycolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primarycolor,
          activeColor: Constants.primarycolor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconlist,
          activeIndex: _bottomnavindex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomnavindex = index;
              // final List<Plant>favoritedplants=Plant.getfavoritedplants();
            });
          }),
    );
  }
}

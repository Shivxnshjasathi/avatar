import 'package:avatar/catalogs.dart';
import 'package:avatar/main_screens/home.dart';
import 'package:avatar/main_screens/profile.dart';
import 'package:avatar/main_screens/wardrob2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'main_screens/fav.dart';
import 'main_screens/trail.dart';

class Constains extends StatefulWidget {
  const Constains({Key? key}) : super(key: key);

  @override
  _Constains createState() => _Constains();
}

class _Constains extends State<Constains> {
  int pageIndex = 0;

  final pages = [
    const Home(),
    const Fav(),
    trail(),
    const profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[pageIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: GNav(
          gap: 5,
          haptic: true,
          backgroundColor: Colors.white,
          activeColor: Colors.black,
          color: Colors.black,
          selectedIndex: pageIndex,
          onTabChange: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          tabBackgroundColor: Colors.pink.shade50,
          tabs: [
            GButton(
              icon: CupertinoIcons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite,
              text: "Favorite",
            ),
            GButton(
              icon: CupertinoIcons.cube_box,
              text: "Wardrobe",
            ),
            GButton(
              icon: CupertinoIcons.profile_circled,
              text: "Profile",
            )
          ],
        ),
      ),
    );
  }
}

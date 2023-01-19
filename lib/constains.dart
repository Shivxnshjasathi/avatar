import 'package:avatar/catalogs.dart';
import 'package:avatar/class.dart';
import 'package:avatar/fav.dart';
import 'package:avatar/home.dart';
import 'package:avatar/profile.dart';
import 'package:avatar/wardrobe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    const ProductCard(),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wardrobe2 extends StatefulWidget {
  const Wardrobe2({super.key});

  @override
  State<Wardrobe2> createState() => _Wardrobe2State();
}

class _Wardrobe2State extends State<Wardrobe2> {
  List MyArray = [];

  int _selectedCategoryIndex = -1;

  Future getDress() async {
    await FirebaseFirestore.instance
        .collection("test_category")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((element) {
                print(element.data());
                var a = element.data();

                //DressIDs.add(a["CatLevel1"]);
                MyArray.add(a);
                print(MyArray);
              }),

            });
  }

  List<String> tabs = [
    "Watch Top",
    "Watch Shirts",
    "Watch Shirts",
    "Watch Top",
  ];
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 5;
      case 1:
        return 85;
      case 2:
        return 178;
      case 3:
        return 273;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 65;
      case 1:
        return 80;
      case 2:
        return 80;
      case 3:
        return 65;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wardrobe",
                  style: GoogleFonts.alata(
                      fontSize: 30, fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(CupertinoIcons.search),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 7,
            child: Expanded(
                child: FutureBuilder(
              future: getDress(),
              builder: (context, snapshot) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: MyArray.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = index;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 10,
                              decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Center(
                                child: Text(
                                  MyArray[index]['title'],
                                  style: GoogleFonts.alata(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            )),
          ),
          SizedBox(
            width: size.width,
            height: size.height / 2,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: size.width,
                  height: size.height * 0.05,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.04,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: _selectedCategoryIndex > -1
                                  ? MyArray[_selectedCategoryIndex]
                                          ['sub_category']
                                      .length
                                  : 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 15 : 23, top: 7),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: Text(
                                      MyArray[_selectedCategoryIndex]
                                          ['sub_category'][index],
                                      style: GoogleFonts.alata(
                                        fontSize: current == index ? 16 : 14,
                                        fontWeight: current == index
                                            ? FontWeight.w400
                                            : FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.fastLinearToSlowEaseIn,
                        bottom: 0,
                        left: changePositionedOfLine(),
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedContainer(
                          margin: const EdgeInsets.only(left: 10),
                          width: changeContainerWidth(),
                          height: size.height * 0.008,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade50,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.fastLinearToSlowEaseIn,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.3),
                  child: Text(
                    "${tabs[current]} Tab Content",
                    style: GoogleFonts.alata(fontSize: 30),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

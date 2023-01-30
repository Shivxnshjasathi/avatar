import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class trail extends StatefulWidget {
  const trail({Key? key}) : super(key: key);

  @override
  _trail createState() => _trail();
}

class _trail extends State<trail> {
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

  @override
  Widget build(BuildContext context) {
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
                              showDataAlert();
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
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Dress",
                  style: GoogleFonts.alata(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(),
                    AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20.0,
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      title: Text(
                        MyArray[_selectedCategoryIndex]['title'],
                        style: GoogleFonts.alata(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      content: Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: MediaQuery.of(context).size.width / 1.05,
                        child:
                        ListView.builder(
                            itemCount: _selectedCategoryIndex > -1
                                ? MyArray[_selectedCategoryIndex]
                            ['sub_category']
                                .length
                                : 0,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                title: Text(
                                  MyArray[_selectedCategoryIndex]
                                  ['sub_category'][index],
                                  style: GoogleFonts.alata(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  'Expand this Sub Cat to see its contents',
                                  style: GoogleFonts.alata(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                // Contents
                                children: [
                                  ListTile(
                                      title: Text(
                                        'Athletic leggings',
                                        style: GoogleFonts.alata(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  ListTile(
                                    title: Text(
                                      'Athletic pants',
                                      style: GoogleFonts.alata(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  ListTile(
                                      title: Text(
                                        'Athletic shots',
                                        style: GoogleFonts.alata(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(),
            ],
          );
        });
  }
}

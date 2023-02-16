import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wardrobe2 extends StatefulWidget {
  final List Myarray;
  Wardrobe2({required Key key, required this.Myarray}) : super(key: key);

  @override
  State<Wardrobe2> createState() => _Wardrobe2State();
}

class _Wardrobe2State extends State<Wardrobe2> {
  @override
  List Maindata = [];
  List tempArray = [];

  int current = 0;
  String selected_category = "";

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

  Future getdata(selected_cat) async {
    print(selected_cat);
    tempArray = [];
    await FirebaseFirestore.instance
        .collection("user_v2")
        .doc("0000000000")
        .collection("products")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((element) {
                //print(element.id);

                var a = element.data();
                if (a["cats"].contains(selected_cat.toLowerCase())) {
                  //Maindata.add(a);
                  tempArray.add(a);
                }
              }),
              setState(() {
                Maindata = tempArray;
              }),
              print(Maindata),
            });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    child: Expanded(child: FutureBuilder(
                      builder: (context, snapshot) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.Myarray.length > 0
                                ? widget.Myarray[0].keys.toList().length
                                : 0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  var selected_ca =
                                      widget.Myarray[0].keys.toList()[index];
                                  setState(() {
                                    selected_category = selected_ca;

                                    print(widget.Myarray[0][selected_category]);
                                  });
                                  getdata(selected_ca);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      decoration: BoxDecoration(
                                          color: Colors.pink.shade50,
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        child: Center(
                                          child: Text(
                                            widget.Myarray[0].keys
                                                .toList()[index],
                                            style: GoogleFonts.alata(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
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
                ),
                Container(
                  width: size.width,
                  height: size.height / 1.2,
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
                                    itemCount: selected_category != ""
                                        ? widget
                                            .Myarray[0][selected_category].keys
                                            .toList()
                                            .length
                                        : 0,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: index == 0 ? 15 : 23, top: 7),
                                        child: GestureDetector(
                                          onTap: () {
                                            print(widget
                                                .Myarray[0][selected_category]
                                                .keys
                                                .toList()[index]);
                                            getdata(widget
                                                .Myarray[0][selected_category]
                                                .keys
                                                .toList()[index]);
                                          },
                                          child: Text(
                                            widget.Myarray[0][selected_category]
                                                .keys
                                                .toList()[index],
                                            style: GoogleFonts.alata(
                                              fontSize:
                                                  current == index ? 16 : 14,
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
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Expanded(child: FutureBuilder(
                          builder: (context, snapshot) {
                            return GridView.builder(
                              itemCount:
                                  Maindata.length > 0 ? Maindata.length : 0,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.5,
                                      crossAxisSpacing: 0.0,
                                      mainAxisSpacing: 12.0),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.black12, width: 1.5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Image.network(
                                                Maindata[index]["img_url"][0],
                                                scale: 1),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Text(
                                              Maindata[index]["brand"],
                                              style: GoogleFonts.alata(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 10),
                                            child: Text(
                                              Maindata[index]["ordered_item"],
                                              style: GoogleFonts.alata(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 2.0),
                                                  child: Text(
                                                    'Size : ' +
                                                        Maindata[index]["size"],
                                                    style: GoogleFonts.alata(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 2.0),
                                                  child: Text(
                                                    'Date : ' +
                                                        Maindata[index]["date"],
                                                    style: GoogleFonts.alata(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )),
                      ),
                    ],
                  ),
                ),
              ])),
        ));
  }
}

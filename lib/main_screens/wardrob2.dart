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

  Future getdata(selected_cat) async {
    print(selected_cat);
    tempArray = [];
    await FirebaseFirestore.instance
        .collection("user_v2")
        .doc("000000123")
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

  bool _isLongPressed = false;

  void _onLongPress() {
    setState(() {
      _isLongPressed = true;
    });
  }

  void _onLongPressEnd() {
    setState(() {
      _isLongPressed = false;
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
                                height: size.height / 10,
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
                                            setState(() {
                                              current = index;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                widget
                                                    .Myarray[0]
                                                        [selected_category]
                                                    .keys
                                                    .toList()[index],
                                                style: GoogleFonts.alata(
                                                  fontSize: current == index
                                                      ? 16
                                                      : 16,
                                                  fontWeight: current == index
                                                      ? FontWeight.w400
                                                      : FontWeight.w300,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Icon(
                                                Icons.circle,
                                                size: 10,
                                                color: current == index
                                                    ? Colors.pink.shade50
                                                    : Colors.transparent,
                                              )
                                            ],
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
                                      crossAxisCount: 3,
                                      childAspectRatio: 0.62,
                                      crossAxisSpacing: 0.06,
                                      mainAxisSpacing: 12.0),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onLongPress: _onLongPress,
                                  onLongPressEnd: (_) => _onLongPressEnd(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black12, width: 1.5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 5),
                                              child: Container(
                                                child: _isLongPressed
                                                    ? Container(
                                                        height: 10,
                                                        width: 10,
                                                        color: Color.fromRGBO(
                                                            Maindata[index]
                                                                    ["color"]
                                                                .toList()[0]
                                                                .toInt(),
                                                            Maindata[index]
                                                                    ["color"]
                                                                .toList()[1]
                                                                .toInt(),
                                                            Maindata[index]
                                                                    ["color"]
                                                                .toList()[2]
                                                                .toInt(),
                                                            1),
                                                        //  child: Text(
                                                        //    'Size : ' +
                                                        //      Maindata[index]
                                                        //      ["color"]
                                                        //         .toList()
                                                        //         .join(","),
                                                        // style:
                                                        // GoogleFonts.alata(
                                                        //     fontSize: 10,
                                                        //     fontWeight:
                                                        //     FontWeight
                                                        //         .w300),
                                                        //  ),
                                                      )
                                                    : Image.network(
                                                        Maindata[index]
                                                            ["img_url"][0],
                                                        scale: 1.4),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 10),
                                              child: _isLongPressed
                                                  ? Text(
                                                      'Price : ' +
                                                          Maindata[index]
                                                              ["price"],
                                                      style: GoogleFonts.alata(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    )
                                                  : Text(
                                                      Maindata[index]["brand"],
                                                      style: GoogleFonts.alata(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 10),
                                              child: _isLongPressed
                                                  ? Text(
                                                      'Item : ' +
                                                          Maindata[index]
                                                              ["ordered_item"],
                                                      style: GoogleFonts.alata(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    )
                                                  : Text(
                                                      'vendors : ' +
                                                          Maindata[index]
                                                              ["vendors"],
                                                      style: GoogleFonts.alata(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                            ),
                                          ],
                                        ),
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

  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void _showContextMenu(int index) async {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();

    ShapeBorder:
    BorderRadius.circular(20);

    final result = await showMenu(
        context: context,

        // Show the context menu at the tap location
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),

        // set a list of choices for the context menu
        items: [
          PopupMenuItem(
            value: 'comment',
            child: Container(
              child: Image.network(Maindata[index]["img_url"][0], scale: 1),
            ),
          ),
          PopupMenuItem(
            value: 'favorites',
            child: Text(
              'Brand : ' + Maindata[index]["brand"],
              style:
                  GoogleFonts.alata(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          PopupMenuItem(
            value: 'favorites',
            child: Text(
              'Item : ' + Maindata[index]["ordered_item"],
              style:
                  GoogleFonts.alata(fontSize: 12, fontWeight: FontWeight.w100),
            ),
          ),
          PopupMenuItem(
            value: 'favorites',
            child: Text(
              'Size : ' + Maindata[index]["size"],
              style:
                  GoogleFonts.alata(fontSize: 12, fontWeight: FontWeight.w100),
            ),
          ),
          PopupMenuItem(
            value: 'favorites',
            child: Text(
              'Vendors : ' + Maindata[index]["vendors"],
              style:
                  GoogleFonts.alata(fontSize: 12, fontWeight: FontWeight.w100),
            ),
          ),
        ]);

    // Implement the logic for each choice here
    switch (result) {
      case 'favorites':
        debugPrint('Add To Favorites');
        break;
      case 'comment':
        debugPrint('Write Comment');
        break;
      case 'hide':
        debugPrint('Hide');
        break;
    }
  }
}

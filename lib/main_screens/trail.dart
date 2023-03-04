import 'package:avatar/main_screens/wardrob2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class trail extends StatefulWidget {
  const trail({Key? key}) : super(key: key);

  @override
  _trail createState() => _trail();
}

class _trail extends State<trail> {
  List MyArray = [];
  //Map<String, dynamic> MyArray = {};

  List CatNamesArray = [];
  List MainArray = [];

  List Cat = [];
  List SubCat = [];
  List SubSubCat = [];
  List DATA = [];

  List Test = [];
  List tempArray = [];

  int _selectedCategoryIndex = -1;
  String selected_category = "";
  List ListSecondArray = [];

  Future getDress() async {
//print("TEST");
    // await FirebaseFirestore.instance

    //     .collection("test_category")
    //     .get()
    //     .then((snapshot) => {
    //           snapshot.docs.forEach((element) {
    //             //print(element.data());
    //             var a = element.data();

    //             //DressIDs.add(a["CatLevel1"]);
    //             MyArray.add(a);
    //             //print(MyArray);
    //           }),
    //         });

    DATA = [];
    DATA.addAll({});
    MyArray = [];
    var x = {};
    tempArray = [];

    await FirebaseFirestore.instance
        .collection("user_v2")
        .doc("000000124")
        .collection("products")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((element) {
                //print(element.id);

                var a = element.data();
                print(a["cats"]);
                //  print(selected_cat);
                // a["cats"].forEach((itemcat) {
                // if (selected_cat
                //      .toLowerCase()
                //     .substring(0, selected_cat.length - 1) ==
                //     itemcat.toLowerCase() ||
                //    selected_cat.toLowerCase() == itemcat.toLowerCase()) {
                //Maindata.add(a);

                //   tempArray.add(a);
                // }
                // });

                //if (a["cats"].contains(selected_cat.toLowerCase())) {

                // tempArray.add(a);
                //}
              }),
              // setState(() {
              //  Maindata = tempArray;
              //  }),
              //  print(Maindata),
            });

    await FirebaseFirestore.instance
        .collection("Categories")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((element) {
                var a = element.data();

                if (a['CatLevel1'] != null) {
                  //print(a['CatLevel1']);
                  if (!x.containsKey(a['CatLevel1'])) {
                    x[a['CatLevel1']] = {};
                  }
                  if (a['CatLevel2'] != null) {
                    //first
                    if (!(x[a['CatLevel1']].containsKey(a['CatLevel2']))) {
                      x[a['CatLevel1']][a['CatLevel2']] = {};
                    }
                    //print(x);
                    //two
                    if (a['CatLevel3'] != null) {
                      if (!(x[a['CatLevel1']][a['CatLevel2']]
                          .containsKey(a['CatLevel3']))) {
                        x[a['CatLevel1']][a['CatLevel2']][a['CatLevel3']] = {};
                        print("Check");
                      }
                    } else {
                      x[a['CatLevel1']][a['CatLevel2']][a['CatName']] = {};
                    }
                  } else {
                    x[a['CatLevel1']][a['CatName']] = {};
                  }
                }
                //  print(x);
                //  MyArray.add(x);
                MyArray.add(x);
                //MyArray=x;
                //print(x);
              })
            });
    //print(MyArray);
    print(MyArray);

    //   if(a['CatLevel1']){
    //     print("Check");
    //     if(!x[a['CatLevel1']]){
    //       x[a['CatLevel1']]={};
    //     }
    //     if(a['CatLevel2']){
    //      if(!x[a['CatLevel1']][a['CatLevel2']]){
    //       x[a['CatLevel1']][a['CatLevel2']]={};
    //      }
    //      if(a['CatLevel3']){
    //         if(!x[a['CatLevel1']][a['CatLevel2']][a['CatLevel3']]){
    //           x[a['CatLevel1']][a['CatLevel2']][a['CatLevel3']]={};
    //         }
    //       }else{
    //         x[a['CatLevel1'][a['CatLevel2']][a['CatLevel3']]]={};
    //       }
    //     }else{
    //       x[a['CatLevel1'][a['CatName']]]={};
    //     }
    //   }
    //  print(x);

    // x['Level2']=DATA;
    //  Test=[x];

    //  var a = element.data();
    //  if(a['CatLevel1']!=null){
    //   x['Cat']=a['CatLevel1'];
    //   if(a['CatLevel3']!=null){
    //     x['Level 3']=a['CatLevel3'];
    //   }
    //   if(a['CatLevel2']!=null){
    //     if(!DATA.contains(a['CatLevel2'])){
    //       DATA.add(a['CatLevel2']);
    //     }
    //   }
    //   // if(a['CatLevel2']!=null){
    //   //     x['Level 2'].add(3);

    //   // }
    //  }
    //  x['Level2']=DATA;
    //   Test=[x];
    //print(x);

    //  if(a['CatLevel1']){
    //   if(!DATA.contains(a['CatLevel1'])){
    //     DATA[0]['CatLevel1']={};
    //   }
    //  }

    // Cat.add(a['CatLevel1']);
    // print(a['CatLevel2']);

    // //if(a['CatLevel1']=='Clothes'){
    //   if(a['CatLevel2']!=null){
    //     if(!SubCat.contains(a['CatLevel2'])){
    //       SubCat.add(a['CatLevel2']);
    //     }else{
    //       //print("IS THERE");
    //     }
    //   }
    //   if(a['CatName']!=null){
    //     if(!SubSubCat.contains(a['CatName'])){
    //       SubSubCat.add(a['CatName']);
    //     }else{
    //       //print("SUB SUB IS THERE");
    //     }
    //   }
    //}

    //x['Level 2']=Test;
    //DATA.add({"CAT":Cat,"SubCat":SubCat,"SubSubCat":SubSubCat});
    //print(Test);
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 7,
              child: Expanded(
                  child: FutureBuilder(
                future: getDress(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: MyArray.length > 0
                          ? MyArray[0].keys.toList().length
                          : 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selected_category =
                                  MyArray[0].keys.toList()[index];
                              ListSecondArray.add(
                                  MyArray[0][selected_category]);
                              print(ListSecondArray);
                            });
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: Wardrobe2(
                                    Myarray: [MyArray[0][selected_category]],
                                    key: Key("")),
                              ),
                            );
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
                                    MyArray[0].keys.toList()[index],
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
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "",
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
                        selected_category,
                        //MyArray[0][selected_category].keys.toList(),
                        style: GoogleFonts.alata(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      content: Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: MediaQuery.of(context).size.width / 1.05,
                        child: ListView.builder(
                            itemCount: ListSecondArray.length > 0
                                ? ListSecondArray[0].keys.toList().length
                                : 0,
                            itemBuilder: (context, index) {
                              return ListSecondArray[0][ListSecondArray[0]
                                              .keys
                                              .toList()[index]]
                                          .keys
                                          .toList()
                                          .length >
                                      0
                                  ? ExpansionTile(
                                      initiallyExpanded: false,
                                      title: Text(
                                        ListSecondArray[0].keys.toList()[index],
                                        style: GoogleFonts.alata(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      // Contents
                                      children: [
                                          for (String item in ListSecondArray[0]
                                                  [ListSecondArray[0]
                                                      .keys
                                                      .toList()[index]]
                                              .keys
                                              .toList())
                                            ListTile(
                                              title: Text(item),
                                            ),
                                        ])
                                  : ListTile(
                                      title: Text(
                                        ListSecondArray[0].keys.toList()[index],
                                        style: GoogleFonts.alata(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500),
                                      ),
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

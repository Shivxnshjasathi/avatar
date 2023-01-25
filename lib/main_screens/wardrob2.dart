import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// imports start for Firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// imports end for firebase

class Wardrobe2 extends StatefulWidget {
  
  
  // Code Start For Firebase Integration
  
//   void main() async {
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
// runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return MaterialApp(
// 	title: 'Firebase',
// 	home: AddData(),
// 	);
// }
// }

// class AddData extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
// 	appBar: AppBar(
// 		backgroundColor: Colors.green,
// 		title: Text("geeksforgeeks"),
// 	),
// 	body: StreamBuilder(
// 		stream: FirebaseFirestore.instance.collection('user_v2').doc(user.uid)snapshots(),
// 		builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// 		if (!snapshot.hasData) {
// 			return Center(
// 			child: CircularProgressIndicator(),
// 			);
// 		}

// 		return ListView(
// 			children: snapshot.data.docs.map((document) {
// 			return Container(
// 				child: Center(child: Text(document['text'])),
// 			);
// 			}).toList(),
// 		);
// 		},
// 	),
// 	);
// }
// }
  
  // Code End For Firebase Integration
  
  
  const Wardrobe2({super.key});

  @override
  State<Wardrobe2> createState() => _Wardrobe2State();
}

class _Wardrobe2State extends State<Wardrobe2> {
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
            width: MediaQuery.of(context).size.width / 1.05,
            height: MediaQuery.of(context).size.height / 7,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 10,
                        decoration: BoxDecoration(
                            color: Colors.pink.shade50, shape: BoxShape.circle),
                      ),

                      Text(
                        "Dress",
                        style: GoogleFonts.alata(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 10,
                        decoration: BoxDecoration(
                            color: Colors.pink.shade50, shape: BoxShape.circle),
                      ),

                      Text(
                        "Dress",
                        style: GoogleFonts.alata(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 10,
                        decoration: BoxDecoration(
                            color: Colors.pink.shade50, shape: BoxShape.circle),
                      ),

                      Text(
                        "Shoes",
                        style: GoogleFonts.alata(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 10,
                        decoration: BoxDecoration(
                            color: Colors.pink.shade50, shape: BoxShape.circle),
                      ),

                      Text(
                        "Bag",
                        style: GoogleFonts.alata(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 10,
                        decoration: BoxDecoration(
                            color: Colors.pink.shade50, shape: BoxShape.circle),
                      ),

                      Text(
                        "Accessories",
                        style: GoogleFonts.alata(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40,),
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
                              itemCount: tabs.length,
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
                                      tabs[index],
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

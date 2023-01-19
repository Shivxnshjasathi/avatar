
import 'package:avatar/catalogs.dart';
import 'package:avatar/class.dart';
import 'package:avatar/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dresstile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Wardrobe extends StatefulWidget {
  const Wardrobe({super.key});

  @override
  State<Wardrobe> createState() => _Wardrobe();
}

class _Wardrobe extends State<Wardrobe> {
  List<String> DressIDs = [];

  Future getDress() async {
    await FirebaseFirestore.instance
        .collection("user_v2")
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              DressIDs.add(element.reference.id);
            }));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductCard();
            },
          ),
        ),
        child: const Icon(Icons.favorite),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),

          // good morning bro
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Good morning,',
              style: GoogleFonts.alata(
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),

          const SizedBox(height: 4),

          // Let's order fresh items for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Here's a new Dress for you",
              style: GoogleFonts.alata(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          const SizedBox(height: 24),
          const SizedBox(height: 24),

          // categories -> horizontal listview
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Items",
              style: GoogleFonts.alata(
                //fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          Expanded(child: FutureBuilder(
            future: getDress(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: DressIDs.length,
                  itemBuilder: (context, index) {
                return ListTile(
                  title: Text(DressIDs[index]),
                );
              });
            },
          )),

          // recent orders -> show last 3

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

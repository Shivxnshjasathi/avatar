import 'package:avatar/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_circle_left_outlined),
                      Text(
                        "iTwirly",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.account_circle),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Image.asset("lib/5277588-removebg-preview.png"),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Manage Cloths",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.thumb_up,

                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.cleaning_services_rounded,

                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        // <-- SEE HERE
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0),
                                        ),
                                      ),
                                      builder: (context) {
                                        return SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height /
                                              2,
                                          child: Consumer<DressModel>(
                                            builder: (context, value, child) {
                                              return Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 20),
                                                    child: Text(
                                                      "My Dresses",
                                                      style: GoogleFonts.alata(
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),

                                                  // list view of cart
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          12.0),
                                                      child: ListView.builder(
                                                        itemCount: value
                                                            .cartItems.length,
                                                        padding:
                                                        EdgeInsets.all(12),
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .pink
                                                                      .shade50,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      8)),
                                                              child: ListTile(
                                                                leading:
                                                                Image.asset(
                                                                  value.cartItems[
                                                                  index][2],
                                                                  height: 36,
                                                                ),
                                                                title: Text(
                                                                  value.cartItems[
                                                                  index][0],
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                      18),
                                                                ),
                                                                subtitle: Text(
                                                                  value.cartItems[
                                                                  index][1],
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                      12),
                                                                ),
                                                                trailing:
                                                                IconButton(
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .cancel),
                                                                  onPressed: () => Provider.of<
                                                                      DressModel>(
                                                                      context,
                                                                      listen:
                                                                      false)
                                                                      .removeItemFromCart(
                                                                      index),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width / 2.3,
                                  height:
                                  MediaQuery.of(context).size.height / 4.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.black12, width: 2),
                                      color: Colors.pink.shade50),
                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child:
                                    Image.asset("lib/clothes-hanger.png"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.3,
                                height:
                                MediaQuery.of(context).size.height / 4.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black12, width: 2),
                                    color: Colors.pink.shade50),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.3,
                                height:
                                MediaQuery.of(context).size.height / 4.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black12, width: 2),
                                    color: Colors.pink.shade50),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.3,
                                height:
                                MediaQuery.of(context).size.height / 4.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black12, width: 2),
                                    color: Colors.pink.shade50),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

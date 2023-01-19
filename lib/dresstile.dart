import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DressItemTile extends StatelessWidget {
  final String itemName;
  final String itemBrand;
  final String imagePath;
  void Function()? onPressed;

  DressItemTile({
    super.key,
    required this.itemName,
    required this.itemBrand,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(

        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // item image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Image.asset(
                  imagePath,
                  scale: 1,
                ),
              ),

              // item name
              Text(
                itemName,
                style: GoogleFonts.alata(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                itemBrand,
                style: GoogleFonts.alata(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
              MaterialButton(
                onPressed: onPressed,

                child: Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: MediaQuery.of(context).size.height / 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12, width: 2),
                      color: Colors.black),

                  child: Center(
                    child: Text(
                      "Select",
                      style: GoogleFonts.alata(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
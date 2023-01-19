import 'package:flutter/material.dart';

class DressModel extends ChangeNotifier {





  final List _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    ["Top", " L V ", "lib/White_Top_Front_large_m.jpg", Colors.pink.shade50],
    ["Top", " L V ", "lib/White_Top_Front_large_m.jpg", Colors.pink.shade50],
    ["Top", " L V ", "lib/White_Top_Front_large_m.jpg", Colors.pink.shade50],
    ["Top", " L V ", "lib/White_Top_Front_large_m.jpg", Colors.pink.shade50],
  ];

  // list of cart items
  List _SelectedItems = [];

  get cartItems => _SelectedItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _SelectedItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _SelectedItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price

}

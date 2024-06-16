// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class CartItem {
    int id;
    String menu;
    String merchant;
    int price;
    int quantity;
    String imageUrl;
    bool isBeingDelivered;
    String? notes;

   CartItem({
    required this.id,
    required this.menu,
    required this.merchant,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.isBeingDelivered,
    this.notes,
  });
}

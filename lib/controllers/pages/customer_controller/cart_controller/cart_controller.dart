
import 'package:get/get.dart';
import 'package:yumyum_amicta/models/cart_model/cart_model.dart';

import 'package:yumyum_amicta/models/product_model/product_model.dart';
import 'package:yumyum_amicta/shared/theme.dart';

class CartController extends GetxController {
  final Map<String, CartModel> _items = {};

  Map<String, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity =0;
    if (_items.containsKey(product.encryptedId)) {
      _items.update(product.encryptedId!, (value){
        totalQuantity = value.quantity!+quantity;
        return CartModel(
          encryptedId: value.encryptedId,
          encryptedMerchantId: value.encryptedMerchantId,
          name: value.name,
          price: value.price,
          image: value.image,
          quantity: value.quantity! + quantity,
          isExist: true,
        );
      });
      if(totalQuantity <= 0){
        _items.remove(product.encryptedId);
      }
    } else {
      if(quantity > 0){
        _items.putIfAbsent(product.encryptedId!, () {
        return CartModel(
          encryptedId: product.encryptedId,
          encryptedMerchantId: product.encryptedMerchantId,
          name: product.name,
          price: product.price,
          image: product.image,
          quantity: quantity,
          isExist: true,
        );
      });
      }else {
        Get.snackbar('Item count', 'harus masukkan setidaknya 1 product ',
          backgroundColor: purpleColor, colorText: whiteColor);
      }
    }
    //print(_items);
  }


   bool existInCart(ProductModel product){
    if(_items.containsKey(product.encryptedId)) {
      return true;
    } else {
      return false;
    }
  }


  int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.encryptedId)){
      _items.forEach((key, value){
        if(key == product.encryptedId){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity=0;
    _items.forEach((key, value){
      totalQuantity  += value.quantity!;
    });
    return totalQuantity;
  }

}

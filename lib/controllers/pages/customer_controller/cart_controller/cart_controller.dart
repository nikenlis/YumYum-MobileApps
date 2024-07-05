import 'package:get/get.dart';
import 'package:yumyum_amicta/models/cart_model/cart_model.dart';

import 'package:yumyum_amicta/models/product_model/product_model.dart';
import 'package:yumyum_amicta/shared/theme.dart';

import 'package:localstore/localstore.dart';

class CartController extends GetxController {
  final Map<String, CartModel> _items = {};
  final db = Localstore.instance;

  Map<String, CartModel> get items => _items;

  void printData() async {
    final newData = await db.collection('cart').get();
    if (newData == null) {
      Get.snackbar('Invalid', 'Cart EMPTY!',
          backgroundColor: purpleColor, colorText: whiteColor);
    } else {
      newData!.forEach((key, value) {
        print('key : ${key} | value : ${value}');
      });
    }
  }

  void addToCart(ProductModel product) async {
    bool is_found = false;
    String id_merchant_n_product =
        "${product.encryptedMerchantId}||${product.encryptedId}";
    // Cek 1/1
    final data = await db.collection('cart').get();
    if (data != null) {
      data!.forEach((key, value) {
        if (value['id_product'] == product.encryptedId) {
          db.collection('cart').doc(id_merchant_n_product).set({
            'id_product': product.encryptedId,
            'quantity': value['quantity'] + 1
          });
          is_found = !is_found;
        }
      });
    }

    if (!is_found)
      db
          .collection('cart')
          .doc(id_merchant_n_product)
          .set({'id_product': product.encryptedId, 'quantity': 1});

    printData();
  }

  void removeFromCart(ProductModel product) async {
    final db = Localstore.instance;
    bool is_found = false;
    String id_merchant_n_product =
        "${product.encryptedMerchantId}||${product.encryptedId}";

    // Cek 1/1
    final data = await db.collection('cart').get();
    data!.forEach((key, value) {
      if (value['id_product'] == product.encryptedId) {
        is_found = !is_found;
        if (value['quantity'] > 1) {
          db.collection('cart').doc(id_merchant_n_product).set({
            'id_product': product.encryptedId,
            'quantity': value['quantity'] - 1
          });
        } else if (value['quantity'] == 1) {
          db.collection('cart').doc(id_merchant_n_product).delete();
        } else {
          Get.snackbar('Invalid', 'Item must be greater than 0',
              backgroundColor: purpleColor, colorText: whiteColor);
        }
      }
    });

    printData();
  }

  void deleteAllCart() async {
    final newData = await db.collection('cart').get();

    if (newData == null || newData.isEmpty) {
      Get.snackbar('Information', 'Cart is empty!',
          backgroundColor: purpleColor, colorText: whiteColor);
    } else {
      db.collection('cart').delete();
    }

    print(newData);
  }

  void deleteAllCart() async {
    final newData = await db.collection('cart').get();

    if (newData == null || newData.isEmpty) {
      Get.snackbar('Information', 'Cart is empty!',
          backgroundColor: purpleColor, colorText: whiteColor);
    } else {
      db.collection('cart').delete();
    }

    print(newData);
  }

  void getDataReadyCart() async {
    final newData = await db.collection('cart').get();
    List<Map<String, dynamic>> data = [];

    if (newData == null || newData.isEmpty) {
      Get.snackbar('Information', 'Cart is empty!',
          backgroundColor: purpleColor, colorText: whiteColor);
    } else {
      newData.forEach((key, value) {
        data.add(value);
      });
    }

    print(data);
  }

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.encryptedId)) {
      _items.update(product.encryptedId!, (value) {
        totalQuantity = value.quantity! + quantity;
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
      if (totalQuantity <= 0) {
        _items.remove(product.encryptedId);
      }
    } else {
      if (quantity > 0) {
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
      } else {
        Get.snackbar('Item count', 'harus masukkan setidaknya 1 product ',
            backgroundColor: purpleColor, colorText: whiteColor);
      }
    }
    //print(_items);
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.encryptedId)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.encryptedId)) {
      _items.forEach((key, value) {
        if (key == product.encryptedId) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
}

import 'package:flutter/material.dart';

// l-202：カートModel作成
class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(this.id, this.title, this.quantity, this.price);
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

//商品の個数を取得
  int get itemCount {
    // return _items == null ? 1 : 1;
    if (_items == null) {
      return 0;
    } else {
      return items.length;
    }
  }

  // 合計金額
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  //商品追加（更新/追加）
  void addCart(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existedItem) => CartItem(existedItem.id, existedItem.title,
              existedItem.quantity + 1, existedItem.price));
    } else {
      _items.putIfAbsent(productId,
          () => CartItem(DateTime.now().toString(), title, 1, price));
      notifyListeners(); //l-204：これがないと、商品追加に関するイベントが伝播（通知）されない
    }
  }
}

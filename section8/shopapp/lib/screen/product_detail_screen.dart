import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;
  // const ProductDetailScreen(
  //     {super.key, required this.title, required this.price});

  static const routeName = 'product-detail';
  @override
  Widget build(BuildContext context) {
    // 商品一覧からのルーティング時にargumentsが設定した値を受け取る
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Container(),
    );
  }
}

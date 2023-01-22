import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/providers/products.dart';

// 商品の詳細画面
class ProductDetailScreen extends StatelessWidget {
  static const routeName = 'product-detail';
  // final String title;
  // final double price;
  // const ProductDetailScreen(
  //     {super.key, required this.title, required this.price});

  const ProductDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 商品一覧からのルーティング時にargumentsが設定した値を受け取る
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    // l-197：フィルタリング処理は、Provider側に任せる
    //listen:falseに設定することで、都度都度再構築しない
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Container(),
    );
  }
}

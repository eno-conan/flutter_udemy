import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopapp/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';

// 商品の詳細画面
// l-208：基本的な表示内容実装
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity, //広げられるだけ広げる
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true, //false：折り返ししない
              ),
            )
          ],
        ),
      ),
    );
  }
}

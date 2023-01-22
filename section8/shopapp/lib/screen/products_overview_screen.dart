import 'package:flutter/material.dart';
import 'package:shopapp/widgets/products_grid.dart';

// 商品の一覧画面
class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  //商品の表示
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
        ),
        body: ProductsGrid());
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/product_item.dart';

// l-194で作成したWidget
// 商品一覧を表示するwidget
class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Providerから情報取得
    final productData = Provider.of<Products>(context);
    //getterを介してデータ取得
    final products = productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: products.length,
      // 各商品の表示形式
      itemBuilder: ((context, index) => ChangeNotifierProvider(
          // l-198:Providerの設定を追加
          create: (cxt) => products[index],
          child: ProductItem(
              // id: products[index].id,
              // title: products[index].title,
              // imageUrl: products[index].imageUrl
              ))),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}

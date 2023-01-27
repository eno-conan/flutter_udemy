import 'package:flutter/material.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/product_item.dart';
import 'package:provider/provider.dart';

// l-194で作成したWidget
// 商品一覧を表示するwidget
class ProductsGrid extends StatelessWidget {
  final bool showFavorites;
  const ProductsGrid({super.key, required this.showFavorites});

  @override
  Widget build(BuildContext context) {
    // Providerから情報取得
    final productData = Provider.of<Products>(context);
    //getterを介してデータ取得
    // l-201：お気に入り一覧を返すか、全商品を返すか
    final products =
        showFavorites ? productData.favoriteItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: products.length,
      // 各商品の表示形式
      itemBuilder: ((context, index) => ChangeNotifierProvider.value(
          // l-198:Providerの設定を追加
          // l-199：ここではcreateは使用せず、ChangeNotifierProviderが適用された生成済インスタンスを生成
          // 画面全体を再構築するかどうかは、行う操作によって判断する（メモリの関係もある）
          // 実際、このnotifierProviderは不要と判断したら、自動でクリーンを行ってくれる
          value: products[index],
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

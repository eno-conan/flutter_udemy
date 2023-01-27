import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

// 商品の一覧画面
class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;
  //商品の表示
  @override
  Widget build(BuildContext context) {
    // // 201Productsクラスの情報管理
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          actions: <Widget>[
            // 縦3点のイラスト
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    // productsContainer.showFavoriteOnly();
                    _showFavoritesOnly = true;
                  } else {
                    // productsContainer.showAll();
                    _showFavoritesOnly = false;
                  }
                });
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                    value: FilterOptions.Favorites,
                    child: Text('Only Favorite')),
                const PopupMenuItem(
                    value: FilterOptions.All, child: Text('Show All')),
              ],
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        body: ProductsGrid(showFavorites: _showFavoritesOnly));
  }
}

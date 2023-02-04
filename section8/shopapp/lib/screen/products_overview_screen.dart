import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screen/cart_screen.dart';
import 'package:shopapp/widgets/badge.dart';
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
    //l-201Productsクラスの情報管理
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return SafeArea(
      child: Scaffold(
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
              ),
              // l-204：カートボタンをおしたときに　、カートの商品数の数字を更新する
              Consumer<Cart>(
                builder: (_, cart, ch) => BadgeWidget(
                  value: cart.itemCount.toString(),
                  child: ch as Widget,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                  // カートアイコンクリックで、カート表示
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
              ),
            ],
          ),
          body: ProductsGrid(showFavorites: _showFavoritesOnly)),
    );
  }
}

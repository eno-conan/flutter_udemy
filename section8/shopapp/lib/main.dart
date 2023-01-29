import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screen/cart_screen.dart';
import 'package:shopapp/screen/product_detail_screen.dart';
import 'package:shopapp/screen/products_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // l-194:Providerの定義
    // l-203：MultiProvider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            // ここではprovider.valueはしようせず、createで全体の再構築を実施する
            create: (ctx) => Products()),
        ChangeNotifierProvider(
            // ここではprovider.valueはしようせず、createで全体の再構築を実施する
            create: (ctx) => Cart()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen()
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screen/product_detail_screen.dart';

// ある商品の情報を表示するWidget
class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    // print('ABC');
    // お気に入り、商品名、カートの順に表示
    return ClipRRect(
      // 角に丸みを持たせるために、ClipRRectを使用:l-190
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              icon: Icon(
                  //l-198：ハートのアイコンの状態を切り替え
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Color.fromARGB(250, 200, 113, 37),
              onPressed: () {
                product.toggleFavoriteStatus();
                // print('KKKK');
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          // l-191:追加、タップしたときの挙動（PCでいうクリックに値）
          onTap: () {
            Navigator.of(context).pushNamed(
              // product_detailへidを渡す
              ProductDetailScreen.routeName, arguments: product.id,
              // 以下のように、コンストラクタの引数に値を渡す形を取らない
              // 柔軟な構成を実現できなくなるから。
              // MaterialPageRoute(
              //   builder: (ctx) => ProductDetailScreen(
              //         title: title,
              //       ))
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

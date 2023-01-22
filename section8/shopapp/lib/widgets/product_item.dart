import 'package:flutter/material.dart';
import 'package:shopapp/screen/product_detail_screen.dart';

// 各商品の表示形式
class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // お気に入り、商品名、カートの順に表示
    return ClipRRect(
      // 角に丸みを持たせるために、ClipRRectを使用:l-190
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            title,
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
              ProductDetailScreen.routeName, arguments: id,
              // 以下のように、コンストラクタの引数に値を渡す形を取らない
              // 柔軟な構成を実現できなくなるから。
              // MaterialPageRoute(
              //   builder: (ctx) => ProductDetailScreen(
              //         title: title,
              //       ))
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

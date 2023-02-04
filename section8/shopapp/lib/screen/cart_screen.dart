import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context); //, listen: false
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                const Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount.toString()}',
                    style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium!
                            .color),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                  onPressed: () {
                    // 注文処理(l-210)
                    Provider.of<Orders>(context, listen: false)
                        .addOrder(cart.items.values.toList(), cart.totalAmount);
                    // カートをリセット(l-210)
                    cart.clear();
                  },
                  child: Text(
                    'Order Now',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (ctx, i) => ci.CartItem(
              // Mapの値を取得するので、values.toList()
              id: cart.items.values.toList()[i].id,
              productId: cart.items.keys.toList()[i],
              title: cart.items.values.toList()[i].title,
              quantity: cart.items.values.toList()[i].quantity,
              price: cart.items.values.toList()[i].price),
          itemCount: cart.items.length,
        )),
      ]),
    );
  }
}

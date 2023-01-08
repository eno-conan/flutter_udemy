import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/mean_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem; //l-179:メニュー削除で使用

  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.removeItem});

  // Complexityの表示内容制御
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      // break;
      case Complexity.Challenging:
        return 'Challenging';
      // break;
      case Complexity.Hard:
        return 'Hard';
      // break;
      default:
        return 'Unknown';
    }
  }

  // Affordabilityの表示内容制御
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      // break;
      case Affordability.Pricey:
        return 'Pricey';
      // break;
      case Affordability.Luxurious:
        return 'Luxurious';
      // break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MeanDetailScreen.routeName, arguments: id)
        // ignore: avoid_print
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // 画像の形を調整
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,
                      height: 300, width: double.infinity, fit: BoxFit.cover),
                ),
                // 表示位置調整
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  //間隔調整
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.schedule),
                        const SizedBox(width: 6),
                        Text('$duration min'), //文字列の中で変数を用いる方法
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.work),
                        const SizedBox(width: 6),
                        Text(complexityText), // 関数で表示する文字列を制御
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.attach_money),
                        const SizedBox(width: 6),
                        Text(affordabilityText), // 関数で表示する文字列を制御
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

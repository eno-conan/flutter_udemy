import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

  void selectCategory(BuildContext ctx) {
    // routing時に引数設定してカテゴリごとの料理一覧へ遷移
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          // related ThemeData(...titleMedium:XXX) at 'main.dart'
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

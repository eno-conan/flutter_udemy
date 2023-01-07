import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import '../widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('DeliMeal')),
        body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              // viewItemの高さを設定
              childAspectRatio: 1.5,
              // Widget間のスペース（左右）
              crossAxisSpacing: 20,
              // Widget間のスペース（上下）
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                  id: catData.id, title: catData.title, color: catData.color))
              .toList(),
        ));
  }
}

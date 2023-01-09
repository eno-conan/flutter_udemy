// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shopapp/main.dart';
import 'package:shopapp/models/product.dart';

void main() {
  test('product models test', () {
    final dummyProduct = Product(
      id: '12345',
      title: 'title',
      description: 'description',
      price: 12345,
      imageUrl: 'imageUrl',
      // isFavorite: true
    );
    expect(dummyProduct.id, '12345');
    expect(dummyProduct.title, 'title');
    expect(dummyProduct.description, 'description');
  });
}

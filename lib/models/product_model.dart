import 'dart:math';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id = DateTime.now().millisecondsSinceEpoch + Random().nextInt(1000);
  final String name;
  final String? category;
  final String details;
  final double price;
  final String image;
  final double totalReviews;
  final DateTime createdAt = DateTime.now();

  ProductModel({
    required this.name,
    this.category,
    required this.details,
    required this.price,
    required this.image,
    required this.totalReviews,
  }) {
    print('ProductModel $id');
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        details,
        price,
        image,
        totalReviews,
        createdAt,
      ];
}

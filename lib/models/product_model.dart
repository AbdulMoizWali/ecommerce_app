import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final String? category;
  final String details;
  final double price;
  final Widget image;
  final double totalReviews;

  ProductModel({
    required this.name,
    this.category,
    required this.details,
    required this.price,
    required this.image,
    required this.totalReviews,
  });
}

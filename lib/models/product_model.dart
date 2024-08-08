import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String category;
  final int viewCount;
  final String details;
  final double price;
  final String image;
  final double rating;
  final double totalReviews;
  final bool isFavorite;
  final DateTime createdAt = DateTime.now();

  ProductModel({
    required this.id,
    required this.name,
    this.category = '',
    required this.viewCount,
    this.isFavorite = false,
    required this.details,
    required this.price,
    required this.image,
    required this.rating,
    required this.totalReviews,
  }) {
    // print('ProductModel $id');
  }

  ProductModel copyWith({
    int? id,
    String? name,
    String? category,
    int? viewCount,
    String? details,
    double? price,
    String? image,
    double? rating,
    double? totalReviews,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      viewCount: viewCount ?? this.viewCount,
      details: details ?? this.details,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      totalReviews: totalReviews ?? this.totalReviews,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        viewCount,
        details,
        price,
        image,
        rating,
        totalReviews,
        isFavorite,
        createdAt,
      ];
}

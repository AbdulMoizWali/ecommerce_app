import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String? image;
  const CategoryModel({
    required this.id,
    required this.name,
    this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}

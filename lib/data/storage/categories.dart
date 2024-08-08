import 'package:ecommerce_app/constants/icon_constants.dart';
import 'package:ecommerce_app/models/category_model.dart';

/*
List<CategoryModel> categories = [
    CategoryModel(name: 'All'),
    CategoryModel(name: 'Electronic'),
    CategoryModel(name: 'Fashion'),
    CategoryModel(name: 'Shoes'),
    CategoryModel(name: 'Furniture'),
  ];
*/

List<Map<String, Object>> categories = [
  {'name': 'All'},
  {'name': 'Electronic'},
  {'name': 'Fashion'},
  {'name': 'Shoes'},
  {'name': 'Furniture'},
  {'name': 'Bag', 'image': IconConstants.bag},
  {'name': 'Watch', 'image': IconConstants.watch},
  {'name': 'Shoes', 'image': IconConstants.shoes},
  {'name': 'Jewelry', 'image': IconConstants.jewelry},
  {'name': 'Sports', 'image': IconConstants.sports},
  {'name': 'Music', 'image': IconConstants.music},
  {'name': 'Gift', 'image': IconConstants.gift},
  {'name': 'Plant', 'image': IconConstants.plant},
  {'name': 'Phone', 'image': IconConstants.phone},
  {'name': 'Furniture', 'image': IconConstants.furniture},
  {'name': 'Cosmetics', 'image': IconConstants.cosmetic},
  {'name': 'Hobby', 'image': IconConstants.hobby},
];

// ignore: non_constant_identifier_names
List<CategoryModel> CATEGORIES = categories.asMap().entries.map((entry) {
  final index = entry.key;
  final category = entry.value;
  return CategoryModel(
    id: DateTime(2024, 8, index + 1).millisecondsSinceEpoch,
    name: category['name'] as String,
    image: category['image'] as String?,
  );
}).toList();

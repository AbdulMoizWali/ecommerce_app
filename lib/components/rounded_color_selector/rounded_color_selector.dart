import 'package:ecommerce_app/components/rounded_color_selector/rounded_color_item.dart';
import 'package:flutter/material.dart';

typedef ColorChangeCallback = void Function(Color color);

class RoundedColorSelector extends StatelessWidget {
  const RoundedColorSelector({
    super.key,
    required this.availableColors,
    required this.onColorChange,
    required this.selectedColor,
  });

  final Color selectedColor;
  final Set<Color> availableColors;
  final ColorChangeCallback onColorChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var color in availableColors)
          RoundedColorItem(
            color: color,
            isSelected: selectedColor == color,
            onColorSelect: (color) => onColorChange(color),
          ),
      ],
    );
  }
}

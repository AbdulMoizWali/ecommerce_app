import 'package:flutter/material.dart';

typedef ColorSelectCallback = void Function(Color color);

class RoundedColorItem extends StatelessWidget {
  const RoundedColorItem({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onColorSelect,
  });

  final Color color;
  final ColorSelectCallback onColorSelect;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
          width: 2,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          onColorSelect(color);
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: color,
          ),
        ),
      ),
    );
  }
}

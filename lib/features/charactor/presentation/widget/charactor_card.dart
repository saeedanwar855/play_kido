import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_pop_widget.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/charactor/data/model/charactor_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    required this.onTap,
    required this.index,
    super.key,
  });
  final CharacterModel character;
  final VoidCallback onTap;
  final int index;
  static const List<Color> cardColors = [
    AppColors.lightText,
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.teal,
    AppColors.lightText,
  ];

  Color get cardColor {
    // Get color based on index
    return cardColors[index % cardColors.length];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          shape: BoxShape.circle,
        ),
        child: AnimatedTapIcon(
          onTap: onTap,
          child: Image.asset(
            character.imagePath,
            height: 100,
          ),
        ),
      ),
    );
  }
}

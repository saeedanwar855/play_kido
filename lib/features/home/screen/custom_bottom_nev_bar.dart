import 'package:flutter/material.dart';
import 'package:play_kido/core/theme/app_colors.dart';

// lib/features/home/screen/custom_bottom_nev_bar.dart
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.candyPink,
            AppColors.secondaryOrange,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('Home', 'assets/icon/home.png', 0),
          _buildNavItem('Characters', 'assets/icon/characters.png', 1),
          // _buildNavItem('Score', 'assets/icon/score.png', 2),
          _buildNavItem('Tracking', 'assets/icon/tracking.png', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String iconUrl, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconUrl,
              height: 50,
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontFamily: 'ComicSans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

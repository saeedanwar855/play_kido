import 'package:flutter/material.dart';
import 'package:play_kido/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.color = AppColors.primaryOrange,
    this.textColor = Colors.white,
    this.height = 55,
  });
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryOrange,
            AppColors.blueberry,
            AppColors.candyPink,
            AppColors.primaryOrange,
          ],
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: textColor),
      ),
    );
  }
}

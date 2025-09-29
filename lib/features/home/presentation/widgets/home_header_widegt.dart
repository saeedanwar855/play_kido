import 'package:flutter/material.dart';
import 'package:play_kido/core/theme/app_colors.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.oceanBlue,
            AppColors.complementaryBlue,
          ],
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(
              'assets/icon/bag_icon.png',
              height: 40,
            ),
            const SizedBox(width: 15),
            const Text(
              'Choose the subject',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/2232/2232688.png',
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

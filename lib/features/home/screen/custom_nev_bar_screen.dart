// lib/main_layout.dart
import 'package:flutter/material.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/charactor/presentation/screen/charactors_screen.dart';
import 'package:play_kido/features/home/screen/custom_bottom_nev_bar.dart';
import 'package:play_kido/features/home/screen/home_screen.dart';

class CustomNevBarScreen extends StatefulWidget {
  const CustomNevBarScreen({super.key});

  @override
  State<CustomNevBarScreen> createState() => _CustomNevBarScreenState();
}

class _CustomNevBarScreenState extends State<CustomNevBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const CharactorsScreen(),
    Container(
      color: AppColors.blueberry,
    ),
    Container(
      color: AppColors.blueberry,
    ),
  ];

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: onPageChanged,
      ),
    );
  }
}

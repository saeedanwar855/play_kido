import 'package:flutter/material.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/home/widgets/home_header_widegt.dart';
import 'package:play_kido/features/home/widgets/home_subject_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/icon/backg.jpeg',
            ),
          ),
        ),
        child: Stack(
          children: [
            const Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: SubjectsGrid(),
                ),
                CustomHeader(),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/icon/grass.png',
                width: SizeConfig.getWidth(100),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 40,
              child: Image.asset(
                'assets/character/captain_majid.png',
                height: SizeConfig.getHeight(30),
                width: SizeConfig.getWidth(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

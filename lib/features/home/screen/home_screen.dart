import 'package:flutter/material.dart';
import 'package:play_kido/features/home/widgets/home_header_widegt.dart';
import 'package:play_kido/features/home/widgets/home_subject_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: SubjectsGrid(),
              ),
              const CustomHeader(),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/icon/grass.png',
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Image.asset(
              'assets/character/captain_majid.png',
              height: 280,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}

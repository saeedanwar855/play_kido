import 'package:flutter/material.dart';
import 'package:play_kido/features/home/widgets/home_header_widegt.dart';
import 'package:play_kido/features/home/widgets/home_subject_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(),
          const SubjectsGrid(),
          Image.asset('assets/icon/grass.png'),
        ],
      ),
    );
  }
}

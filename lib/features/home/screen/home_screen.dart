import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/charactor/presentation/screen/charactors_screen.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_cubit.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_state.dart';
import 'package:play_kido/features/home/widgets/home_subject_grid.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            final selectedCharacter = state is CharacterLoaded ? state.selectedCharacter : null;
            return Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/icon/bg.jpeg',
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: SubjectsGrid(),
                      ),
                      KidsAppHeader(
                        title: ' Home',
                        onBackPress: () => Navigator.pop(context),
                      ),
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
                      selectedCharacter?.imagePath ?? 'assets/character/captain_majid.png',
                      height: SizeConfig.getHeight(30),
                      width: SizeConfig.getWidth(30),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

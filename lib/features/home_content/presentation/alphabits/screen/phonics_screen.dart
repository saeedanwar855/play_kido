import 'package:flutter/material.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/screen/alphabits_screen.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class PhonicsScreen extends StatefulWidget {
  const PhonicsScreen({super.key});

  @override
  State<PhonicsScreen> createState() => _PhonicsScreenState();
}

class _PhonicsScreenState extends State<PhonicsScreen> {
  final List<String> alphabet = [
    'A for Apple',
    'A for Alligator',
    'B for Bug',
    'B for Ball',
    'C for Cat',
    'C for Cake',
    'D for Dog',
    'D for Dock',
    'D for Duck',
    'E for Egg',
    'E for Elf',
    'F for Fork',
    'F for Food',
    'G for Girl',
    'G for Guitar',
    'H for Hat',
    'H for Hamster',
    'I for Insect',
    'I for Iguana',
    'J for Joker',
    'K for Lion',
    'L for Log',
    'M for Man',
    'M for Monkey',
    'N for Nest',
    'O for Octopus',
    'P for Pea',
    'P for Pig',
    'P for Pool',
    'Q for Quilt',
    'Q for Queen',
    'R for Rocket',
    'R for Raccoon',
    'S for Sailor',
    'S for Sun',
    'T for Tiger',
    'T for Tent',
    'U for Umbrella',
    'V for Fan',
    'V for Vegetables',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/bgg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              KidsAppHeader(
                title: ' Alphabets',
                onBackPress: () => Navigator.pop(context),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/plain_alphabet/a.png',
                    height: SizeConfig.getHeight(8),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/plain_alphabet/a.png',
                        height: SizeConfig.getHeight(8),
                      ),
                      Text(
                        'For',
                        style: TextStyle(
                          color: AppColors.newYellow,
                          fontSize: SizeConfig.getHeight(6),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ComicSans',
                        ),
                      ),
                      Text(
                        'Apple',
                        style: TextStyle(
                          color: AppColors.newYellow,
                          fontSize: SizeConfig.getHeight(6),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ComicSans',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InteractiveButton(
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<PhonicsScreen>(
                        builder: (context) => const PhonicsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

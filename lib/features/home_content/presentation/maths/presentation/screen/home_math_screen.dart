import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/interactive_common_button.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class HomeMathScreen extends StatefulWidget {
  const HomeMathScreen({super.key});

  @override
  State<HomeMathScreen> createState() => _HomeMathScreenState();
}

class _HomeMathScreenState extends State<HomeMathScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/icon/_.jpeg',
              ),
            ),
          ),
          child: Column(
            children: [
              KidsAppHeader(
                isBack: true,
                title: ' Maths',
                onBackPress: () => Navigator.pop(context),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ComicSans',
                            color: AppColors.darkText,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                              color: AppColors.darkText,
                            ),
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ComicSans',
                            color: AppColors.darkText,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '=',
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                              color: AppColors.darkText,
                            ),
                          ),
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ComicSans',
                            color: AppColors.darkText,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/icon/apple.jpg',
                                height: 60,
                                width: 60,
                              ),
                              const Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ComicSans',
                                  color: AppColors.darkText,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/apple.jpg',
                                    height: 60,
                                    width: 60,
                                  ),
                                  Image.asset(
                                    'assets/icon/apple.jpg',
                                    height: 60,
                                    width: 60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Text(
                            '=',
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                              color: AppColors.darkText,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/apple.jpg',
                                    height: 60,
                                    width: 60,
                                  ),
                                  Image.asset(
                                    'assets/icon/apple.jpg',
                                    height: 60,
                                    width: 60,
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/icon/apple.jpg',
                                height: 60,
                                width: 60,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GameVolumeButton(
                      onTap: () {},
                    ),
                    InteractiveButton(
                      buttonText: 'Next',
                      ontap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

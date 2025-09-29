import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_pop_widget.dart';
import 'package:play_kido/core/common_widget/interactive_common_button.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/home_content/data/numbers_model/number_model.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _popController;
  late Animation<double> popAnimation;
  AudioPlayer _audioPlayer = AudioPlayer();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _pageController = PageController();
    _popController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    popAnimation = CurvedAnimation(
      parent: _popController,
      curve: Curves.elasticInOut,
    ).drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _popController.forward();
    });
  }

  Future<void> _playSound(String audioPath) async {
    try {
      await _audioPlayer.stop();
      final player = AudioPlayer();
      await player.setSource(AssetSource(audioPath.replaceAll('assets/', '')));
      await player.resume();

      player.onPlayerComplete.listen((event) {
        player.dispose();
      });
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  @override
  void dispose() {
    _popController.dispose();
    _audioPlayer.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/backg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              KidsAppHeader(
                isBack: true,
                title: 'Numbers',
                onBackPress: () => Navigator.pop(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  height: SizeConfig.getHeight(60),
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                      _popController.forward(from: 0);
                    },
                    itemCount: numbersModel.length,
                    itemBuilder: (context, index) {
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                AnimatedTapIcon(
                                  onTap: () {
                                    _playSound(numberSounds[index]);
                                  },
                                  child: Image.asset(
                                    numbersModel[index],
                                    height: SizeConfig.getHeight(15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    numbersSpelling[index],
                                    style: TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: SizeConfig.getHeight(4),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'ComicSans',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: SizeConfig.getHeight(6)),
                            child: _buildAppleGrid(index),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GameVolumeButton(
                      onTap: () {
                        _playSound(numberSounds[currentIndex]);
                      },
                    ),
                    InteractiveButton(
                      buttonText: currentIndex == numbersModel.length - 1 ? 'Finish' : 'Next',
                      ontap: () {
                        if (currentIndex < numbersModel.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Handle finish logic
                          Navigator.pop(context);
                        }
                      },
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

  Widget _buildAppleGrid(int count) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 15,
      children: List.generate(
        count + 1, // Add 1 because numbers start from 0
        (index) => Container(
          height: SizeConfig.getHeight(8),
          width: SizeConfig.getWidth(25),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/icon/apple.jpg')),
          ),
        ),
      ),
    );
  }
}

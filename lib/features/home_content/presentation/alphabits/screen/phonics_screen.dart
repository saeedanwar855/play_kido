import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/interactive_common_button.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/home_content/data/alphabits_model/phonics_model.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class PhonicsScreen extends StatefulWidget {
  const PhonicsScreen({super.key});

  @override
  State<PhonicsScreen> createState() => _PhonicsScreenState();
}

class _PhonicsScreenState extends State<PhonicsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _popController;
  late Animation<double> _popAnimation;
  final PageController _pageController = PageController();
  final CarouselSliderController _carouselController = CarouselSliderController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  late List<PhonicsModel> model;

  bool isPlaying = false;

  int currentAbbrivativeIndex = 0;

  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();

    model = phonicsData.map(PhonicsModel.fromJson).toList();

    _popController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _popAnimation = CurvedAnimation(
      parent: _popController,
      curve: Curves.elasticInOut,
    ).drive(Tween<double>(begin: 0, end: 1));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _popController.forward();
    });
  }

  Future<void> _playLetterSequence(PhonicsModel letter) async {
    if (isPlaying) return;

    try {
      setState(() {
        isPlaying = true;
        currentAbbrivativeIndex = 0;
      });

      // Play the main sound
      final soundPath = letter.sound.replaceAll('assets/', '');
      await _audioPlayer.play(AssetSource(soundPath));

      _animationTimer?.cancel();
      var currentSecond = 0;

      _animationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        currentSecond++;

        // Find which abbreviation should be shown at the current time
        for (var i = 0; i < letter.abbreviation.length; i++) {
          final abbr = letter.abbreviation[i];
          if (currentSecond >= abbr.startTime && currentSecond <= abbr.endTime) {
            if (currentAbbrivativeIndex != i) {
              setState(() {
                currentAbbrivativeIndex = i;
              });
              // Animate carousel to the current item
              _carouselController.animateToPage(
                i,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
            break;
          }
        }

        // Stop when we reach the end of the last abbreviation
        if (currentSecond > letter.abbreviation.last.endTime) {
          timer.cancel();
          setState(() {
            isPlaying = false;
          });
        }
      });
    } catch (e) {
      log('Error playing audio: $e');
      setState(() {
        isPlaying = false;
      });
    }
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
                title: ' Alphabets',
                onBackPress: () => Navigator.pop(context),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: SizeConfig.getHeight(65),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: model.length,
                      itemBuilder: (context, index) {
                        final letter = model[index];
                        final currentAbbrivative = letter.abbreviation[currentAbbrivativeIndex];
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ScaleTransition(
                                    scale: _popAnimation,
                                    child: Image.asset(
                                      letter.letterImage,
                                      height: SizeConfig.getHeight(10),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'For',
                                        style: TextStyle(
                                          color: AppColors.candyPink,
                                          fontSize: SizeConfig.getHeight(4),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ComicSans',
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Text(
                                        currentAbbrivative.name,
                                        style: TextStyle(
                                          color: AppColors.darkText,
                                          fontSize: SizeConfig.getHeight(4),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ComicSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.getHeight(40),
                              child: CarouselSlider(
                                carouselController: _carouselController,
                                items: letter.abbreviation.asMap().entries.map((entry) {
                                  final abbr = entry.value;
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Image.asset(
                                      abbr.picture,
                                      fit: BoxFit.fitHeight,
                                      width: MediaQuery.of(context).size.width,
                                      height: SizeConfig.getHeight(
                                        50,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  height: SizeConfig.getHeight(60),
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  initialPage: currentAbbrivativeIndex,
                                  onPageChanged: (index, reason) {
                                    if (!isPlaying) {
                                      setState(() {
                                        currentAbbrivativeIndex = index;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GameVolumeButton(
                      onTap: () {
                        if (!isPlaying) {
                          _playLetterSequence(model[currentAbbrivativeIndex]);
                        }
                      },
                    ),
                    InteractiveButton(
                      buttonText: 'Next',
                      ontap: () {
                        _pageController.animateToPage(
                          currentAbbrivativeIndex + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
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

  @override
  void dispose() {
    _popController.dispose();
    _audioPlayer.dispose();
    _animationTimer?.cancel();
    _carouselController.stopAutoPlay();
    super.dispose();
  }
}
// Future<void> _playLetterSequence(PhonicsModel letter, int pageIndex) async {
//   if (isPlaying) return;

//   try {
//     setState(() {
//       isPlaying = true;
//       currentAbbrivativeIndex = 0;
//     });

//     final soundPath = letter.sound.replaceAll('assets/', '');
//     await _audioPlayer.play(AssetSource(soundPath));

//     // Listen for audio completion
//     _audioPlayer.onPlayerComplete.listen((_) {
//       setState(() {
//         isPlaying = false;
//       });
      
//       // Move to next letter if not at the end
//       if (pageIndex < model.length - 1) {
//         _pageController.animateToPage(
//           pageIndex + 1,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       }
//     });

//     _animationTimer?.cancel();
//     var currentSecond = 0;

//     _animationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       currentSecond++;

//       for (var i = 0; i < letter.abbreviation.length; i++) {
//         final abbr = letter.abbreviation[i];
//         if (currentSecond >= abbr.startTime && currentSecond <= abbr.endTime) {
//           if (currentAbbrivativeIndex != i) {
//             setState(() {
//               currentAbbrivativeIndex = i;
//             });
//             _carouselController.animateToPage(
//               i,
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//             );
//           }
//           break;
//         }
//       }

//       if (currentSecond > letter.abbreviation.last.endTime) {
//         timer.cancel();
//       }
//     });
//   } catch (e) {
//     log('Error playing audio: $e');
//     setState(() {
//       isPlaying = false;
//     });
//   }
// }


// PageView.builder(
//   controller: _pageController,
//   itemCount: model.length,
//   onPageChanged: (index) {
//     setState(() {
//       currentAbbrivativeIndex = 0; // Reset abbreviation index on page change
//     });
//   },
//   itemBuilder: (context, index) {
//     final letter = model[index];
//     final currentAbbrivative = letter.abbreviation[currentAbbrivativeIndex];
//     return Column(
//       // ... rest of your existing column code ...
//     );
//   },
// ),


// GameVolumeButton(
//   onTap: () {
//     if (!isPlaying) {
//       final currentPage = _pageController.page?.round() ?? 0;
//       _playLetterSequence(model[currentPage], currentPage);
//     }
//   },
// ),\


// void playSpecificLetter(int index) {
//   if (index >= 0 && index < model.length) {
//     _pageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
    
//     // Wait for page animation to complete before playing
//     Future.delayed(const Duration(milliseconds: 600), () {
//       if (!isPlaying) {
//         _playLetterSequence(model[index], index);
//       }
//     });
//   }
// }


// @override

// void dispose() {
//   _popController.dispose();
//   _audioPlayer.dispose();
//   _animationTimer?.cancel();
//   _carouselController.stopAutoPlay();
//   _pageController.dispose();
//   super.dispose();
// }
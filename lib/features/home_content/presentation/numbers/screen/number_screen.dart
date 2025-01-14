// import 'package:flutter/material.dart';
// import 'package:play_kido/core/common_widget/interactive_common_button.dart';
// import 'package:play_kido/core/size_config/size_config.dart';
// import 'package:play_kido/core/theme/app_colors.dart';
// import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
// import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

// class NumberScreen extends StatefulWidget {
//   const NumberScreen({super.key});

//   @override
//   State<NumberScreen> createState() => _NumberScreenState();
// }

// class _NumberScreenState extends State<NumberScreen> with TickerProviderStateMixin {
//   late AnimationController _popController;
//   late Animation<double> _popAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _popController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );

//     _popAnimation = CurvedAnimation(
//       parent: _popController,
//       curve: Curves.elasticInOut,
//     ).drive(
//       Tween<double>(
//         begin: 0,
//         end: 1,
//       ),
//     );

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _popController.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _popController.dispose();
//     super.dispose();
//   }

//   //
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/icon/backg.jpeg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             children: [
//               KidsAppHeader(
//                 isBack: true,
//                 title: ' Alphabets',
//                 onBackPress: () => Navigator.pop(context),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.symmetric(vertical: 20),
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ScaleTransition(
//                           scale: _popAnimation,
//                           child: Image.asset(
//                             'assets/plain_alphabet/1-400.png',
//                             height: SizeConfig.getHeight(15),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '',
//                                 style: TextStyle(
//                                   color: AppColors.candyPink,
//                                   fontSize: SizeConfig.getHeight(4),
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'ComicSans',
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 'One',
//                                 style: TextStyle(
//                                   color: AppColors.darkText,
//                                   fontSize: SizeConfig.getHeight(4),
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'ComicSans',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: SizeConfig.getHeight(10),
//                   ),
//                   Container(
//                     width: MediaQuery.sizeOf(context).width,
//                     height: SizeConfig.getHeight(10),
//                     decoration: const BoxDecoration(
//                         // color: Colors.white,
//                         ),
//                     child: Image.asset(
//                       'assets/icon/apple.jpg',
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GameVolumeButton(
//                       onTap: () {},
//                     ),
//                     InteractiveButton(
//                       buttonText: 'Next',
//                       ontap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute<PhonicsScreen>(
//                         //     builder: (context) => const PhonicsScreen(),
//                         //   ),
//                         // );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
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
  late Animation<double> _popAnimation;
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

    _popAnimation = CurvedAnimation(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: SizeConfig.getHeight(10),
                            child: Image.asset(
                              'assets/icon/apple.jpg', // Example placeholder
                            ),
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
}

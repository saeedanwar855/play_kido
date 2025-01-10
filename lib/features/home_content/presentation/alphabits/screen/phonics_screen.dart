import 'package:flutter/material.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/screen/alphabits_screen.dart';
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

  @override
  void initState() {
    super.initState();

    _popController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Simpler animation setup to avoid the assertion error
    _popAnimation = CurvedAnimation(
      parent: _popController,
      curve: Curves.elasticInOut,
    ).drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    );

    // Start the animation when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _popController.forward();
    });
  }

  @override
  void dispose() {
    _popController.dispose();
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
                title: ' Alphabets',
                onBackPress: () => Navigator.pop(context),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(10),
                    //   border: Border.all(
                    //     color: Colors.purple,
                    //     width: 5,
                    //   ),
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image.asset(
                        //   'assets/plain_alphabet/a.png',
                        //   height: SizeConfig.getHeight(15),
                        // ),
                        ScaleTransition(
                          scale: _popAnimation,
                          child: Image.asset(
                            'assets/plain_alphabet/a.png',
                            height: SizeConfig.getHeight(15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
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
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'alligator',
                                style: TextStyle(
                                  color: AppColors.darkText,
                                  fontSize: SizeConfig.getHeight(4),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ComicSans',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: SizeConfig.getHeight(40),
                    decoration: const BoxDecoration(
                        // color: Colors.white,
                        ),
                    child: Image.asset(
                      'assets/phonics_things/a_aligator.png',
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
                      onTap: () {},
                    ),
                    InteractiveButton(
                      buttonText: 'Next',
                      ontap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute<PhonicsScreen>(
                        //     builder: (context) => const PhonicsScreen(),
                        //   ),
                        // );
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

import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/interactive_common_button.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> with TickerProviderStateMixin {
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

  //
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ScaleTransition(
                          scale: _popAnimation,
                          child: Image.asset(
                            'assets/plain_alphabet/1-400.png',
                            height: SizeConfig.getHeight(15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '',
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
                                'One',
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
                  SizedBox(
                    height: SizeConfig.getHeight(10),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: SizeConfig.getHeight(10),
                    decoration: const BoxDecoration(
                        // color: Colors.white,
                        ),
                    child: Image.asset(
                      'assets/icon/apple.jpg',
                    ),
                  ),
                ],
              ),
              const Spacer(),
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

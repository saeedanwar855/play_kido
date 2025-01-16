import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_gaming_button.dart';
import 'package:play_kido/core/size_config/size_config.dart';

void showCompletionDialog(
  BuildContext context, {
  required String lessonNumber,
  required String userName,
  required int reward,
}) {
  showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: SizeConfig.getHeight(40),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFfff5d1), // Light cream background
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffffc977),
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Good job, $userName!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'ComicSans',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Reward',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFFA666),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/candy.png', // Replace with your candy/reward icon
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '$reward',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFA666),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AnimatedGamingButton(
                    width: SizeConfig.getWidth(70),
                    height: SizeConfig.getHeight(7),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: SizeConfig.getHeight(-18),
              left: 0,
              right: 0,
              child: const StarWidgetComplete(),
            ),
          ],
        ),
      ),
    ),
  );
}

class StarWidgetComplete extends StatelessWidget {
  const StarWidgetComplete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: 240,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/top_complete.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  'lesson 2',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ComicSans',
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Complete',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'ComicSans',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/star_3.png',
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Image.asset(
                  'assets/icon/star_1.png',
                  width: 70,
                ),
              ),
              Image.asset(
                'assets/icon/star_2.png',
                width: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

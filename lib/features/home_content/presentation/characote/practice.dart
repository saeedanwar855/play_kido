import 'package:flutter/material.dart';
import 'package:play_kido/core/size_config/size_config.dart';

class CompletionDialog extends StatelessWidget {
  const CompletionDialog({
    required this.lessonNumber,
    required this.userName,
    required this.rewardPoints,
    required this.onContinue,
    super.key,
    this.showConfetti = true,
  });
  final String lessonNumber;
  final String userName;
  final int rewardPoints;
  final VoidCallback onContinue;
  final bool showConfetti;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 24,
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCompleteBanner(lessonNumber),
                const SizedBox(height: 24),
                Text(
                  'Good job, $userName!',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                    fontFamily: 'ComicSans',
                  ),
                ),
                const SizedBox(height: 24),
                _buildRewardSection(rewardPoints),
                const SizedBox(height: 32),
                // const GamingButton(),
                // const oneGamingButton(),
              ],
            ),
          ),
          // if (showConfetti)
          //   Positioned(
          //     top: -50,
          //     child: Lottie.asset(
          //       'assets/animations/confetti.json',
          //       width: 300,
          //       height: 300,
          //       repeat: true,
          //     ),
          //   ),
        ],
      ),
    );
  }

  Widget _buildCompleteBanner(String lessonNumber) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFF9046),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                'Lesson $lessonNumber',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'ComicSans',
                  fontSize: 16,
                ),
              ),
              const Text(
                'COMPLETE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ComicSans',
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStar(0.8),
              const SizedBox(width: 4),
              _buildStar(1),
              const SizedBox(width: 4),
              _buildStar(0.8),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStar(double scale) {
    return Transform.scale(
      scale: scale,
      child: Image.asset(
        'assets/icon/star.png',
        width: SizeConfig.getWidth(15),
        height: SizeConfig.getHeight(15),
      ),
    );
  }

  Widget _buildRewardSection(int points) {
    return Column(
      children: [
        const Text(
          'Reward',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFFF9046),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.stars, color: Colors.yellow[700], size: 24),
            // Image.asset(
            //   'assets/images/candy.png',
            //   width: 24,
            //   height: 24,
            // ),
            const SizedBox(width: 8),
            Text(
              '$points',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF9046),
                fontFamily: 'ComicSans',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.width = 200,
    this.height = 56,
  });
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD54F),
          borderRadius: BorderRadius.circular(height / 2),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFD54F).withOpacity(0.3),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class GamingButton extends StatelessWidget {
  const GamingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Add your button action here
        },
        child: Container(
          width: 250, // Width of the button
          height: 70, // Height of the button
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFD700), // Top golden-yellow
                Color(0xFFF9A602), // Bottom golden-orange
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(4, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Inner highlight for the glossy effect
              Positioned(
                top: 5,
                left: 6,
                right: 6,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFD700).withOpacity(0.4),
                        offset: const Offset(4, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 10,
                left: 15,
                right: 15,
                child: Container(
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFD700).withOpacity(0.04),
                        offset: const Offset(4, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFD700).withOpacity(0.7),
                        offset: const Offset(4, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
              // Button text
              Center(
                child: Text(
                  'YAY, OK!',
                  style: TextStyle(
                    fontFamily: 'ComicSans', // A bold, playful gaming font
                    fontSize: 26,
                    fontWeight: FontWeight.bold,

                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 2),
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

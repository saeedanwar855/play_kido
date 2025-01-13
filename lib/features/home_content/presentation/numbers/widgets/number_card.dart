import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_gaming_button.dart';

class NumberCard extends StatefulWidget {
  const NumberCard({super.key});

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedGamingButton(),
          ],
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
        onTap: () {},
        child: Container(
          width: 250, // Width of the button
          height: 70, // Height of the button
          decoration: BoxDecoration(
            color: const Color(0xFFffdf6d).withOpacity(0.3),
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFffd540),
                offset: Offset(0, 4),
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
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFFffd94c),
                    borderRadius: BorderRadius.circular(19),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFedb900),
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                right: 15,
                child: Container(
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: const Color(0xFFFFD700).withOpacity(0.04),
                    //     offset: const Offset(4, 4),
                    //     blurRadius: 6,
                    //   ),
                    // ],
                  ),
                ),
              ),
              Positioned(
                top: 14,
                left: 18,
                child: Container(
                  height: 15,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
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

class GamingBButton extends StatelessWidget {
  const GamingBButton({
    super.key,
    this.onTap,
    this.text = 'YAY, OK!',
  });
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 250,
          height: 65,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE99D),
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE6B94D).withOpacity(0.5),
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Bottom highlight/shadow
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD54F).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),

              // Main button body
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD54F),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Stack(
                  children: [
                    // Top glossy highlight
                    Positioned(
                      top: 4,
                      left: 10,
                      right: 10,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    // Text
                    Center(
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontFamily: 'ComicSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 2),
                              blurRadius: 2,
                              color: Color(0x70000000),
                            ),
                          ],
                        ),
                      ),
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

class GamingButtonBtn extends StatelessWidget {
  const GamingButtonBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 250, // Width of the button
          height: 70, // Height of the button
          decoration: BoxDecoration(
            color: const Color(0xFFffdf6d), // Outer base color
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFC107).withOpacity(0.8), // Outer glow
                offset: const Offset(0, 4),
                blurRadius: 12,
              ),
              const BoxShadow(
                color: Color(0xFFffad42), // Strong shadow for depth
                offset: Offset(0, 6),
                blurRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Inner glossy effect
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                bottom: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE082),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFf9a825),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
              // Glossy reflection
              Positioned(
                top: 10,
                left: 15,
                right: 15,
                child: Container(
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                top: 9,
                left: 20,
                child: Container(
                  height: 10,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              // Button text
              Center(
                child: Text(
                  'YAY, OK!',
                  style: TextStyle(
                    fontFamily: 'ComicSans', // Playful gaming font
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF263238),
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 2),
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Shadow(
                        offset: const Offset(-2, -2),
                        blurRadius: 2,
                        color: Colors.white.withOpacity(0.3),
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

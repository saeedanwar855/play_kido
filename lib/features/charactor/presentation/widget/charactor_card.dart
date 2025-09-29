import 'package:flutter/material.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/charactor/data/model/charactor_model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    required this.index,
    required this.onTap,
    super.key,
  });

  final CharacterModel character;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Base card with gradient background
          Container(
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: character.isUnlocked
                    ? [Colors.purple.shade200, Colors.deepPurple.shade600]
                    : [Colors.purple.shade200, Colors.deepPurple.shade600],
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: character.isUnlocked ? Colors.amber.shade300 : Colors.grey.shade400,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      (character.isUnlocked ? Colors.purple : Colors.transparent).withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Character level or rank indicator
                if (character.isUnlocked)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade400,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: const Text(
                      'LVL 5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 5),
                // Character image with effects
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Glow effect behind character
                    if (character.isUnlocked)
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    // Character image
                    Container(
                      // height: 60,
                      // width: 60,
                      decoration: const BoxDecoration(
                          // shape: BoxShape.circle,
                          // border: Border.all(
                          //   color:
                          //       character.isUnlocked ? Colors.amber.shade300 : Colors.grey.shade400,
                          //   width: 2,
                          // ),
                          ),
                      child: Image.asset(
                        character.imagePath,
                        height: 65,
                        width: 65,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Character name with special effects
                Text(
                  character.name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: character.isUnlocked ? Colors.white : Colors.grey.shade300,
                    fontFamily: 'ComicSans',
                    shadows: const [
                      Shadow(
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Lock overlay for locked characters
          if (!character.isUnlocked) ...[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    // Animated shine effect
                    const Positioned.fill(
                      child: ShineEffect(),
                    ),
                    // Lock icon
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white24,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Price tag with special effects
            Positioned(
              bottom: 8,
              left: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.orange.shade400,
                      Colors.orange.shade700,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/candy.png',
                      height: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${character.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSans',
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          // Unlocked indicator
          if (character.isUnlocked)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade400,
                      Colors.green.shade700,
                    ],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Animated shine effect for locked characters
class ShineEffect extends StatefulWidget {
  const ShineEffect({super.key});

  @override
  State<ShineEffect> createState() => _ShineEffectState();
}

class _ShineEffectState extends State<ShineEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ShinePainter(_controller.value),
        );
      },
    );
  }
}

class ShinePainter extends CustomPainter {
  ShinePainter(this.value);
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(-1.0 + 2.0 * value, 0),
        end: Alignment(-0.2 + 2.0 * value, 1),
        colors: [
          Colors.white.withOpacity(0),
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(ShinePainter oldDelegate) => true;
}

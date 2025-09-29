import 'package:flutter/material.dart';

class InteractiveButton extends StatefulWidget {
  const InteractiveButton({
    required this.ontap,
    this.buttonText = "Let's Play!",
    super.key,
  });

  final VoidCallback ontap;
  final String buttonText;

  @override
  State<InteractiveButton> createState() => _InteractiveButtonState();
}

class _InteractiveButtonState extends State<InteractiveButton> with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = CurvedAnimation(
      parent: _bounceController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 + (_scaleAnimation.value * 0.05), // Adds bounce effect
            child: GestureDetector(
              onTap: widget.ontap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8A2BE2), // Vibrant purple
                      Color(0xFFFF69B4), // Pink
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icon/star.png',
                      height: 32,
                      width: 32,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.buttonText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSans',
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Colors.yellow, Colors.white],
                        ).createShader(bounds);
                      },
                      child: const Icon(
                        Icons.emoji_events_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

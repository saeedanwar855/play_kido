import 'package:flutter/material.dart';

class AnimatedGamingButton extends StatefulWidget {
  const AnimatedGamingButton({
    required this.onTap,
    super.key,
    this.height = 70,
    this.width = 250,
    this.buttomText = 'YAY, OK!',
  });
  final double width;
  final double height;
  final VoidCallback onTap;
  final String buttomText;

  @override
  State<AnimatedGamingButton> createState() => _AnimatedGamingButtonState();
}

class _AnimatedGamingButtonState extends State<AnimatedGamingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(), // Start animation on tap
        onTapUp: (_) {
          _controller.reverse(); // Reset animation on release
          widget.onTap();
        },
        onTapCancel: () => _controller.reverse(), // Handle tap cancellation
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: const Color(0xFFffdf6d), // Outer base color
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFC107).withOpacity(0.8), // Outer glow
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                ),
                const BoxShadow(
                  color: Color(0xFFffad42), // Strong shadow for depth
                  offset: Offset(0, 2),
                  blurRadius: 0.5,
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
                      color: const Color(0xFFfdcd28),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xfffecb803),
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
                    widget.buttomText,
                    style: TextStyle(
                      fontFamily: 'ComicSans', // Playful gaming font
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
      ),
    );
  }
}

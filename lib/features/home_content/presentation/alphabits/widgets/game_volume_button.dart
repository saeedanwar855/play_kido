import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_pop_widget.dart';
import 'package:play_kido/core/size_config/size_config.dart';

class GameVolumeButton extends StatefulWidget {
  const GameVolumeButton({
    required this.onTap,
    super.key,
    this.isPlaying = false,
  });
  final VoidCallback onTap;
  final bool isPlaying;
  @override
  State<GameVolumeButton> createState() => _GameVolumeButtonState();
}

class _GameVolumeButtonState extends State<GameVolumeButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTapIcon(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 + (_animation.value * 0.1),
            child: Container(
              width: SizeConfig.getWidth(22),
              height: SizeConfig.getHeight(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: widget.isPlaying
                        ? Colors.purple.withOpacity(0.5)
                        : Colors.purple.withOpacity(0.3),
                    blurRadius: widget.isPlaying ? 15 : 10,
                    spreadRadius: widget.isPlaying ? 3 : 2,
                  ),
                ],
                border: Border.all(
                  color: widget.isPlaying
                      ? Colors.purple.withOpacity(0.7)
                      : Colors.purple.withOpacity(0.5),
                  width: 3,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/icon/speaker_icon.png',
                    fit: BoxFit.contain,
                    color: widget.isPlaying ? Colors.purple : null,
                  ),
                  if (widget.isPlaying)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.purple.withOpacity(0.2),
                            Colors.white.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

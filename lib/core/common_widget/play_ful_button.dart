import 'package:flutter/material.dart';

class PlayfulButton extends StatefulWidget {
  const PlayfulButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.color = Colors.blue,
  });
  final String text;
  final VoidCallback onPressed;
  final Color color;

  @override
  _PlayfulButtonState createState() => _PlayfulButtonState();
}

class _PlayfulButtonState extends State<PlayfulButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
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
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        _controller.forward();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        _controller.reverse();
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: _isPressed ? const Offset(2, 2) : const Offset(4, 4),
                blurRadius: 5,
              ),
            ],
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Comic Sans MS',
            ),
          ),
        ),
      ),
    );
  }
}

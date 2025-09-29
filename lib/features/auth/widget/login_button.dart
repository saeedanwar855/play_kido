import 'package:flutter/material.dart';

class KidLoginButton extends StatefulWidget {
  const KidLoginButton({
    required this.onPressed,
    super.key,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  State<KidLoginButton> createState() => _KidLoginButtonState();
}

class _KidLoginButtonState extends State<KidLoginButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: widget.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Let's Play!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

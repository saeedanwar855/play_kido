import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/app_common_button.dart';
import 'package:play_kido/features/auth/widget/login_button.dart';
import 'package:play_kido/features/home/screen/home_screen.dart';

class KidLoginForm extends StatefulWidget {
  const KidLoginForm({super.key});

  @override
  State<KidLoginForm> createState() => _KidLoginFormState();
}

class _KidLoginFormState extends State<KidLoginForm> with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  late AnimationController _bounceController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required String hintText,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    String? helperText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword && !_isPasswordVisible,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.purple,
                size: 28,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
          ),
        ),
        if (helperText != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              helperText,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildInputField(
            hintText: "What's your name, friend?",
            icon: Icons.emoji_emotions,
            controller: _usernameController,
            helperText: 'Type your name here!',
          ),
          const SizedBox(height: 25),
          _buildInputField(
            hintText: 'Secret password',
            icon: Icons.lock,
            controller: _passwordController,
            isPassword: true,
            helperText: 'Shhh! Keep it secret!',
          ),
          const SizedBox(height: 35),
          ScaleTransition(
            scale: _scaleAnimation,
            child: KidLoginButton(
              isLoading: _isLoading,
              onPressed: () async {
                await _bounceController.forward().then((_) {
                  _bounceController.reverse();
                });
                setState(() => _isLoading = true);

                await Future.delayed(const Duration(seconds: 1));
                setState(() => _isLoading = false);
                await Navigator.push(
                  context,
                  MaterialPageRoute<HomePage>(builder: (context) => const HomePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedSkipButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_circle_outline,
          color: Colors.purple,
          size: 30,
        ),
        label: const Text(
          'Start Playing!',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

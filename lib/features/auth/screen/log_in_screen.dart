// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:play_kido/features/auth/widget/log_in_form.dart';
// class LogInScreen extends StatelessWidget {
//   const LogInScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFFFFE0E9), // Soft pink
//               Color(0xFFE8F9FF), // Light blue
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Stack(
//             children: [
//               // Decorative background elements
//               Positioned(
//                 top: 20,
//                 left: -30,
//                 child: Transform.rotate(
//                   angle: -0.2,
//                   child: SizedBox(
//                     height: 140,
//                     width: 140,
//                     child: Lottie.asset('assets/lottie/star.json'),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: -20,
//                 top: 100,
//                 child: Transform.rotate(
//                   angle: 0.2,
//                   child: SizedBox(
//                     height: 100,
//                     width: 100,
//                     child: Lottie.asset('assets/lottie/cloud.json'),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Spacer(),
//                     ShaderMask(
//                       shaderCallback: (Rect bounds) {
//                         return const LinearGradient(
//                           colors: [
//                             Color(0xFFFF71A4), // Pink
//                             Color(0xFF4ECDC4), // Turquoise
//                           ],
//                         ).createShader(bounds);
//                       },
//                       child: const Text(
//                         'Welcome to\nPlay Kido!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           height: 1.2,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     // Animated dog with bounce effect
//                     TweenAnimationBuilder(
//                       tween: Tween<double>(begin: 0, end: 1),
//                       duration: const Duration(seconds: 1),
//                       builder: (context, value, child) {
//                         return Transform.translate(
//                           offset: Offset(0, sin(value * 6) * 10),
//                           child: Lottie.asset(
//                             'assets/lottie/dog_gif.json',
//                             height: 250,
//                           ),
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 30),
//                     const KidLoginForm(),
//                     const SizedBox(height: 30),
//                     // Social login buttons with animation
//                     Container(
//                       padding: const EdgeInsets.all(15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           _buildSocialButton(
//                             'assets/icon/facebook_icon.png',
//                             () {},
//                           ),
//                           const SizedBox(width: 20),
//                           _buildSocialButton(
//                             'assets/icon/google_icon.png',
//                             () {},
//                           ),
//                           const SizedBox(width: 20),
//                           _buildSocialButton(
//                             'assets/icon/apple_icon.png',
//                             () {},
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Spacer(),
//                     // Skip button with playful design
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.3),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: TextButton.icon(
//                         onPressed: () {},
//                         icon: Icon(Icons.skip_next_rounded, color: Colors.grey[700]),
//                         label: Text(
//                           'Skip for now',
//                           style: TextStyle(
//                             color: Colors.grey[700],
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildSocialButton(String asset, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(15),
//       child: Image.asset(
//         asset,
//         height: 70,
//         width: 70,
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:play_kido/features/auth/widget/log_in_form.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> with TickerProviderStateMixin {
  // Animation controller for interactive elements
  late AnimationController _dogAnimationController;

  @override
  void initState() {
    super.initState();
    _dogAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _dogAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFE0E9),
              Color(0xFFE8F9FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              _buildBackgroundAnimations(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildWelcomeText(),
                    _buildInteractiveDog(),
                    _buildEnhancedLoginForm(),
                    const SizedBox(height: 10),
                    _buildParentAuthSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundAnimations() {
    return Stack(
      children: [
        // More animated background elements
        Positioned(
          top: 20,
          left: -30,
          child: Transform.rotate(
            angle: -0.2,
            child: SizedBox(
              height: 140,
              width: 140,
              child: Lottie.asset(
                'assets/lottie/star.json',
                repeat: true,
              ),
            ),
          ),
        ),
        Positioned(
          right: -20,
          top: 100,
          child: Transform.rotate(
            angle: 0.2,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset('assets/lottie/cloud.json'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Color(0xFFFF71A4),
            Color(0xFF4ECDC4),
          ],
        ).createShader(bounds);
      },
      child: const Text(
        'Welcome to\nPlay Kido!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          height: 1.2,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInteractiveDog() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, sin(value * 6) * 10),
          child: Lottie.asset(
            'assets/lottie/dog_gif.json',
            height: 250,
          ),
        );
      },
    );
  }

  Widget _buildEnhancedLoginForm() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const KidLoginForm(),
    );
  }

  Widget _buildParentAuthSection() {
    return Container(
      child: Column(
        children: [
          Text(
            'Parents Corner',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton('assets/icon/google_icon.png', () {}),
              const SizedBox(width: 20),
              _buildSocialButton('assets/icon/apple_icon.png', () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String asset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Image.asset(
          asset,
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}

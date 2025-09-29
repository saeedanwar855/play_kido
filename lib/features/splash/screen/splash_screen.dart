import 'package:flutter/material.dart';
import 'package:play_kido/core/theme/app_colors.dart';
import 'package:play_kido/features/auth/screen/log_in_screen.dart';
import 'package:play_kido/features/home/presentation/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  void navigateToLogInScreen() {
    Navigator.push(
      context,
      MaterialPageRoute<LogInScreen>(builder: (context) => const LogInScreen()),
    );
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
              AppColors.primaryOrange,
              AppColors.blueberry,
              AppColors.candyPink,
              AppColors.primaryOrange,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<HomePage>(builder: (context) => const LogInScreen()),
                  );
                },
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

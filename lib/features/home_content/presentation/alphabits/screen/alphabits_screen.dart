import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_kido/features/home_content/data/alphabits_model/alphabit_model.dart';
import 'package:play_kido/features/home_content/data/alphabits_model/alphabits_sounds.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/screen/alphabit_view_screen.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class AlphabitsScreen extends StatefulWidget {
  const AlphabitsScreen({super.key});

  @override
  State<AlphabitsScreen> createState() => _AlphabitsScreenState();
}

class _AlphabitsScreenState extends State<AlphabitsScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playLetterSound(int index) async {
    try {
      await _audioPlayer.stop();
      final player = AudioPlayer();
      await player.setSource(AssetSource(letterSounds[index].replaceAll('assets/', '')));
      await player.resume();

      player.onPlayerComplete.listen((event) {
        player.dispose();
      });
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            KidsAppHeader(
              title: 'Alphabets',
              onBackPress: () => Navigator.pop(context),
              rightIcon: 'assets/icon/rewards_icon.png',
            ),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: letters.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() => currentIndex = index);
                    _playLetterSound(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      letters[index],
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Error loading image');
                      },
                    ),
                  ),
                ),
              ),
            ),

            InteractiveButton(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<AlphabitViewScreen>(
                    builder: (context) => const AlphabitViewScreen(),
                  ),
                );
              },
            ),
            // Interactive Button
          ],
        ),
      ),
    );
  }
}

class InteractiveButton extends StatefulWidget {
  const InteractiveButton({required this.ontap, this.buttonText = "Let's Play!", super.key});

  final VoidCallback ontap;
  final String buttonText;

  @override
  State<InteractiveButton> createState() => _InteractiveButtonState();
}

class _InteractiveButtonState extends State<InteractiveButton> with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
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
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1, end: 1.05),
        duration: const Duration(seconds: 1),
        builder: (context, double scale, child) {
          return Transform.scale(
            scale: scale,
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

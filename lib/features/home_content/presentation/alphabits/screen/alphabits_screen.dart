import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/play_ful_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/screen/alphabit_view_screen.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class AlphabitsScreen extends StatefulWidget {
  const AlphabitsScreen({super.key});

  @override
  State<AlphabitsScreen> createState() => _AlphabitsScreenState();
}

class _AlphabitsScreenState extends State<AlphabitsScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();
  List<String> letters = [
    'assets/animated_alphabits/a.gif',
    'assets/animated_alphabits/b.gif',
    'assets/animated_alphabits/c.gif',
    'assets/animated_alphabits/d.gif',
    'assets/animated_alphabits/e.gif',
    'assets/animated_alphabits/f.gif',
    'assets/animated_alphabits/g.gif',
    'assets/animated_alphabits/h.gif',
    'assets/animated_alphabits/i.gif',
    'assets/animated_alphabits/j.gif',
    'assets/animated_alphabits/k.gif',
    'assets/animated_alphabits/l.gif',
    'assets/animated_alphabits/m.gif',
    'assets/animated_alphabits/n.gif',
    'assets/animated_alphabits/o.gif',
    'assets/animated_alphabits/p.gif',
    'assets/animated_alphabits/q.gif',
    'assets/animated_alphabits/r.gif',
    'assets/animated_alphabits/s.gif',
    'assets/animated_alphabits/t.gif',
    'assets/animated_alphabits/u.gif',
    'assets/animated_alphabits/v.gif',
    'assets/animated_alphabits/w.gif',
    'assets/animated_alphabits/x.gif',
    'assets/animated_alphabits/y.gif',
    'assets/animated_alphabits/z.gif',
  ];
  List<String> letterSounds = [
    'assets/audio_alphabet/A.wav',
    'assets/audio_alphabet/B.wav',
    'assets/audio_alphabet/C.wav',
    'assets/audio_alphabet/D.wav',
    'assets/audio_alphabet/E.wav',
    'assets/audio_alphabet/F.wav',
    'assets/audio_alphabet/G.wav',
    'assets/audio_alphabet/H.wav',
    'assets/audio_alphabet/I.wav',
    'assets/audio_alphabet/J.wav',
    'assets/audio_alphabet/K.wav',
    'assets/audio_alphabet/L.wav',
    'assets/audio_alphabet/M.wav',
    'assets/audio_alphabet/N.wav',
    'assets/audio_alphabet/O.wav',
    'assets/audio_alphabet/P.wav',
    'assets/audio_alphabet/Q.wav',
    'assets/audio_alphabet/R.wav',
    'assets/audio_alphabet/S.wav',
    'assets/audio_alphabet/T.wav',
    'assets/audio_alphabet/U.wav',
    'assets/audio_alphabet/V.wav',
    'assets/audio_alphabet/W.wav',
    'assets/audio_alphabet/X.wav',
    'assets/audio_alphabet/Y.wav',
    'assets/audio_alphabet/Z.wav',
  ];
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
              rightIcon: 'assets/icon/rewards_icon.png', // Optional
            ),

            // Grid of Letters
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
  const InteractiveButton({required this.ontap, super.key});

  final VoidCallback ontap;

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
                    const Text(
                      "Let's Play!",
                      style: TextStyle(
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

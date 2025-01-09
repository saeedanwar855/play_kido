import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_pop_widget.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/screen/alphabits_screen.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/screen/phonics_screen.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class AlphabitViewScreen extends StatefulWidget {
  const AlphabitViewScreen({super.key});

  @override
  State<AlphabitViewScreen> createState() => _AlphabitViewScreenState();
}

class _AlphabitViewScreenState extends State<AlphabitViewScreen> with TickerProviderStateMixin {
  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final String audioPath = 'audio_alphabet/A.wav';

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  Future<void> _playSound() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(audioPath));
      setState(() => isPlaying = true);

      await _controller.forward().then((_) => _controller.reverse());

      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => isPlaying = false);
      });
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/bgg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              KidsAppHeader(
                title: ' Alphabets',
                onBackPress: () => Navigator.pop(context),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: AnimatedTapIcon(
                        onTap: _playSound,
                        child: Image.asset('assets/letters/a.png'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GameVolumeButton(
                      onTap: _playSound,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InteractiveButton(
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<PhonicsScreen>(
                        builder: (context) => const PhonicsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/interactive_common_button.dart';
import 'package:play_kido/features/home_content/data/alphabits_model/alphabit_model.dart';
import 'package:play_kido/features/home_content/data/alphabits_model/alphabits_sounds.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/screen/alphabit_view_screen.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
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
              isBack: true,
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
                  onTap: () async {
                    setState(() => currentIndex = index);
                    await _playLetterSound(index);
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                children: [
                  GameVolumeButton(
                    onTap: () {},
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

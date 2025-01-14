import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_pop_widget.dart';
import 'package:play_kido/core/common_widget/interactive_common_button.dart';
import 'package:play_kido/features/home_content/data/alphabits_model/alphabits_sounds.dart';
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
  bool isShakeEnable = false;
  late AnimationController _controller;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  Future<void> _playSound(String audioPath) async {
    try {
      await _audioPlayer.stop();
      final player = AudioPlayer();
      await player.setSource(AssetSource(audioPath.replaceAll('assets/', '')));
      await player.resume();

      player.onPlayerComplete.listen((event) {
        player.dispose();
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
                isBack: true,
                title: ' Alphabets',
                onBackPress: () => Navigator.pop(context),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: alphabitModel.length,
                  itemBuilder: (context, index) {
                    final data = alphabitModel[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: AnimatedTapIcon(
                            onTap: () {
                              _playSound(data.alphabitSound);
                            },
                            child: Image.asset(data.alphabit),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GameVolumeButton(
                          onTap: () {
                            _playSound(data.alphabitSound);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InteractiveButton(
                  buttonText: 'Next Word',
                  ontap: () {
                    controller.nextPage(
                      duration: const Duration(microseconds: 3),
                      curve: Curves.bounceInOut,
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

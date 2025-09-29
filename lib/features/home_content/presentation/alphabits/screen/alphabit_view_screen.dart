import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_pop_widget.dart';
import 'package:play_kido/core/common_widget/interactive_common_button.dart';
import 'package:play_kido/features/home_content/data/alphabits_model/alphabits_sounds.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';
import 'package:play_kido/features/quiz/data/model/alphabit_quiz.dart';
import 'package:play_kido/features/quiz/presentation/screen/alphabit_quiz_screen.dart';
import 'package:play_kido/features/alphabet_game/presentation/screen/trace_letter_game_screen.dart';

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
  int currentIndex = 0;

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

  Future<void> attendQuiz(int index) async {
    // Check if we've completed 4 letters (index + 1 is divisible by 4)
    if ((index + 1) % 4 == 0) {
      // Calculate which group we're in (0-based)
      final groupIndex = index ~/ 4;

      // Get the quiz questions for the current group
      if (groupIndex < alphabetQuiz.length) {
        final currentGroup = alphabetQuiz[groupIndex];
        final questions = currentGroup['questions'] as List<Map<String, dynamic>>;

        await Navigator.push(
          context,
          MaterialPageRoute<AlphabitQuizScreen>(
            builder: (context) => AlphabitQuizScreen(
              questions: questions,
              groupName: currentGroup['letters'] as String,
            ),
          ),
        );
      }
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
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InteractiveButton(
                          buttonText: 'Trace Letter',
                          ontap: () {
                            final currentLetter = alphabitModel[currentIndex];
                            Navigator.push(
                              context,
                              MaterialPageRoute<TraceLetterGameScreen>(
                                builder: (context) => TraceLetterGameScreen(
                                  letter: currentLetter.alphabit.split('/').last.split('.').first.toUpperCase(),
                                  word: currentLetter.alphabit.split('/').last.split('.').first.toUpperCase() + ' WORD',
                                  animalIcon: 'assets/character/cute_rabbit.png',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InteractiveButton(
                          buttonText: 'Next Word',
                          ontap: () {
                            attendQuiz(currentIndex);
                            controller.nextPage(
                              duration: const Duration(microseconds: 3),
                              curve: Curves.bounceInOut,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

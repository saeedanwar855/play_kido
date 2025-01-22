import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_kido/core/common_widget/animated_pop_widget.dart';
import 'package:play_kido/core/common_widget/common_app_dialog.dart';
import 'package:play_kido/core/common_widget/vertical_bounce_back.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_cubit.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_state.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/game_volume_button.dart';
import 'package:play_kido/features/home_content/presentation/alphabits/widgets/header_widget.dart';

class AlphabitQuizScreen extends StatefulWidget {
  const AlphabitQuizScreen({
    required this.questions,
    required this.groupName,
    super.key,
  });
  final List<Map<String, dynamic>> questions;
  final String groupName;

  @override
  State<AlphabitQuizScreen> createState() => _AlphabitQuizScreenState();
}

class _AlphabitQuizScreenState extends State<AlphabitQuizScreen> {
  late AudioPlayer audioPlayer;
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playQuestionAudio() async {
    try {
      await audioPlayer.stop();
      final audioPath = widget.questions[currentQuestionIndex]['audio'] as String;
      await audioPlayer.setSource(AssetSource(audioPath.replaceAll('assets/', '')));
      await audioPlayer.resume();
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
  }

  void checkAnswer(BuildContext context, String answer) {
    if (isAnswered) return;

    final correctAnswer = widget.questions[currentQuestionIndex]['answer'] as String;

    setState(() {
      selectedAnswer = answer;
      isAnswered = true;
      if (answer == correctAnswer) {
        score++;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestionIndex < widget.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          isAnswered = false;
          selectedAnswer = null;
        });
      } else {
        if (context.mounted) {
          showCompletionDialog(
            context,
            message: 'Baby',
            reward: 10,
            lessonNumber: '',
            onTap: () {},
          );
        }
      }
    });
  }

  void showQuizComplete() {
    showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        title: Text(
          'Quiz Complete! ${widget.groupName}',
          style: const TextStyle(fontFamily: 'ComicSans'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your score: $score/${widget.questions.length}',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'ComicSans',
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              score >= widget.questions.length / 2
                  ? 'assets/images/success.png'
                  : 'assets/images/try_again.png',
              height: 100,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Continue Learning',
              style: TextStyle(
                color: Color(0xFFEF3349),
                fontFamily: 'ComicSans',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildQuestionContent(Map<String, dynamic> question) {
    switch (question['type']) {
      case 'recognition':
        return Image.asset(
          question['question'] as String,
          height: 150,
        );
      case 'sound_matching':
        return Image.asset(
          question['visual'] as String,
          height: 150,
        );
      case 'starting_letter':
        return Image.asset(
          question['question'] as String,
          height: 150,
        );
      case 'sequence':
        return Text(
          question['question'] as String,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'ComicSans',
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon/bgg.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    KidsAppHeader(
                      isBack: true,
                      title:
                          '${widget.groupName} Quiz ${currentQuestionIndex + 1}/${widget.questions.length}',
                      onBackPress: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            currentQuestion['questionType'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                          const SizedBox(height: 20),
                          buildQuestionContent(currentQuestion),
                          const SizedBox(height: 20),
                          GameVolumeButton(
                            onTap: playQuestionAudio,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: (currentQuestion['options'] as List).length,
                        itemBuilder: (context, index) {
                          final option = currentQuestion['options'][index];
                          final isSelected = selectedAnswer == option;
                          final isCorrect = option == currentQuestion['answer'];

                          return AnimatedTapIcon(
                            onTap: () => checkAnswer(
                              context,
                              option,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isAnswered && isSelected
                                    ? isCorrect
                                        ? Colors.green.withOpacity(0.3)
                                        : Colors.red.withOpacity(0.3)
                                    : Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: const Color(0xFF4A7B5F),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  option as String,
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'ComicSans',
                                    color: isAnswered && isSelected
                                        ? isCorrect
                                            ? Colors.green
                                            : Colors.red
                                        : const Color(0xFF4A7B5F),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) {
                return Positioned(
                  bottom: 0,
                  child: VerticalBounceWidget(
                    // duration: const Duration(milliseconds: 900),
                    child: Image.asset(
                      state.selectedCharacter?.imagePath ?? 'assets/character/captain_majid.png',
                      height: SizeConfig.getHeight(25),
                      width: SizeConfig.getWidth(30),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

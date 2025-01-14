import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/charactor/data/model/charactor_model.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_cubit.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_state.dart';
import 'package:play_kido/features/charactor/presentation/widget/charactor_card.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<CharacterData> characters = [
    CharacterData('assets/character/doremon.png', 'Doraemon', 'Your Helpful Friend'),
    CharacterData('assets/character/dragon.png', 'Dragon', 'Brave Explorer'),
    CharacterData('assets/character/pikachu.png', 'Pikachu', 'Fun Partner'),
    CharacterData('assets/character/chota_bheem.png', 'Chota Bheem', 'Strong Guide'),
    CharacterData('assets/character/captain_majid.png', 'Captain Majid', 'Strong Guide'),
    CharacterData('assets/character/oggy.png', 'Oggy', 'Strong Guide'),
    CharacterData('assets/character/singham.png', 'Singham', 'Strong Guide'),
    CharacterData('assets/character/doremon.png', 'Doraemon', 'Your Helpful Friend'),
    CharacterData('assets/character/dragon.png', 'Dragon', 'Brave Explorer'),
    CharacterData('assets/character/pikachu.png', 'Pikachu', 'Fun Partner'),
    CharacterData('assets/character/chota_bheem.png', 'Chota Bheem', 'Strong Guide'),
    CharacterData('assets/character/captain_majid.png', 'Captain Majid', 'Strong Guide'),
    CharacterData('assets/character/oggy.png', 'Oggy', 'Strong Guide'),
    CharacterData('assets/character/singham.png', 'Singham', 'Strong Guide'),
  ];

  late PageController _pageController;
  int currentIndex = 0;
  bool isLeftPressed = false;
  bool isRightPressed = false;

  @override
  void initState() {
    super.initState();
    // _playSound();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> changeCharacter({required bool next}) async {
    if (next && currentIndex < characters.length - 1) {
      setState(() {
        isRightPressed = true;
        currentIndex++;
      });
      await _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          isRightPressed = false;
        });
      });
    } else if (!next && currentIndex > 0) {
      setState(() {
        isLeftPressed = true;
        currentIndex--;
      });
      await _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          isLeftPressed = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoaded) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/icon/7.jpg',
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 2,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(), // Disable swipe
                            itemCount: characters.length,
                            itemBuilder: (context, index) {
                              final character = state.characters[index];
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      character.imagePath,
                                      height: SizeConfig.getHeight(30),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      character.name,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple,
                                        fontFamily: 'ComicSans',
                                      ),
                                    ),
                                    Text(
                                      character.description,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.deepPurple,
                                        fontFamily: 'ComicSans',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => changeCharacter(next: false),
                                child: Image.asset(
                                  'assets/icon/back_icon.png',
                                ),
                              ),
                              GestureDetector(
                                onTap: () => changeCharacter(next: true),
                                child: Image.asset(
                                  'assets/icon/forward_icon.png',
                                  width: 100,
                                  height: 80,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text(
                            'Choose Your Learning Buddy!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontFamily: 'ComicSans',
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              itemCount: state.characters.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemBuilder: (context, index) {
                                final character = state.characters[index];
                                return CharacterCard(
                                  index: index,
                                  character: character,
                                  onTap: () {
                                    if (character.isUnlocked) {
                                      context.read<CharacterCubit>().selectCharacter(character);
                                    } else {
                                      _showUnlockDialog(context, character);
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _showUnlockDialog(BuildContext context, CharacterModel character) {
    showDialog<AlertDialog>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Unlock ${character.name}?'),
        content: Text('Price: ${character.price} coins'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<CharacterCubit>().unlockCharacter(character);
              Navigator.pop(context);
            },
            child: const Text('Unlock'),
          ),
        ],
      ),
    );
  }
}

class CharacterData {
  CharacterData(this.imagePath, this.name, this.description);
  final String imagePath;
  final String name;
  final String description;
}

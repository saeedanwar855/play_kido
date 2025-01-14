// lib/features/character/presentation/cubit/character_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_kido/features/charactor/data/model/charactor_model.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial()) {
    _initializeCharacters();
  }

  final List<CharacterModel> _defaultCharacters = [
    CharacterModel(
      id: '1',
      imagePath: 'assets/character/doremon.png',
      name: 'Doraemon',
      description: 'Your Helpful Friend',
      price: 0, // Free starter character
      isUnlocked: true,
    ),
    CharacterModel(
      id: '2',
      imagePath: 'assets/character/dragon.png',
      name: 'Dragon',
      isUnlocked: true,
      description: 'Brave Explorer',
      price: 100,
    ),
    CharacterModel(
      id: '3',
      imagePath: 'assets/character/pikachu.png',
      name: 'Pikachu',
      description: 'Fun Partner',
      price: 150,
    ),
    CharacterModel(
      id: '4',
      imagePath: 'assets/character/chota_bheem.png',
      name: 'Chota Bheem',
      description: 'Strong Guide',
      price: 200,
    ),
    CharacterModel(
      id: '5',
      imagePath: 'assets/character/captain_majid.png',
      name: 'Captain Majid',
      description: 'Strong Guide',
      price: 250,
    ),
    CharacterModel(
      id: '6',
      imagePath: 'assets/character/oggy.png',
      name: 'Oggy',
      description: 'Strong Guide',
      price: 300,
    ),
    CharacterModel(
      id: '7',
      imagePath: 'assets/character/singham.png',
      name: 'Singham',
      description: 'Strong Guide',
      price: 350,
    ),
  ];

  Future<void> _initializeCharacters() async {
    try {
      // Here you would typically load saved character states from local storage
      // For now, we'll use the default list
      final characters = _defaultCharacters;
      emit(
        CharacterLoaded(
          selectedCharacter: characters.firstWhere((c) => c.isUnlocked),
          characters: characters,
        ),
      );
    } catch (e) {
      emit(CharacterError('Failed to load characters'));
    }
  }

  Future<void> selectCharacter(CharacterModel character) async {
    if (state is CharacterLoaded) {
      final currentState = state as CharacterLoaded;
      emit(
        CharacterLoaded(
          selectedCharacter: character,
          characters: currentState.characters,
        ),
      );
      // Save selected character to local storage
    }
  }

  Future<bool> unlockCharacter(CharacterModel character) async {
    if (state is CharacterLoaded) {
      final currentState = state as CharacterLoaded;
      final characterIndex = currentState.characters.indexOf(character);

      // Here you would implement your payment logic
      // For demo, let's just unlock it
      final updatedCharacters = List<CharacterModel>.from(currentState.characters);
      updatedCharacters[characterIndex] = character.copyWith(isUnlocked: true);

      emit(
        CharacterLoaded(
          selectedCharacter: currentState.selectedCharacter,
          characters: updatedCharacters,
        ),
      );
      return true;
    }
    return false;
  }

  CharacterModel? getSelectedCharacter() {
    if (state is CharacterLoaded) {
      return (state as CharacterLoaded).selectedCharacter;
    }
    return null;
  }
}

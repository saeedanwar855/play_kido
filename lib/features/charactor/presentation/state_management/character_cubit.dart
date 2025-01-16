// lib/features/character/presentation/cubit/character_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_kido/features/charactor/data/model/charactor_model.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial()) {
    _initializeCharacters();
  }

  Future<void> _initializeCharacters() async {
    try {
      // Here you would typically load saved character states from local storage
      // For now, we'll use the default list
      final characters = defaultCharacters;
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
    }
  }

  Future<bool> unlockCharacter(CharacterModel character) async {
    if (state is CharacterLoaded) {
      final currentState = state as CharacterLoaded;
      final characterIndex = currentState.characters.indexOf(character);

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

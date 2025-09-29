// lib/features/character/presentation/cubit/character_state.dart
import 'package:play_kido/features/charactor/data/model/charactor_model.dart';

abstract class CharacterState {
  CharacterState({
    required this.characters,
    this.selectedCharacter,
  });
  final CharacterModel? selectedCharacter;
  final List<CharacterModel> characters;
}

class CharacterInitial extends CharacterState {
  CharacterInitial() : super(characters: []);
}

class CharacterLoaded extends CharacterState {
  CharacterLoaded({
    required super.selectedCharacter,
    required super.characters,
  });
}

class CharacterError extends CharacterState {
  CharacterError(this.message) : super(characters: []);
  final String message;
}

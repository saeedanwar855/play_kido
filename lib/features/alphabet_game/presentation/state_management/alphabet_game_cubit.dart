import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_kido/features/alphabet_game/data/model/alphabet_game_model.dart';

// States
abstract class AlphabetGameState {}

class AlphabetGameInitial extends AlphabetGameState {}

class AlphabetGameLoaded extends AlphabetGameState {
  final AlphabetGameModel currentGame;
  final GameProgress progress;
  final bool isTracing;
  final double tracingProgress;

  AlphabetGameLoaded({
    required this.currentGame,
    required this.progress,
    this.isTracing = false,
    this.tracingProgress = 0.0,
  });

  AlphabetGameLoaded copyWith({
    AlphabetGameModel? currentGame,
    GameProgress? progress,
    bool? isTracing,
    double? tracingProgress,
  }) {
    return AlphabetGameLoaded(
      currentGame: currentGame ?? this.currentGame,
      progress: progress ?? this.progress,
      isTracing: isTracing ?? this.isTracing,
      tracingProgress: tracingProgress ?? this.tracingProgress,
    );
  }
}

class AlphabetGameError extends AlphabetGameState {
  final String message;

  AlphabetGameError(this.message);
}

// Cubit
class AlphabetGameCubit extends Cubit<AlphabetGameState> {
  AlphabetGameCubit() : super(AlphabetGameInitial()) {
    _initializeGame();
  }

  void _initializeGame() {
    try {
      final currentGame = alphabetGames.first;
      final progress = const GameProgress();
      
      emit(AlphabetGameLoaded(
        currentGame: currentGame,
        progress: progress,
      ));
    } catch (e) {
      emit(AlphabetGameError('Failed to initialize game: $e'));
    }
  }

  void startTracing() {
    if (state is AlphabetGameLoaded) {
      final currentState = state as AlphabetGameLoaded;
      emit(currentState.copyWith(isTracing: true, tracingProgress: 0.0));
    }
  }

  void updateTracingProgress(double progress) {
    if (state is AlphabetGameLoaded) {
      final currentState = state as AlphabetGameLoaded;
      emit(currentState.copyWith(tracingProgress: progress));
    }
  }

  void stopTracing() {
    if (state is AlphabetGameLoaded) {
      final currentState = state as AlphabetGameLoaded;
      emit(currentState.copyWith(isTracing: false));
    }
  }

  void completeTracing(bool success) {
    if (state is AlphabetGameLoaded) {
      final currentState = state as AlphabetGameLoaded;
      final currentProgress = currentState.progress;
      
      GameProgress newProgress;
      if (success) {
        newProgress = currentProgress.copyWith(
          stars: currentProgress.stars + 10,
          progress: 1.0,
          completedLetters: [
            ...currentProgress.completedLetters,
            currentState.currentGame.letter,
          ],
        );
      } else {
        newProgress = currentProgress.copyWith(
          lives: (currentProgress.lives - 1).clamp(0, 3),
        );
      }
      
      emit(currentState.copyWith(progress: newProgress));
    }
  }

  void resetTracing() {
    if (state is AlphabetGameLoaded) {
      final currentState = state as AlphabetGameLoaded;
      emit(currentState.copyWith(tracingProgress: 0.0));
    }
  }

  void nextGame() {
    if (state is AlphabetGameLoaded) {
      final currentState = state as AlphabetGameLoaded;
      final currentIndex = alphabetGames.indexOf(currentState.currentGame);
      
      if (currentIndex < alphabetGames.length - 1) {
        final nextGame = alphabetGames[currentIndex + 1];
        emit(currentState.copyWith(currentGame: nextGame));
      }
    }
  }

  void previousGame() {
    if (state is AlphabetGameLoaded) {
      final currentState = state as AlphabetGameLoaded;
      final currentIndex = alphabetGames.indexOf(currentState.currentGame);
      
      if (currentIndex > 0) {
        final previousGame = alphabetGames[currentIndex - 1];
        emit(currentState.copyWith(currentGame: previousGame));
      }
    }
  }

  void resetGame() {
    emit(AlphabetGameInitial());
    _initializeGame();
  }
}

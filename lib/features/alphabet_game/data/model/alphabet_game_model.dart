class AlphabetGameModel {
  final String letter;
  final String word;
  final String animalIcon;
  final String audioPath;
  final List<String> tracingPoints;
  final int difficulty;

  const AlphabetGameModel({
    required this.letter,
    required this.word,
    required this.animalIcon,
    required this.audioPath,
    required this.tracingPoints,
    this.difficulty = 1,
  });

  AlphabetGameModel copyWith({
    String? letter,
    String? word,
    String? animalIcon,
    String? audioPath,
    List<String>? tracingPoints,
    int? difficulty,
  }) {
    return AlphabetGameModel(
      letter: letter ?? this.letter,
      word: word ?? this.word,
      animalIcon: animalIcon ?? this.animalIcon,
      audioPath: audioPath ?? this.audioPath,
      tracingPoints: tracingPoints ?? this.tracingPoints,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}

class GameProgress {
  final int stars;
  final int lives;
  final double progress;
  final bool isCompleted;
  final List<String> completedLetters;

  const GameProgress({
    this.stars = 0,
    this.lives = 3,
    this.progress = 0.0,
    this.isCompleted = false,
    this.completedLetters = const [],
  });

  GameProgress copyWith({
    int? stars,
    int? lives,
    double? progress,
    bool? isCompleted,
    List<String>? completedLetters,
  }) {
    return GameProgress(
      stars: stars ?? this.stars,
      lives: lives ?? this.lives,
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
      completedLetters: completedLetters ?? this.completedLetters,
    );
  }
}

// Sample data for the alphabet game
final List<AlphabetGameModel> alphabetGames = [
  const AlphabetGameModel(
    letter: 'G',
    word: 'GORILLA',
    animalIcon: 'assets/character/goofy1.png', // Using existing asset
    audioPath: 'assets/audio_alphabet/G.wav',
    tracingPoints: ['start', 'curve1', 'curve2', 'end'],
  ),
  const AlphabetGameModel(
    letter: 'A',
    word: 'APPLE',
    animalIcon: 'assets/icon/apple_icon.png',
    audioPath: 'assets/audio_alphabet/A.wav',
    tracingPoints: ['start', 'peak', 'left', 'right', 'end'],
  ),
  const AlphabetGameModel(
    letter: 'B',
    word: 'BALL',
    animalIcon: 'assets/character/boy.png',
    audioPath: 'assets/audio_alphabet/B.wav',
    tracingPoints: ['start', 'line1', 'curve1', 'curve2', 'end'],
  ),
  const AlphabetGameModel(
    letter: 'C',
    word: 'CAT',
    animalIcon: 'assets/character/cute_rabbit.png',
    audioPath: 'assets/audio_alphabet/C.wav',
    tracingPoints: ['start', 'curve', 'end'],
  ),
  const AlphabetGameModel(
    letter: 'D',
    word: 'DOG',
    animalIcon: 'assets/character/dragon.png',
    audioPath: 'assets/audio_alphabet/D.wav',
    tracingPoints: ['start', 'line', 'curve', 'end'],
  ),
];

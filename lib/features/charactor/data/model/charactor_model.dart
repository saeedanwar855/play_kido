// lib/features/character/domain/models/character.dart
class CharacterModel {
  CharacterModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
    this.isUnlocked = false,
  });
  final String id;
  final String imagePath;
  final String name;
  final String description;
  final double price;
  final bool isUnlocked;

  CharacterModel copyWith({bool? isUnlocked}) {
    return CharacterModel(
      id: id,
      imagePath: imagePath,
      name: name,
      description: description,
      price: price,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }
}

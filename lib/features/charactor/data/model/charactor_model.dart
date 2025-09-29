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

final List<CharacterModel> defaultCharacters = [
  CharacterModel(
    id: '1',
    imagePath: 'assets/character/doremon.png',
    name: 'Doraemon',
    description: 'Your Helpful Friend',
    price: 0,
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
    imagePath: 'assets/character/baby_chicken.png',
    name: 'Bay Chicken',
    description: 'Strong Guide',
    price: 200,
  ),
  CharacterModel(
    id: '5',
    imagePath: 'assets/character/boy.png',
    name: 'Boy',
    description: 'Strong Guide',
    price: 250,
  ),
  CharacterModel(
    id: '6',
    imagePath: 'assets/character/carrot_knight.png',
    name: 'Captain Carrot',
    description: 'Strong Guide',
    price: 300,
  ),
  CharacterModel(
    id: '7',
    imagePath: 'assets/character/choosa.png',
    name: 'Little Chicken',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '8',
    imagePath: 'assets/character/cute_rabbit.png',
    name: 'Rabbit',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '9',
    imagePath: 'assets/character/duck.png',
    name: 'Duck',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '10',
    imagePath: 'assets/character/goofy1.png',
    name: 'Goofy',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '11',
    imagePath: 'assets/character/little_monster.png',
    name: 'Little Monster',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '12',
    imagePath: 'assets/character/micky_mouse.png',
    name: 'Micky Mouse',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '13',
    imagePath: 'assets/character/minion.png',
    name: 'Minion',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '14',
    imagePath: 'assets/character/pink_panther.png',
    name: 'Pink Panther',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '15',
    imagePath: 'assets/character/popaye.png',
    name: 'Popaye',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '16',
    imagePath: 'assets/character/shiva.png',
    name: 'Shiva',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '17',
    imagePath: 'assets/character/tom_jerry.png',
    name: 'Singham',
    description: 'Strong Guide',
    price: 350,
  ),
  CharacterModel(
    id: '18',
    imagePath: 'assets/character/wonder_tiger.png',
    name: 'Little Tiger',
    description: 'Strong Guide',
    price: 350,
  ),
];

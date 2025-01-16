class ShapesModel {
  ShapesModel({required this.name, required this.description, required this.imagePath});

  factory ShapesModel.fromJson(Map<String, String> json) {
    return ShapesModel(
      name: json['name']!,
      description: json['description']!,
      imagePath: json['image']!,
    );
  }

  final String name;
  final String description;
  final String imagePath;
}

final List<ShapesModel> shapeModels = List.generate(
  shapesModel.length,
  (index) => ShapesModel.fromJson(shapesModel[index]),
);
final List<Map<String, String>> shapesModel = [
  {
    'name': 'Circle',
    'image': 'assets/shapes/circle.png',
    'description': 'Round shape with no corners or edges.',
  },
  {
    'name': 'Square',
    'image': 'assets/shapes/square.png',
    'description': 'Four equal sides and four right angles.',
  },
  {
    'name': 'Triangle',
    'image': 'assets/shapes/triangle.png',
    'description': 'Three sides and three corners.',
  },
  {
    'name': 'Oval',
    'image': 'assets/shapes/oval.png',
    'description': 'Elongated circle, also called an ellipse.',
  },
  {
    'name': 'heart',
    'image': 'assets/shapes/heart.png',
    'description': 'A common shape associated with love, curved on top with a pointed bottom.',
  },
  {
    'name': 'Star',
    'image': 'assets/shapes/star.png',
    'description': 'A shape with points, often with five or more arms.',
  }
];

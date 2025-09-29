import 'dart:math';

List<Map<String, dynamic>> mathQuestions = [
  // Addition Questions
  {
    'question': '2 + 3',
    'answer': '5',
    'type': 'addition',
    'options': ['5', '6', '4', '7'],
  },
  {
    'question': '4 + 5',
    'answer': '9',
    'type': 'addition',
    'options': ['9', '8', '7', '10'],
  },
  {
    'question': '1 + 6',
    'answer': '7',
    'type': 'addition',
    'options': ['7', '8', '6', '5'],
  },

  // Subtraction Questions
  {
    'question': '9 - 4',
    'answer': '5',
    'type': 'subtraction',
    'options': ['5', '4', '6', '3'],
  },
  {
    'question': '7 - 3',
    'answer': '4',
    'type': 'subtraction',
    'options': ['4', '5', '3', '6'],
  },
  {
    'question': '8 - 5',
    'answer': '3',
    'type': 'subtraction',
    'options': ['3', '4', '2', '5'],
  },

  // Multiplication Questions
  {
    'question': '2 × 3',
    'answer': '6',
    'type': 'multiplication',
    'options': ['6', '5', '7', '4'],
  },
  {
    'question': '3 × 3',
    'answer': '9',
    'type': 'multiplication',
    'options': ['9', '6', '12', '8'],
  },
  {
    'question': '4 × 2',
    'answer': '8',
    'type': 'multiplication',
    'options': ['8', '6', '10', '7'],
  },

  // Division Questions (only including divisions that result in whole numbers)
  {
    'question': '8 ÷ 2',
    'answer': '4',
    'type': 'division',
    'options': ['4', '3', '5', '2'],
  },
  {
    'question': '6 ÷ 2',
    'answer': '3',
    'type': 'division',
    'options': ['3', '4', '2', '5'],
  },
  {
    'question': '9 ÷ 3',
    'answer': '3',
    'type': 'division',
    'options': ['3', '4', '2', '5'],
  },

  // More Addition
  {
    'question': '3 + 4',
    'answer': '7',
    'type': 'addition',
    'options': ['7', '6', '8', '5'],
  },
  {
    'question': '2 + 6',
    'answer': '8',
    'type': 'addition',
    'options': ['8', '7', '9', '6'],
  },

  // More Subtraction
  {
    'question': '6 - 2',
    'answer': '4',
    'type': 'subtraction',
    'options': ['4', '3', '5', '2'],
  },
  {
    'question': '5 - 3',
    'answer': '2',
    'type': 'subtraction',
    'options': ['2', '3', '1', '4'],
  },

  // More Multiplication
  {
    'question': '2 × 4',
    'answer': '8',
    'type': 'multiplication',
    'options': ['8', '6', '10', '7'],
  },
  {
    'question': '3 × 2',
    'answer': '6',
    'type': 'multiplication',
    'options': ['6', '8', '4', '5'],
  },

  // More Division
  {
    'question': '4 ÷ 2',
    'answer': '2',
    'type': 'division',
    'options': ['2', '3', '1', '4'],
  },
  {
    'question': '8 ÷ 4',
    'answer': '2',
    'type': 'division',
    'options': ['2', '3', '4', '1'],
  },
];

// Function to get random questions
List<Map<String, dynamic>> getRandomQuestions(int count) {
  final random = Random();
  final questions = List<Map<String, dynamic>>.from(mathQuestions)..shuffle(random);
  return questions.take(count).toList();
}

// Function to get questions by type
List<Map<String, dynamic>> getQuestionsByType(String type, int count) {
  final random = Random();
  final typeQuestions = mathQuestions.where((q) => q['type'] == type).toList()..shuffle(random);
  return typeQuestions.take(count).toList();
}

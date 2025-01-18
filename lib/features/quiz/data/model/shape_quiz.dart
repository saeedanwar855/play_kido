List<Map<String, dynamic>> shapesQuiz = [
  {
    'type': 'recognition',
    'questionType': 'Which shape is this?',
    'question': 'assets/shapes/circle.png',
    'answer': 'Circle',
    'options': ['Circle', 'Square', 'Triangle', 'Oval'],
  },
  {
    'type': 'recognition',
    'questionType': 'Which shape is this?',
    'question': 'assets/shapes/square.png',
    'answer': 'Square',
    'options': ['Circle', 'Square', 'Triangle', 'Star'],
  },

  // Description Matching Questions
  {
    'type': 'description_matching',
    'questionType': 'Which shape has no corners?',
    'answer': 'Circle',
    'options': ['Circle', 'Square', 'Triangle', 'Heart'],
  },
  {
    'type': 'description_matching',
    'questionType': 'Which shape has four equal sides?',
    'answer': 'Square',
    'options': ['Circle', 'Oval', 'Square', 'Star'],
  },

  // Shape Counting Questions
  {
    'type': 'counting',
    'questionType': 'How many sides does a Triangle have?',
    'answer': '3',
    'options': ['2', '3', '4', '5'],
  },
  {
    'type': 'counting',
    'questionType': 'How many corners does a Star typically have?',
    'answer': '5',
    'options': ['3', '4', '5', '6'],
  },

  // Functionality Questions
  {
    'type': 'functionality',
    'questionType': 'Which shape is often used for stop signs?',
    'answer': 'Square',
    'options': ['Circle', 'Triangle', 'Square', 'Heart'],
  },
  {
    'type': 'functionality',
    'questionType': 'Which shape is commonly used in stars and decorations?',
    'answer': 'Star',
    'options': ['Triangle', 'Oval', 'Square', 'Star'],
  },
];

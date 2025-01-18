import 'dart:math';

import 'package:flutter/material.dart';

List<Map<String, dynamic>> alphabetQuestions = [
  // Capital Letters Recognition
  {
    'type': 'recognition',
    'questionType': 'Choose the letter',
    'question': 'assets/plain_alphabet/a.png',
    'answer': 'A',
    'options': ['A', 'B', 'C', 'D'],
    'audio': 'assets/alphabit_audio_sounds/a_Letter.mp3',
  },
  {
    'type': 'recognition',
    'questionType': 'Choose the letter',
    'question': 'assets/plain_alphabet/b.png',
    'answer': 'B',
    'options': ['B', 'D', 'P', 'R'],
    'audio': 'assets/alphabit_audio_sounds/b_Letter.mp3',
  },

  // Letter Sound Matching
  {
    'type': 'sound_matching',
    'questionType': 'Which letter makes this sound?',
    'question': 'assets/alphabit_audio_sounds/c_Letter.mp3',
    'answer': 'C',
    'options': ['C', 'K', 'G', 'Q'],
    'visual': 'assets/plain_alphabet/c.png',
  },

  // Starting Letter
  {
    'type': 'starting_letter',
    'questionType': 'What letter does this word start with?',
    'question': 'assets/phonics_things/d_dog.png',
    'answer': 'D',
    'options': ['D', 'B', 'P', 'T'],
    'audio': 'assets/alphabit_audio_sounds/d_Letter.mp3',
  },

  // Letter Sequence
  {
    'type': 'sequence',
    'questionType': 'What comes next?',
    'question': 'A B C _',
    'answer': 'D',
    'options': ['D', 'E', 'F', 'G'],
    'audio': 'assets/alphabit_audio_sounds/d_Letter.mp3',
  },

  // Missing Letter
  {
    'type': 'missing_letter',
    'questionType': 'Fill in the missing letter',
    'question': '_ A T',
    'answer': 'C',
    'options': ['C', 'B', 'R', 'H'],
    'image': 'assets/phonics_things/c_cat.png',
    'audio': 'assets/alphabit_audio_sounds/c_Letter.mp3',
  },

  // Example of complete question set for each letter:
  {
    'letter': 'A',
    'questions': [
      {
        'type': 'recognition',
        'questionType': 'Choose the letter',
        'question': 'assets/plain_alphabet/a.png',
        'answer': 'A',
        'options': ['A', 'B', 'C', 'D'],
        'audio': 'assets/alphabit_audio_sounds/a_Letter.mp3',
      },
      {
        'type': 'sound_matching',
        'questionType': 'What makes this sound?',
        'question': 'assets/alphabit_audio_sounds/a_Letter.mp3',
        'answer': 'A',
        'options': ['A', 'E', 'I', 'O'],
        'visual': 'assets/plain_alphabet/a.png',
      },
      {
        'type': 'starting_letter',
        'questionType': 'What letter does this start with?',
        'question': 'assets/phonics_things/a_ant.png',
        'answer': 'A',
        'options': ['A', 'B', 'C', 'D'],
        'word': 'ANT',
      },
      {
        'type': 'word_building',
        'questionType': 'Complete the word',
        'question': '_ N T',
        'answer': 'A',
        'options': ['A', 'E', 'I', 'O'],
        'image': 'assets/phonics_things/a_ant.png',
      }
    ],
  }
];

// Question selection functions
List<Map<String, dynamic>> getQuestionsByLevel(String level) {
  // Implementation to get questions based on difficulty level
  return [];
}

List<Map<String, dynamic>> getRandomAlphabetQuestions(int count) {
  final random = Random();
  final questions = List<Map<String, dynamic>>.from(alphabetQuestions)..shuffle(random);
  return questions.take(count).toList();
}

// UI Constants for consistent design
const Map<String, dynamic> questionStyles = {
  'backgroundColor': Color(0xFFF9E6D6),
  'buttonColor': Color(0xFFEF3349),
  'buttonShadow': Color(0xFFD92036),
  'textColor': Color(0xFF4A7B5F),
  'fontSize': 24.0,
  'spacing': 20.0,
};
List<Map<String, dynamic>> alphabetQuiz = [
  // Group A-E
  {
    'letters': 'A-E',
    'questions': [
      {
        'type': 'recognition',
        'questionType': 'Choose the letter',
        'question': 'assets/plain_alphabet/a.png',
        'answer': 'A',
        'options': ['A', 'B', 'C', 'D'],
        'audio': 'assets/alphabit_audio_sounds/a_Letter.mp3',
      },
      {
        'type': 'sound_matching',
        'questionType': 'Which letter makes this sound?',
        'question': 'assets/alphabit_audio_sounds/b_Letter.mp3',
        'answer': 'B',
        'options': ['B', 'D', 'P', 'R'],
        'visual': 'assets/plain_alphabet/b.png',
      },
      {
        'type': 'starting_letter',
        'questionType': 'What letter does this word start with?',
        'question': 'assets/phonics_things/c_cat.png',
        'answer': 'C',
        'options': ['C', 'B', 'P', 'T'],
        'audio': 'assets/alphabit_audio_sounds/c_Letter.mp3',
      },
      {
        'type': 'sequence',
        'questionType': 'What comes next?',
        'question': 'A B C D _',
        'answer': 'E',
        'options': ['E', 'F', 'G', 'H'],
        'audio': 'assets/alphabit_audio_sounds/e_Letter.mp3',
      }
    ],
  },

  // Group F-J
  {
    'letters': 'F-J',
    'questions': [
      {
        'type': 'recognition',
        'questionType': 'Choose the letter',
        'question': 'assets/plain_alphabet/f.png',
        'answer': 'F',
        'options': ['F', 'G', 'H', 'I'],
        'audio': 'assets/alphabit_audio_sounds/f_Letter.mp3',
      },
      {
        'type': 'sound_matching',
        'questionType': 'Which letter makes this sound?',
        'question': 'assets/alphabit_audio_sounds/g_Letter.mp3',
        'answer': 'G',
        'options': ['G', 'J', 'K', 'L'],
        'visual': 'assets/plain_alphabet/g.png',
      },
      {
        'type': 'starting_letter',
        'questionType': 'What letter does this word start with?',
        'question': 'assets/phonics_things/h_hat.png',
        'answer': 'H',
        'options': ['H', 'B', 'P', 'T'],
        'audio': 'assets/alphabit_audio_sounds/h_Letter.mp3',
      },
      {
        'type': 'sequence',
        'questionType': 'What comes next?',
        'question': 'F G H I _',
        'answer': 'J',
        'options': ['J', 'K', 'L', 'M'],
        'audio': 'assets/alphabit_audio_sounds/j_Letter.mp3',
      }
    ],
  },

  // Group K-O
  {
    'letters': 'K-O',
    'questions': [
      {
        'type': 'recognition',
        'questionType': 'Choose the letter',
        'question': 'assets/plain_alphabet/k.png',
        'answer': 'K',
        'options': ['K', 'L', 'M', 'N'],
        'audio': 'assets/alphabit_audio_sounds/k_Letter.mp3',
      },
      {
        'type': 'sequence',
        'questionType': 'What comes next?',
        'question': 'K L M N _',
        'answer': 'O',
        'options': ['O', 'P', 'Q', 'R'],
        'audio': 'assets/alphabit_audio_sounds/o_Letter.mp3',
      }
    ],
  },

  // Group P-T
  {
    'letters': 'P-T',
    'questions': [
      {
        'type': 'recognition',
        'questionType': 'Choose the letter',
        'question': 'assets/plain_alphabet/p.png',
        'answer': 'P',
        'options': ['P', 'Q', 'R', 'S'],
        'audio': 'assets/alphabit_audio_sounds/p_Letter.mp3',
      }
    ],
  },

  // Group U-Z
  {
    'letters': 'U-Z',
    'questions': [
      {
        'type': 'sequence',
        'questionType': 'What comes next?',
        'question': 'U V W X _',
        'answer': 'Y',
        'options': ['Y', 'Z', 'A', 'B'],
        'audio': 'assets/alphabit_audio_sounds/y_Letter.mp3',
      }
    ],
  }
];

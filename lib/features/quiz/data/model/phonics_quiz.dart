import 'dart:math';

List<Map<String, dynamic>> quizQuestions = [
  // A words
  {
    'word': 'ANT',
    'image': 'assets/phonics_things/a_ant.png',
    'sound': 'alphabit_audio_sounds/a_Letter.mp3',
    'options': ['A', 'N', 'T', 'S', 'R', 'E'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'ALLIGATOR',
    'image': 'assets/phonics_things/a_aligator.png',
    'sound': 'alphabit_audio_sounds/a_Letter.mp3',
    'options': ['A', 'L', 'I', 'G', 'T', 'R', 'O'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'ASTRONAUT',
    'image': 'assets/phonics_things/a_astronaut.png',
    'sound': 'alphabit_audio_sounds/a_Letter.mp3',
    'options': ['A', 'S', 'T', 'R', 'O', 'N', 'U'],
    'start_time': 12,
    'end_time': 16,
  },

  // B words
  {
    'word': 'BALL',
    'image': 'assets/phonics_things/b_ball.png',
    'sound': 'alphabit_audio_sounds/b_Letter.mp3',
    'options': ['B', 'A', 'L', 'P', 'T', 'R'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'BALLOON',
    'image': 'assets/phonics_things/b_baloon.png',
    'sound': 'alphabit_audio_sounds/b_Letter.mp3',
    'options': ['B', 'A', 'L', 'O', 'N', 'R'],
    'start_time': 13,
    'end_time': 16,
  },

  // C words
  {
    'word': 'CAT',
    'image': 'assets/phonics_things/c_cat.png',
    'sound': 'alphabit_audio_sounds/c_Letter.mp3',
    'options': ['C', 'A', 'T', 'P', 'S', 'R'],
    'start_time': 01,
    'end_time': 07,
  },
  {
    'word': 'CARROT',
    'image': 'assets/phonics_things/c_carrot.png',
    'sound': 'alphabit_audio_sounds/c_Letter.mp3',
    'options': ['C', 'A', 'R', 'O', 'T', 'P'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'CAP',
    'image': 'assets/phonics_things/c_cap.png',
    'sound': 'alphabit_audio_sounds/c_Letter.mp3',
    'options': ['C', 'A', 'P', 'T', 'R', 'S'],
    'start_time': 13,
    'end_time': 16,
  },

  // D words
  {
    'word': 'DOG',
    'image': 'assets/phonics_things/d_dog.png',
    'sound': 'alphabit_audio_sounds/d_Letter.mp3',
    'options': ['D', 'O', 'G', 'P', 'T', 'F'],
    'start_time': 01,
    'end_time': 07,
  },
  {
    'word': 'DUCK',
    'image': 'assets/phonics_things/d_duck.png',
    'sound': 'alphabit_audio_sounds/d_Letter.mp3',
    'options': ['D', 'U', 'C', 'K', 'T', 'R'],
    'start_time': 08,
    'end_time': 11,
  },

  // E words
  {
    'word': 'ELEPHANT',
    'image': 'assets/phonics_things/e_elephant.png',
    'sound': 'alphabit_audio_sounds/e_Letter.mp3',
    'options': ['E', 'L', 'P', 'H', 'A', 'N', 'T'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'ELF',
    'image': 'assets/phonics_things/e_elf.png',
    'sound': 'alphabit_audio_sounds/e_Letter.mp3',
    'options': ['E', 'L', 'F', 'P', 'T', 'R'],
    'start_time': 09,
    'end_time': 12,
  },

  // F words
  {
    'word': 'FISH',
    'image': 'assets/phonics_things/f_fish.png',
    'sound': 'alphabit_audio_sounds/f_Letter.mp3',
    'options': ['F', 'I', 'S', 'H', 'T', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'FLOWER',
    'image': 'assets/phonics_things/f_flower.png',
    'sound': 'alphabit_audio_sounds/f_Letter.mp3',
    'options': ['F', 'L', 'O', 'W', 'E', 'R'],
    'start_time': 09,
    'end_time': 13,
  },

  // G words
  {
    'word': 'GOAT',
    'image': 'assets/phonics_things/g_goat.png',
    'sound': 'alphabit_audio_sounds/g_Letter.mp3',
    'options': ['G', 'O', 'A', 'T', 'P', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'GUITAR',
    'image': 'assets/phonics_things/g_guitor.png',
    'sound': 'alphabit_audio_sounds/g_Letter.mp3',
    'options': ['G', 'U', 'I', 'T', 'A', 'R'],
    'start_time': 09,
    'end_time': 12,
  },

  // H words
  {
    'word': 'HAT',
    'image': 'assets/phonics_things/h_hat.png',
    'sound': 'alphabit_audio_sounds/h_Letter.mp3',
    'options': ['H', 'A', 'T', 'P', 'S', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'HORSE',
    'image': 'assets/phonics_things/h_horse.png',
    'sound': 'alphabit_audio_sounds/h_Letter.mp3',
    'options': ['H', 'O', 'R', 'S', 'E', 'T'],
    'start_time': 09,
    'end_time': 13,
  },
  {
    'word': 'HAND',
    'image': 'assets/phonics_things/h_hand.png',
    'sound': 'alphabit_audio_sounds/h_Letter.mp3',
    'options': ['H', 'A', 'N', 'D', 'T', 'R'],
    'start_time': 14,
    'end_time': 17,
  },

  // I words
  {
    'word': 'IGUANA',
    'image': 'assets/phonics_things/i_iguana.png',
    'sound': 'alphabit_audio_sounds/i_Letter.mp3',
    'options': ['I', 'G', 'U', 'A', 'N', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'IGLOO',
    'image': 'assets/phonics_things/i_igloo.png',
    'sound': 'alphabit_audio_sounds/i_Letter.mp3',
    'options': ['I', 'G', 'L', 'O', 'U', 'R'],
    'start_time': 09,
    'end_time': 12,
  },

  // J words
  {
    'word': 'JACKET',
    'image': 'assets/phonics_things/j_jacket.png',
    'sound': 'alphabit_audio_sounds/j_Letter.mp3',
    'options': ['J', 'A', 'C', 'K', 'E', 'T'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'JEEP',
    'image': 'assets/phonics_things/j_jeep.png',
    'sound': 'alphabit_audio_sounds/j_Letter.mp3',
    'options': ['J', 'E', 'P', 'T', 'R', 'S'],
    'start_time': 09,
    'end_time': 13,
  },
  {
    'word': 'JAM',
    'image': 'assets/phonics_things/j_jam.png',
    'sound': 'alphabit_audio_sounds/j_Letter.mp3',
    'options': ['J', 'A', 'M', 'P', 'T', 'R'],
    'start_time': 14,
    'end_time': 17,
  },

  // Continue with K through Z...
  // K words
  {
    'word': 'KANGAROO',
    'image': 'assets/phonics_things/k_kangaroo.png',
    'sound': 'alphabit_audio_sounds/k_Letter.mp3',
    'options': ['K', 'A', 'N', 'G', 'R', 'O'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'KITTEN',
    'image': 'assets/phonics_things/k_kitten.png',
    'sound': 'alphabit_audio_sounds/k_Letter.mp3',
    'options': ['K', 'I', 'T', 'E', 'N', 'R'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'KICK',
    'image': 'assets/phonics_things/k_kick.png',
    'sound': 'alphabit_audio_sounds/k_Letter.mp3',
    'options': ['K', 'I', 'C', 'P', 'T', 'R'],
    'start_time': 13,
    'end_time': 17,
  },
// L words
  {
    'word': 'LEMON',
    'image': 'assets/phonics_things/l_lemon.png',
    'sound': 'alphabit_audio_sounds/l_Letter.mp3',
    'options': ['L', 'E', 'M', 'O', 'N', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'LAMP',
    'image': 'assets/phonics_things/l_lamp.png',
    'sound': 'alphabit_audio_sounds/l_Letter.mp3',
    'options': ['L', 'A', 'M', 'P', 'T', 'R'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'LION',
    'image': 'assets/phonics_things/l_lion.png',
    'options': ['L', 'I', 'O', 'N', 'T', 'R'],
    'sound': 'alphabit_audio_sounds/l_Letter.mp3',
    'start_time': 13,
    'end_time': 17,
  },

  // M words
  {
    'word': 'MOON',
    'image': 'assets/phonics_things/m_moon.png',
    'sound': 'alphabit_audio_sounds/m_Letter.mp3',
    'options': ['M', 'O', 'N', 'P', 'T', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'MOUSE',
    'image': 'assets/phonics_things/m_mouse.png',
    'sound': 'alphabit_audio_sounds/m_Letter.mp3',
    'options': ['M', 'O', 'U', 'S', 'E', 'R'],
    'start_time': 09,
    'end_time': 12,
  },

  // N words
  {
    'word': 'NEST',
    'image': 'assets/phonics_things/n_nest.png',
    'sound': 'alphabit_audio_sounds/n_Letter.mp3',
    'options': ['N', 'E', 'S', 'T', 'P', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'NUT',
    'image': 'assets/phonics_things/n_nuts.png',
    'sound': 'alphabit_audio_sounds/n_Letter.mp3',
    'options': ['N', 'U', 'T', 'P', 'S', 'R'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'NOSE',
    'image': 'assets/phonics_things/n_nose.png',
    'sound': 'alphabit_audio_sounds/n_Letter.mp3',
    'options': ['N', 'O', 'S', 'E', 'T', 'R'],
    'start_time': 13,
    'end_time': 17,
  },

  // O words
  {
    'word': 'OX',
    'image': 'assets/phonics_things/o_ox.png',
    'sound': 'alphabit_audio_sounds/o_Letter.mp3',
    'options': ['O', 'X', 'P', 'T', 'R', 'S'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'OCTOPUS',
    'image': 'assets/phonics_things/o_octupus.png',
    'sound': 'alphabit_audio_sounds/o_Letter.mp3',
    'options': ['O', 'C', 'T', 'P', 'U', 'S'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'ORDER',
    'image': 'assets/phonics_things/o_order.png',
    'sound': 'alphabit_audio_sounds/o_Letter.mp3',
    'options': ['O', 'R', 'D', 'E', 'T', 'S'],
    'start_time': 13,
    'end_time': 17,
  },

  // P words
  {
    'word': 'PANDA',
    'image': 'assets/phonics_things/p_panda.png',
    'sound': 'alphabit_audio_sounds/p_Letter.mp3',
    'options': ['P', 'A', 'N', 'D', 'T', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'PENCIL',
    'image': 'assets/phonics_things/p_pincel.png',
    'sound': 'alphabit_audio_sounds/p_Letter.mp3',
    'options': ['P', 'E', 'N', 'C', 'I', 'L'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'PEAR',
    'image': 'assets/phonics_things/p_pear.png',
    'sound': 'alphabit_audio_sounds/p_Letter.mp3',
    'options': ['P', 'E', 'A', 'R', 'T', 'S'],
    'start_time': 13,
    'end_time': 16,
  },

  // Q words
  {
    'word': 'QUEEN',
    'image': 'assets/phonics_things/q_queen.png',
    'sound': 'alphabit_audio_sounds/q_Letter.mp3',
    'options': ['Q', 'U', 'E', 'N', 'T', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'QUAIL',
    'image': 'assets/phonics_things/q_quail.png',
    'sound': 'alphabit_audio_sounds/q_Letter.mp3',
    'options': ['Q', 'U', 'A', 'I', 'L', 'T'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'QUESTION',
    'image': 'assets/phonics_things/q_question.png',
    'sound': 'alphabit_audio_sounds/q_Letter.mp3',
    'options': ['Q', 'U', 'E', 'S', 'T', 'N'],
    'start_time': 13,
    'end_time': 16,
  },

  // R words
  {
    'word': 'ROSE',
    'image': 'assets/phonics_things/r_rose.png',
    'sound': 'alphabit_audio_sounds/r_Letter.mp3',
    'options': ['R', 'O', 'S', 'E', 'T', 'P'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'RABBIT',
    'image': 'assets/phonics_things/r_rabbit.png',
    'sound': 'alphabit_audio_sounds/r_Letter.mp3',
    'options': ['R', 'A', 'B', 'I', 'T', 'P'],
    'start_time': 09,
    'end_time': 12,
  },

  // S words
  {
    'word': 'SEAL',
    'image': 'assets/phonics_things/s_seal.png',
    'sound': 'alphabit_audio_sounds/s_Letter.mp3',
    'options': ['S', 'E', 'A', 'L', 'T', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'SUN',
    'image': 'assets/phonics_things/s_sun.png',
    'sound': 'alphabit_audio_sounds/s_Letter.mp3',
    'options': ['S', 'U', 'N', 'P', 'T', 'R'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'SEAGULL',
    'image': 'assets/phonics_things/s_seagull.png',
    'sound': 'alphabit_audio_sounds/s_Letter.mp3',
    'options': ['S', 'E', 'A', 'G', 'U', 'L'],
    'start_time': 13,
    'end_time': 16,
  },

  // T words
  {
    'word': 'TIE',
    'image': 'assets/phonics_things/t_tie.png',
    'sound': 'alphabit_audio_sounds/t_Letter.mp3',
    'options': ['T', 'I', 'E', 'P', 'S', 'R'],
    'start_time': 01,
    'end_time': 07,
  },
  {
    'word': 'TURTLE',
    'image': 'assets/phonics_things/t_turtle.png',
    'sound': 'alphabit_audio_sounds/t_Letter.mp3',
    'options': ['T', 'U', 'R', 'L', 'E', 'P'],
    'start_time': 08,
    'end_time': 12,
  },
  {
    'word': 'TEDDY',
    'image': 'assets/phonics_things/t_teddy.png',
    'sound': 'alphabit_audio_sounds/t_Letter.mp3',
    'options': ['T', 'E', 'D', 'Y', 'P', 'R'],
    'start_time': 13,
    'end_time': 15,
  },

  // U words
  {
    'word': 'UMBRELLA',
    'image': 'assets/phonics_things/u_umbrilla.png',
    'sound': 'alphabit_audio_sounds/u_Letter.mp3',
    'options': ['U', 'M', 'B', 'R', 'L', 'A'],
    'start_time': 01,
    'end_time': 07,
  },
  {
    'word': 'UNDER',
    'image': 'assets/phonics_things/u_under.png',
    'sound': 'alphabit_audio_sounds/u_Letter.mp3',
    'options': ['U', 'N', 'D', 'E', 'R', 'T'],
    'start_time': 08,
    'end_time': 12,
  },

  // V words
  {
    'word': 'VAN',
    'image': 'assets/phonics_things/v_van.png',
    'sound': 'alphabit_audio_sounds/v_Letter.mp3',
    'options': ['V', 'A', 'N', 'P', 'T', 'R'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'VET',
    'image': 'assets/phonics_things/v_vet.png',
    'sound': 'alphabit_audio_sounds/v_Letter.mp3',
    'options': ['V', 'E', 'T', 'P', 'S', 'R'],
    'start_time': 09,
    'end_time': 12,
  },

  // W words
  {
    'word': 'WORM',
    'image': 'assets/phonics_things/w_wornm.png',
    'sound': 'alphabit_audio_sounds/w_Letter.mp3',
    'options': ['W', 'O', 'R', 'M', 'T', 'P'],
    'start_time': 01,
    'end_time': 07,
  },
  {
    'word': 'WIG',
    'image': 'assets/phonics_things/w_wig.png',
    'sound': 'alphabit_audio_sounds/w_Letter.mp3',
    'options': ['W', 'I', 'G', 'P', 'T', 'R'],
    'start_time': 08,
    'end_time': 11,
  },
  {
    'word': 'WOLF',
    'image': 'assets/phonics_things/w_wolf.png',
    'sound': 'alphabit_audio_sounds/w_Letter.mp3',
    'options': ['W', 'O', 'L', 'F', 'T', 'R'],
    'start_time': 12,
    'end_time': 14,
  },

  // X words
  {
    'word': 'XRAY',
    'image': 'assets/phonics_things/x_ray.png',
    'sound': 'alphabit_audio_sounds/x_Letter.mp3',
    'options': ['X', 'R', 'A', 'Y', 'T', 'P'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'FOX',
    'image': 'assets/phonics_things/x_fox.png',
    'sound': 'alphabit_audio_sounds/x_Letter.mp3',
    'options': ['F', 'O', 'X', 'P', 'T', 'R'],
    'start_time': 09,
    'end_time': 12,
  },

  // Y words
  {
    'word': 'YOYO',
    'image': 'assets/phonics_things/y_yoyo.png',
    'sound': 'alphabit_audio_sounds/y_Letter.mp3',
    'options': ['Y', 'O', 'P', 'T', 'R', 'S'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'YAK',
    'image': 'assets/phonics_things/y_yak.png',
    'sound': 'alphabit_audio_sounds/y_Letter.mp3',
    'options': ['Y', 'A', 'K', 'P', 'T', 'R'],
    'start_time': 09,
    'end_time': 12,
  },
  {
    'word': 'YACHT',
    'image': 'assets/phonics_things/y_yacht.png',
    'sound': 'alphabit_audio_sounds/y_Letter.mp3',
    'options': ['Y', 'A', 'C', 'H', 'T', 'R'],
    'start_time': 13,
    'end_time': 16,
  },

  // Z words
  {
    'word': 'ZEBRA',
    'image': 'assets/phonics_things/z_zebra.png',
    'sound': 'alphabit_audio_sounds/z_Letter.mp3',
    'options': ['Z', 'E', 'B', 'R', 'A', 'T'],
    'start_time': 01,
    'end_time': 08,
  },
  {
    'word': 'ZIPPER',
    'image': 'assets/phonics_things/z_zip.png',
    'sound': 'alphabit_audio_sounds/z_Letter.mp3',
    'options': ['Z', 'Y', 'I', 'P', 'E', 'R', 'T'],
    'start_time': 09,
    'end_time': 12,
  },
];

class QuizQuestionModel {
  QuizQuestionModel({
    required this.word,
    required this.image,
    required this.options,
    required this.sound,
    required this.startTime,
    required this.endTime,
  });

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    return QuizQuestionModel(
      word: json['word'] as String,
      image: json['image'] as String,
      sound: json['sound'] as String,
      startTime: json['start_time'] as int,
      endTime: json['end_time'] as int,
      options: List<String>.from(json['options'] as List<String>),
    );
  }
  final String word;
  final String image;
  final String sound;
  final int startTime;
  final int endTime;
  final List<String> options;
}

List<QuizQuestionModel> getRandomQuestions(int count) {
  final random = Random();
  final questions = List<QuizQuestionModel>.from(quizQuestions.map(QuizQuestionModel.fromJson))
    ..shuffle(random);
  return questions.take(count).toList();
}

List<QuizQuestionModel> quizQuestios =
    List<QuizQuestionModel>.from(quizQuestions.map(QuizQuestionModel.fromJson));

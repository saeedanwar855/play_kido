// ignore_for_file: public_member_api_docs, sort_constructors_first

class AlphabitsSoundsModel {
  String alphabit;
  String alphabitSound;

  AlphabitsSoundsModel({
    required this.alphabit,
    required this.alphabitSound,
  });
}

List<String> letterSounds = [
  'assets/audio_alphabet/A.wav',
  'assets/audio_alphabet/B.wav',
  'assets/audio_alphabet/C.wav',
  'assets/audio_alphabet/D.wav',
  'assets/audio_alphabet/E.wav',
  'assets/audio_alphabet/F.wav',
  'assets/audio_alphabet/G.wav',
  'assets/audio_alphabet/H.wav',
  'assets/audio_alphabet/I.wav',
  'assets/audio_alphabet/J.wav',
  'assets/audio_alphabet/K.wav',
  'assets/audio_alphabet/L.wav',
  'assets/audio_alphabet/M.wav',
  'assets/audio_alphabet/N.wav',
  'assets/audio_alphabet/O.wav',
  'assets/audio_alphabet/P.wav',
  'assets/audio_alphabet/Q.wav',
  'assets/audio_alphabet/R.wav',
  'assets/audio_alphabet/S.wav',
  'assets/audio_alphabet/T.wav',
  'assets/audio_alphabet/U.wav',
  'assets/audio_alphabet/V.wav',
  'assets/audio_alphabet/W.wav',
  'assets/audio_alphabet/X.wav',
  'assets/audio_alphabet/Y.wav',
  'assets/audio_alphabet/Z.wav',
];

List<String> alphabit = [
  'assets/letters/a.png',
  'assets/letters/b.png',
  'assets/letters/c.png',
  'assets/letters/d.png',
  'assets/letters/e.png',
  'assets/letters/f.png',
  'assets/letters/g.png',
  'assets/letters/h.png',
  'assets/letters/i.png',
  'assets/letters/j.png',
  'assets/letters/k.png',
  'assets/letters/l.png',
  'assets/letters/m.png',
  'assets/letters/n.png',
  'assets/letters/o.png',
  'assets/letters/p.png',
  'assets/letters/q.png',
  'assets/letters/r.png',
  'assets/letters/s.png',
  'assets/letters/t.png',
  'assets/letters/u.png',
  'assets/letters/v.png',
  'assets/letters/w.png',
  'assets/letters/x.png',
  'assets/letters/y.png',
  'assets/letters/z.png',
];

List<AlphabitsSoundsModel> alphabitModel = List.generate(
  alphabit.length,
  (index) => AlphabitsSoundsModel(
    alphabit: alphabit[index],
    alphabitSound: letterSounds[index],
  ),
);

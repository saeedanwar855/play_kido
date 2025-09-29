import 'package:audioplayers/audioplayers.dart';

class AudioPlayerExample {
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playAudioSegment(String audioPath, Duration startAt, Duration endAt) async {
    // Set the source of the audio
    await audioPlayer.setSource(AssetSource(audioPath));

    // Set the start position
    await audioPlayer.seek(startAt);

    // Start playing
    await audioPlayer.resume();

    // Listen to position changes to stop at desired point
    audioPlayer.onPositionChanged.listen((Duration position) {
      if (position >= endAt) {
        audioPlayer.stop();
      }
    });
  }
}

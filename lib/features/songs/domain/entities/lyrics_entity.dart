import 'package:equatable/equatable.dart';

class Lyrics extends Equatable {
  final int lyricsId;
  final String lyrics;

  const Lyrics({
    required this.lyrics,
    required this.lyricsId,
  });

  @override
  List<Object?> get props => [lyrics, lyricsId];
}

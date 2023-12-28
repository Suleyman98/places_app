import 'package:equatable/equatable.dart';
import 'package:new_flutter/features/songs/domain/entities/lyrics_entity.dart';
import 'package:new_flutter/features/songs/domain/entities/song_entity.dart';

abstract class SongState extends Equatable {}

class SongInitial extends SongState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SongsLoadedState extends SongState {
  final List<Song> songs;
  SongsLoadedState({
    required this.songs,
  });
  @override
  List<Object?> get props => [songs];
}

class SongLoadingState extends SongState {
  @override
  List<Object?> get props => [];
}

class SongLoadingFailure extends SongState {
  final String errorMsg;
  SongLoadingFailure({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}

class SongDetailsLoadedState extends SongState {
  final Song song;
  final Lyrics lyric;

  SongDetailsLoadedState({required this.song, required this.lyric});
  @override
  List<Object?> get props => [song, lyric];
}

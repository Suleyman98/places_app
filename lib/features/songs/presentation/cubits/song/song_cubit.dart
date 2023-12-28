import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter/core/error/failure.dart';
import 'package:new_flutter/core/usecases/usecase.dart';
import 'package:new_flutter/features/songs/domain/entities/lyrics_entity.dart';
import 'package:new_flutter/features/songs/domain/entities/song_entity.dart';
import 'package:new_flutter/features/songs/domain/usecases/get_lyric.dart';
import 'package:new_flutter/features/songs/domain/usecases/get_song.dart';
import 'package:new_flutter/features/songs/domain/usecases/get_songs.dart';
import 'package:new_flutter/features/songs/presentation/cubits/song/song_state.dart';

class SongCubit extends Cubit<SongState> {
  SongCubit(this.getLyrics, this.getSongs, this.getSong) : super(SongInitial());
  final GetLyricsUseCase getLyrics;
  final GetSongsUseCase getSongs;
  final GetSongUseCase getSong;

  String getStringByFailure(Failure failure) {
    if (failure is ServerFailure) {
      return "Server failure";
    } else if (failure is NoInternetConnectionFailure) {
      return "No Internet Connection!!!";
    } else {
      return "Unexpected Error";
    }
  }

  Future<void> _getSongs() async {
    emit(SongLoadingState());
    final result = await getSongs(NoParams());

    result.fold(
      (failure) => emit(
        SongLoadingFailure(errorMsg: getStringByFailure(failure)),
      ),
      (songs) {
        // songStorageRepository.setCurrentSongs(songs);
        emit(SongsLoadedState(songs: songs));
      },
    );
  }

  Future<void> _getDetails(int id) async {
    emit(SongLoadingState());
    Song? song;
    Lyrics? lyrics;

    final songResult = await getSong.call(SongParams(id: id));
    songResult.fold(
      (failure) {
        emit(SongLoadingFailure(errorMsg: getStringByFailure(failure)));
        return;
      },
      (s) => song = s,
    );

    final lyricResult = await getLyrics(Params(id: id));
    lyricResult.fold(
      (failure) {
        emit(SongLoadingFailure(errorMsg: getStringByFailure(failure)));
        return;
      },
      (l) => lyrics = l,
    );

    if (song != null && lyrics != null) {
      emit(SongDetailsLoadedState(song: song!, lyric: lyrics!));
    } else {
      emit(SongLoadingFailure(errorMsg: "Unexpected Error"));
    }
  }
}

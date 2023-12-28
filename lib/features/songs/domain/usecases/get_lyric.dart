import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_flutter/core/error/failure.dart';
import 'package:new_flutter/core/usecases/usecase.dart';
import 'package:new_flutter/features/songs/domain/entities/lyrics_entity.dart';
import 'package:new_flutter/features/songs/domain/repositories/song_repository.dart';

class GetLyricsUseCase extends UseCase<Lyrics, Params> {
  final SongRepository songRepository;

  GetLyricsUseCase({required this.songRepository});

  @override
  Future<Either<Failure, Lyrics>> call(Params params) async {
    return await songRepository.getLyrics(params.id);
  }
}

class Params extends Equatable {
  final int id;
  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_flutter/core/error/failure.dart';
import 'package:new_flutter/core/usecases/usecase.dart';
import 'package:new_flutter/features/songs/domain/entities/song_entity.dart';
import 'package:new_flutter/features/songs/domain/repositories/song_repository.dart';

class GetSongUseCase extends UseCase<Song, SongParams> {
  final SongRepository songRepository;

  GetSongUseCase({required this.songRepository});

  @override
  Future<Either<Failure, Song>> call(SongParams params) async {
    return await songRepository.getSong(params.id);
  }
}

class SongParams extends Equatable {
  final int id;
  const SongParams({required this.id});

  @override
  List<Object?> get props => [id];
}

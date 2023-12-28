import 'package:dartz/dartz.dart';
import 'package:new_flutter/core/error/failure.dart';
import 'package:new_flutter/core/usecases/usecase.dart';
import 'package:new_flutter/features/songs/domain/entities/song_entity.dart';
import 'package:new_flutter/features/songs/domain/repositories/song_repository.dart';

class GetSongsUseCase extends UseCase<List<Song>, NoParams> {
  final SongRepository songRepository;

  GetSongsUseCase({required this.songRepository});

  @override
  Future<Either<Failure, List<Song>>> call(NoParams params) async {
    return await songRepository.getSongs();
  }
}

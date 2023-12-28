import 'package:dartz/dartz.dart';
import 'package:new_flutter/core/error/exceptions.dart';
import 'package:new_flutter/core/error/failure.dart';
import 'package:new_flutter/core/network/network_info.dart';
import 'package:new_flutter/features/songs/data/data_sources/remote/song_remote_datasource.dart';
import 'package:new_flutter/features/songs/domain/entities/lyrics_entity.dart';
import 'package:new_flutter/features/songs/domain/entities/song_entity.dart';
import 'package:new_flutter/features/songs/domain/repositories/song_repository.dart';

class SongRepositoryImplementation extends SongRepository {
  final SongRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SongRepositoryImplementation({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Lyrics>> getLyrics(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final lyrics = await remoteDataSource.getLyrics(id);
        return right(lyrics);
      } on ServerException {
        return left(const ServerFailure());
      }
    } else {
      return left(const NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Song>> getSong(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final song = await remoteDataSource.getSong(id);
        return right(song);
      } on ServerException {
        return left(const ServerFailure());
      }
    } else {
      return left(const NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Song>>> getSongs() async {
    if (await networkInfo.isConnected) {
      try {
        final songs = await remoteDataSource.getSongs();
        return right(songs);
      } on ServerException {
        return left(const ServerFailure());
      }
    } else {
      return left(const NoInternetConnectionFailure());
    }
  }
}

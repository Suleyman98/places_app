

import 'package:dartz/dartz.dart';
import 'package:new_flutter/core/error/failure.dart';
import 'package:new_flutter/features/songs/domain/entities/lyrics_entity.dart';
import 'package:new_flutter/features/songs/domain/entities/song_entity.dart';

abstract class SongRepository {
  Future<Either<Failure, List<Song>>> getSongs();
  Future<Either<Failure, Lyrics>> getLyrics(int id);
  Future<Either<Failure, Song>> getSong(int id);
}
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:new_flutter/core/network/network_info.dart';
import 'package:new_flutter/features/songs/data/data_sources/remote/song_remote_datasource.dart';
import 'package:new_flutter/features/songs/data/repository/song_repository_implementation.dart';
import 'package:new_flutter/features/songs/domain/repositories/song_repository.dart';
import 'package:new_flutter/features/songs/domain/usecases/get_lyric.dart';
import 'package:new_flutter/features/songs/domain/usecases/get_song.dart';
import 'package:new_flutter/features/songs/domain/usecases/get_songs.dart';
import 'package:new_flutter/features/songs/presentation/cubits/song/song_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(
    () => SongCubit(
      locator(),
      locator(),
      locator(),
    ),
  );

  //! UseCases
  locator.registerLazySingleton(
    () => GetLyricsUseCase(songRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetSongsUseCase(songRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetSongUseCase(songRepository: locator()),
  );

  //! Repositories
  locator.registerLazySingleton<SongRepository>(
    () => SongRepositoryImplementation(
      networkInfo: locator(),
      remoteDataSource: locator(),
    ),
  );

  //! Data Source
  locator.registerLazySingleton<SongRemoteDataSource>(
    () => SongRemoteDataSourceImplementation(),
  );

  //! Core
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: locator()),
  );

  //! External Libraries
  locator.registerLazySingleton(() => Connectivity());
}

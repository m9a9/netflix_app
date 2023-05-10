import 'package:get_it/get_it.dart';
import 'package:netflix_app/Features/Movies/Data/Data%20Source/movies_remote_data_source.dart';
import 'package:netflix_app/Features/Movies/Data/Repository/movies_repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<MoviesRepository>(
      MoviesRepository(MoviesRemoteDataSource()));
}

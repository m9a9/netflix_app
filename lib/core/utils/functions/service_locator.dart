import 'package:get_it/get_it.dart';

import '../../../Features/Movies/Data/Data Source/movies_remote_data_source.dart';
import '../../../Features/Movies/Data/Repository/movies_repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<MoviesRepository>(
      MoviesRepository(MoviesRemoteDataSource()));
}

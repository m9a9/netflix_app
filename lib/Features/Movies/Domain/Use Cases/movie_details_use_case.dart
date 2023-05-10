import 'package:netflix_app/Features/Movies/Domain/Repository/base_movies_repository.dart';
import 'package:netflix_app/core/global/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/global/useCase/use_case.dart';

import '../Entities/movie_details_entity.dart';

class GetMoviesDetailsUseCase
    extends UseCase<MoviesDetailsEntity, MoviesDetailsParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesDetailsEntity>> call(
      [MoviesDetailsParameter? parameter]) async {
    return await baseMoviesRepository.getMoviesDetails(parameter!);
  }
}

class MoviesDetailsParameter {
  final int id;

  const MoviesDetailsParameter({required this.id});
}

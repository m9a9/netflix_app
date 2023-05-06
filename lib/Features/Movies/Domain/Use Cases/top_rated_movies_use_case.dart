import 'package:dartz/dartz.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Repository/base_movies_repository.dart';
import 'package:netflix_app/core/global/errors/failures.dart';
import 'package:netflix_app/core/global/useCase/use_case.dart';

class GetTopRatedMoviesUseCase extends UseCase<List<MovieEntity>, NoParam> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> call([NoParam? param]) {
    return baseMoviesRepository.getTopRatedMovies();
  }
}

import 'package:dartz/dartz.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_recommendation_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Repository/base_movies_repository.dart';
import 'package:netflix_app/core/global/errors/failures.dart';
import 'package:netflix_app/core/global/useCase/use_case.dart';

class GetMoviesRecommendationUseCase extends UseCase<
    List<MovieRecommendationEntity>, MoviesRecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<MovieRecommendationEntity>>> call(
      [MoviesRecommendationParameters? parameter]) async {
    return await baseMoviesRepository.getMoviesRecommendation(parameter!);
  }
}

class MoviesRecommendationParameters {
  final int id;

  const MoviesRecommendationParameters({required this.id});
}

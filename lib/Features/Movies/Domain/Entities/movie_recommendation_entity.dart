import 'package:equatable/equatable.dart';

class MovieRecommendationEntity extends Equatable {
  final int id;
  final String? backdropPath;

  const MovieRecommendationEntity({required this.id, this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}

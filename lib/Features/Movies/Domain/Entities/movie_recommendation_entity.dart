import 'package:equatable/equatable.dart';

class MovieRecommendationEntity extends Equatable {
  final String id;
  final String? backdropPath;

  const MovieRecommendationEntity({required this.id, this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}

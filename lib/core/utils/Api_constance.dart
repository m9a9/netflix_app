class ApiConstance {
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrlPath(String imagePath) => '$baseImageUrl$imagePath';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'api_key=4b772df667cc122ed50ed4613a03f480';
  static const String nowPlayingPath = '$baseUrl/movie/now_playing?$apiKey';
  static const String popularMoviesPath = '$baseUrl/movie/popular?$apiKey';
  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated?$apiKey';
  static String moviesDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?$apiKey';
  static String moviesRecommendationPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?$apiKey';
}

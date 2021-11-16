class MovieModel {
  int id;
  String releaseDate;
  String originalTitle;
  String posterPath;
  String backDropPath;
  double voteAverage;
  String overview;

  MovieModel({
    this.originalTitle,
    this.posterPath,
    this.id,
    this.backDropPath,
    this.overview,
    this.releaseDate,
    this.voteAverage,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    backDropPath = json['backdrop_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteAverage = (json['vote_average'] as num).toDouble();
  }
}

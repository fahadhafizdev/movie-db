class TvModel {
  int id;
  String name;
  String backDropPath;
  String posterPath;
  double voteAverage;
  String firstAirDate;
  String overview;

  TvModel({
    this.id,
    this.posterPath,
    this.name,
    this.backDropPath,
    this.firstAirDate,
    this.overview,
    this.voteAverage,
  });

  TvModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backDropPath = json['backdrop_path'];
    overview = json['overview'];
    voteAverage = (json['vote_average'] as num).toDouble();
    firstAirDate = json['first_air_date'];
  }
}

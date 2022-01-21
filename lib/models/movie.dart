import 'dart:convert';

class Movie {
  Movie({
    required this.adult,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.backdropPath,
    this.posterPath,
    this.releaseDate,
  });

  //Imagen de la pelicula
  bool adult;
  bool video;
  double popularity;
  double voteAverage;
  int id;
  int voteCount;
  List<int> genreIds;
  String originalLanguage;
  String originalTitle;
  String overview;
  String title;
  String? backdropPath;
  String? posterPath;
  String? releaseDate;
  String? heroId;

  get fullPosterImg {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  get fullBackdropPath {
    if (backdropPath != null) {
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  // Map<String, dynamic> toMap() => {
  //       "adult": adult,
  //       "backdrop_path": backdropPath,
  //       "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
  //       "id": id,
  //       "original_language": originalLanguageValues.reverse[originalLanguage],
  //       "original_title": originalTitle,
  //       "overview": overview,
  //       "popularity": popularity,
  //       "poster_path": posterPath,
  //       "release_date":
  //           "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
  //       "title": title,
  //       "video": video,
  //       "vote_average": voteAverage,
  //       "vote_count": voteCount,
  //     };
}

// enum OriginalLanguage { EN, FR }

// final originalLanguageValues =
//     EnumValues({"en": OriginalLanguage.EN, "fr": OriginalLanguage.FR});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
//}

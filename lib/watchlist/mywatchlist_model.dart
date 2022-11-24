import 'dart:convert';

class WatchList {
  WatchList({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory WatchList.fromRawJson(String str) =>
      WatchList.fromJson(json.decode(str));

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  
}

class Fields {
  Fields({
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  String title;
  double rating;
  String releaseDate;
  String review;

  factory Fields.fromRawJson(String str) => Fields.fromJson(json.decode(str));

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        rating: json["rating"],
        releaseDate: json["release_date"],
        review: json["review"],
      );

  
}
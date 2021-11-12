import 'dart:convert';

class SearchModel {
  SearchModel({
    required this.results,
    required this.imageResults,
    this.total,
    required this.answers,
    required this.ts,
    required this.deviceRegion,
    required this.deviceType,

  });

  late final List<Result> results;
  late List<dynamic> imageResults;
  dynamic total;
  late List<dynamic> answers;
  late double ts;
  late String deviceRegion;
  late String deviceType;

  factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        imageResults: List<dynamic>.from(json["image_results"].map((x) => x)),
        total: json["total"],
        answers: List<dynamic>.from(json["answers"].map((x) => x)),
        ts: json["ts"].toDouble(),
        deviceRegion: json["device_region"],
        deviceType: json["device_type"],
      );

  Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "image_results": List<dynamic>.from(imageResults.map((x) => x)),
        "total": total,
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "ts": ts,
        "device_region": deviceRegion,
        "device_type": deviceType,
      };
}

class Result {
  late String title;
  late String description;
  late String link;

  Result({required this.title, required this.description, required this.link});

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        title: json["title"],
        description: json["description"],
        link: json["link"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "link": link,
      };
}

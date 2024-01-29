// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    String title;
    String artist;
    String artwork;
    String url;
    String id;

    Welcome({
        required this.title,
        required this.artist,
        required this.artwork,
        required this.url,
        required this.id,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        title: json["title"],
        artist: json["artist"],
        artwork: json["artwork"],
        url: json["url"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "artist": artist,
        "artwork": artwork,
        "url": url,
        "id": id,
    };
}

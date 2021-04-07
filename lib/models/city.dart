// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

List<City> cityFromJson(List<dynamic> str) => List<City>.from((str).map((x) => City.fromJson(x)));

String cityToJson(List<City> data) => json.encode((data.map((x) => x.toJson())));

class City {
  City({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  String title;
  String locationType;
  int woeid;
  String lattLong;

  factory City.fromJson(Map<String, dynamic> json) => City(
    title: json["title"],
    locationType: json["location_type"],
    woeid: json["woeid"],
    lattLong: json["latt_long"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "location_type": locationType,
    "woeid": woeid,
    "latt_long": lattLong,
  };
}

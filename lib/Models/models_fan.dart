// To parse this JSON data, do
//
//     final fan = fanFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Fan> fanFromJson(String str) =>
    List<Fan>.from(json.decode(str).map((x) => Fan.fromJson(x)));

String fanToJson(List<Fan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fan {
  Fan({
    required this.idFans,
    required this.namaFans,
    required this.merkFans,
    required this.sizeFans,
    required this.voltageFans,
    required this.powerFans,
    required this.speedFans,
    required this.colorFans,
    required this.rgb,
    required this.harga,
    required this.imageLinks,
    required this.powerConnector,
    required this.links,
  });

  String idFans;
  String namaFans;
  String merkFans;
  String sizeFans;
  String voltageFans;
  String powerFans;
  String speedFans;
  String colorFans;
  String rgb;
  String harga;
  String imageLinks;
  String powerConnector;
  String links;

  factory Fan.fromJson(Map<String, dynamic> json) => Fan(
        idFans: json["idFans"],
        namaFans: json["NamaFans"],
        merkFans: json["MerkFans"],
        sizeFans: json["SizeFans"],
        voltageFans: json["VoltageFans"],
        powerFans: json["PowerFans"],
        speedFans: json["SpeedFans"],
        colorFans: json["ColorFans"],
        rgb: json["RGB"],
        harga: json["Harga"],
        imageLinks: json["ImageLinks"],
        powerConnector: json["PowerConnector"],
        links: json["Links"],
      );

  Map<String, dynamic> toJson() => {
        "idFans": idFans,
        "NamaFans": namaFans,
        "MerkFans": merkFans,
        "SizeFans": sizeFans,
        "VoltageFans": voltageFans,
        "PowerFans": powerFans,
        "SpeedFans": speedFans,
        "ColorFans": colorFans,
        "RGB": rgb,
        "Harga": harga,
        "ImageLinks": imageLinks,
        "PowerConnector": powerConnector,
        "Links": links,
      };
}

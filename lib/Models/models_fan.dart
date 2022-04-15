// To parse this JSON data, do
//
//     final fan = fanFromJson(jsonString);

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
    required this.speedFans,
    required this.colorFans,
    required this.rgb,
    required this.imageLinks,
    required this.powerConnector,
  });

  String idFans;
  String namaFans;
  String merkFans;
  String sizeFans;
  String voltageFans;
  String speedFans;
  String colorFans;
  String rgb;
  String imageLinks;
  String powerConnector;

  factory Fan.fromJson(Map<String, dynamic> json) => Fan(
        idFans: json["idFans"],
        namaFans: json["NamaFans"],
        merkFans: json["MerkFans"],
        sizeFans: json["SizeFans"],
        voltageFans: json["VoltageFans"],
        speedFans: json["SpeedFans"],
        colorFans: json["ColorFans"],
        rgb: json["RGB"],
        imageLinks: json["ImageLinks"],
        powerConnector: json["PowerConnector"],
      );

  Map<String, dynamic> toJson() => {
        "idFans": idFans,
        "NamaFans": namaFans,
        "MerkFans": merkFans,
        "SizeFans": sizeFans,
        "VoltageFans": voltageFans,
        "SpeedFans": speedFans,
        "ColorFans": colorFans,
        "RGB": rgb,
        "ImageLinks": imageLinks,
        "PowerConnector": powerConnector,
      };
}

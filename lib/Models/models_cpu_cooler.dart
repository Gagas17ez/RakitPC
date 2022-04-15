// To parse this JSON data, do
//
//     final cpuCooler = cpuCoolerFromJson(jsonString);

import 'dart:convert';

List<CpuCooler> cpuCoolerFromJson(String str) =>
    List<CpuCooler>.from(json.decode(str).map((x) => CpuCooler.fromJson(x)));

String cpuCoolerToJson(List<CpuCooler> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CpuCooler {
  CpuCooler({
    required this.idCooler,
    required this.namaCooler,
    required this.merkCooler,
    required this.typeCooler,
    required this.socketCooler,
    required this.dimensionCooler,
    required this.fanQuantity,
    required this.fanSpeed,
    required this.powerCooler,
    required this.colorCooler,
    required this.rgb,
    required this.imageLink,
  });

  String idCooler;
  String namaCooler;
  String merkCooler;
  String typeCooler;
  String socketCooler;
  String dimensionCooler;
  String fanQuantity;
  String fanSpeed;
  String powerCooler;
  String colorCooler;
  String rgb;
  String imageLink;

  factory CpuCooler.fromJson(Map<String, dynamic> json) => CpuCooler(
        idCooler: json["idCooler"],
        namaCooler: json["NamaCooler"],
        merkCooler: json["MerkCooler"],
        typeCooler: json["TypeCooler"],
        socketCooler: json["SocketCooler"],
        dimensionCooler: json["DimensionCooler"],
        fanQuantity: json["FanQuantity"],
        fanSpeed: json["FanSpeed"],
        powerCooler: json["PowerCooler"],
        colorCooler: json["ColorCooler"],
        rgb: json["RGB"],
        imageLink: json["ImageLink"],
      );

  Map<String, dynamic> toJson() => {
        "idCooler": idCooler,
        "NamaCooler": namaCooler,
        "MerkCooler": merkCooler,
        "TypeCooler": typeCooler,
        "SocketCooler": socketCooler,
        "DimensionCooler": dimensionCooler,
        "FanQuantity": fanQuantity,
        "FanSpeed": fanSpeed,
        "PowerCooler": powerCooler,
        "ColorCooler": colorCooler,
        "RGB": rgb,
        "ImageLink": imageLink,
      };
}

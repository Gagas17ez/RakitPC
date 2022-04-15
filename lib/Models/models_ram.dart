// To parse this JSON data, do
//
//     final ram = ramFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Ram> ramFromJson(String str) =>
    List<Ram>.from(json.decode(str).map((x) => Ram.fromJson(x)));

String ramToJson(List<Ram> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ram {
  Ram({
    required this.idRam,
    required this.namaRam,
    required this.merkRam,
    required this.memoryType,
    required this.memorySize,
    required this.memorySpeed,
    required this.latency,
    required this.voltage,
    required this.heatSpreader,
    required this.color,
    required this.rgb,
    required this.imageLink,
  });

  String idRam;
  String namaRam;
  String merkRam;
  String memoryType;
  String memorySize;
  String memorySpeed;
  String latency;
  String voltage;
  String heatSpreader;
  String color;
  String rgb;
  String imageLink;

  factory Ram.fromJson(Map<String, dynamic> json) => Ram(
        idRam: json["idRam"],
        namaRam: json["NamaRam"],
        merkRam: json["MerkRam"],
        memoryType: json["MemoryType"],
        memorySize: json["MemorySize"],
        memorySpeed: json["MemorySpeed"],
        latency: json["Latency"],
        voltage: json["Voltage"],
        heatSpreader: json["HeatSpreader"],
        color: json["Color"],
        rgb: json["RGB"],
        imageLink: json["ImageLink"],
      );

  Map<String, dynamic> toJson() => {
        "idRam": idRam,
        "NamaRam": namaRam,
        "MerkRam": merkRam,
        "MemoryType": memoryType,
        "MemorySize": memorySize,
        "MemorySpeed": memorySpeed,
        "Latency": latency,
        "Voltage": voltage,
        "HeatSpreader": heatSpreader,
        "Color": color,
        "RGB": rgb,
        "ImageLink": imageLink,
      };
}

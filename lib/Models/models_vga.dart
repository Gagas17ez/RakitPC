// To parse this JSON data, do
//
//     final vga = vgaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Vga> vgaFromJson(String str) =>
    List<Vga>.from(json.decode(str).map((x) => Vga.fromJson(x)));

String vgaToJson(List<Vga> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vga {
  Vga({
    required this.idVga,
    required this.namaVga,
    required this.releaseDate,
    required this.merkVga,
    required this.generation,
    required this.vgaInterface,
    required this.baseClocks,
    required this.boostClock,
    required this.memoryClock,
    required this.memoryVga,
    required this.memoryType,
    required this.memoryBus,
    required this.outputPort,
    required this.powerConsumption,
    required this.powerConnection,
    required this.dimensionVga,
    required this.architecture,
    required this.maxDisplay,
    required this.rgb,
    required this.rTcores,
    required this.color,
    required this.imageLink,
    required this.harga,
    required this.graphicApi,
    required this.displayTechnology,
  });

  String idVga;
  String namaVga;
  String releaseDate;
  String merkVga;
  String generation;
  String vgaInterface;
  String baseClocks;
  String boostClock;
  String memoryClock;
  String memoryVga;
  String memoryType;
  String memoryBus;
  String outputPort;
  String powerConsumption;
  String powerConnection;
  String dimensionVga;
  String architecture;
  String maxDisplay;
  String rgb;
  String rTcores;
  String color;
  String imageLink;
  String harga;
  String graphicApi;
  String displayTechnology;

  factory Vga.fromJson(Map<String, dynamic> json) => Vga(
        idVga: json["idVGA"],
        namaVga: json["NamaVGA"],
        releaseDate: json["ReleaseDate"],
        merkVga: json["MerkVGA"],
        generation: json["Generation"],
        vgaInterface: json["Interface"],
        baseClocks: json["BaseClocks"],
        boostClock: json["BoostClock"],
        memoryClock: json["MemoryClock"],
        memoryVga: json["MemoryVGA"],
        memoryType: json["MemoryType"],
        memoryBus: json["MemoryBus"],
        outputPort: json["OutputPort"],
        powerConsumption: json["PowerConsumption"],
        powerConnection: json["PowerConnection"],
        dimensionVga: json["DimensionVGA"],
        architecture: json["Architecture"],
        maxDisplay: json["MaxDisplay"],
        rgb: json["RGB"],
        rTcores: json["RTcores"],
        color: json["Color"],
        imageLink: json["ImageLink"],
        harga: json["Harga"],
        graphicApi: json["GraphicAPI"],
        displayTechnology: json["DisplayTechnology"],
      );

  Map<String, dynamic> toJson() => {
        "idVGA": idVga,
        "NamaVGA": namaVga,
        "ReleaseDate": releaseDate,
        "MerkVGA": merkVga,
        "Generation": generation,
        "Interface": vgaInterface,
        "BaseClocks": baseClocks,
        "BoostClock": boostClock,
        "MemoryClock": memoryClock,
        "MemoryVGA": memoryVga,
        "MemoryType": memoryType,
        "MemoryBus": memoryBus,
        "OutputPort": outputPort,
        "PowerConsumption": powerConsumption,
        "PowerConnection": powerConnection,
        "DimensionVGA": dimensionVga,
        "Architecture": architecture,
        "MaxDisplay": maxDisplay,
        "RGB": rgb,
        "RTcores": rTcores,
        "Color": color,
        "ImageLink": imageLink,
        "Harga": harga,
        "GraphicAPI": graphicApi,
        "DisplayTechnology": displayTechnology,
      };
}

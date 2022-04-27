// To parse this JSON data, do
//
//     final casing = casingFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Casing> casingFromJson(String str) =>
    List<Casing>.from(json.decode(str).map((x) => Casing.fromJson(x)));

String casingToJson(List<Casing> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Casing {
  Casing({
    required this.idCasing,
    required this.namaCasing,
    required this.merkCasing,
    required this.moboCompatible,
    required this.drivebayCasing,
    required this.fanSupport,
    required this.frontPanel,
    required this.dimensionCasing,
    required this.weightCasing,
    required this.colorCasing,
    required this.maxVgaLength,
    required this.maxCoolerHeight,
    required this.maxPsu,
    required this.casingSidePanel,
    required this.harga,
    required this.imageLink,
    required this.links,
  });

  String idCasing;
  String namaCasing;
  String merkCasing;
  String moboCompatible;
  String drivebayCasing;
  String fanSupport;
  String frontPanel;
  String dimensionCasing;
  String weightCasing;
  String colorCasing;
  String maxVgaLength;
  String maxCoolerHeight;
  String maxPsu;
  String casingSidePanel;
  String harga;
  String imageLink;
  String links;

  factory Casing.fromJson(Map<String, dynamic> json) => Casing(
        idCasing: json["idCasing"],
        namaCasing: json["NamaCasing"],
        merkCasing: json["MerkCasing"],
        moboCompatible: json["MoboCompatible"],
        drivebayCasing: json["DrivebayCasing"],
        fanSupport: json["FanSupport"],
        frontPanel: json["FrontPanel"],
        dimensionCasing: json["DimensionCasing"],
        weightCasing: json["WeightCasing"],
        colorCasing: json["ColorCasing"],
        maxVgaLength: json["MaxVgaLength"],
        maxCoolerHeight: json["MaxCoolerHeight"],
        maxPsu: json["MaxPSU"],
        casingSidePanel: json["CasingSidePanel"],
        harga: json["Harga"],
        imageLink: json["ImageLink"],
        links: json["Links"],
      );

  Map<String, dynamic> toJson() => {
        "idCasing": idCasing,
        "NamaCasing": namaCasing,
        "MerkCasing": merkCasing,
        "MoboCompatible": moboCompatible,
        "DrivebayCasing": drivebayCasing,
        "FanSupport": fanSupport,
        "FrontPanel": frontPanel,
        "DimensionCasing": dimensionCasing,
        "WeightCasing": weightCasing,
        "ColorCasing": colorCasing,
        "MaxVgaLength": maxVgaLength,
        "MaxCoolerHeight": maxCoolerHeight,
        "MaxPSU": maxPsu,
        "CasingSidePanel": casingSidePanel,
        "Harga": harga,
        "ImageLink": imageLink,
        "Links": links,
      };
}

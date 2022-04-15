// To parse this JSON data, do
//
//     final Casing = CasingFromJson(jsonString);

import 'dart:convert';

List<Casing> CasingFromJson(String str) =>
    List<Casing>.from(json.decode(str).map((x) => Casing.fromJson(x)));

String CasingToJson(List<Casing> data) =>
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
    required this.imageLink,
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
  String imageLink;

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
        imageLink: json["ImageLink"],
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
        "ImageLink": imageLink,
      };
}

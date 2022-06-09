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

  final String idCasing;
  final String namaCasing;
  final String merkCasing;
  final String moboCompatible;
  final String drivebayCasing;
  final String fanSupport;
  final String frontPanel;
  final String dimensionCasing;
  final String weightCasing;
  final String colorCasing;
  final String maxVgaLength;
  final String maxCoolerHeight;
  final String maxPsu;
  final String casingSidePanel;
  final String harga;
  final String imageLink;
  final String links;

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

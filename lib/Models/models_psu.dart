// To parse this JSON data, do
//
//     final psu = psuFromJson(jsonString);

// ignore: unused_import
import 'package:meta/meta.dart';
import 'dart:convert';

List<Psu> psuFromJson(String str) =>
    List<Psu>.from(json.decode(str).map((x) => Psu.fromJson(x)));

String psuToJson(List<Psu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Psu {
  Psu({
    required this.idPsu,
    required this.namaPsu,
    required this.merkPsu,
    required this.wattPsu,
    required this.the80PlusEfficient,
    required this.formFactor,
    required this.modular,
    required this.sataConnector,
    required this.pcieConnector,
    required this.silentMode,
    required this.fanSize,
    required this.atxConnector,
    required this.colorPsu,
    required this.rgb,
    required this.harga,
    required this.imageLink,
    required this.links,
  });

  String idPsu;
  String namaPsu;
  String merkPsu;
  String wattPsu;
  String the80PlusEfficient;
  String formFactor;
  String modular;
  String sataConnector;
  String pcieConnector;
  String silentMode;
  String fanSize;
  String atxConnector;
  String colorPsu;
  String rgb;
  String harga;
  String imageLink;
  String links;

  factory Psu.fromJson(Map<String, dynamic> json) => Psu(
        idPsu: json["idPSU"],
        namaPsu: json["NamaPSU"],
        merkPsu: json["MerkPSU"],
        wattPsu: json["WattPSU"],
        the80PlusEfficient: json["80PlusEfficient"],
        formFactor: json["FormFactor"],
        modular: json["Modular"],
        sataConnector: json["SataConnector"],
        pcieConnector: json["PCIEConnector"],
        silentMode: json["SilentMode"],
        fanSize: json["FanSize"],
        atxConnector: json["ATXConnector"],
        colorPsu: json["ColorPsu"],
        rgb: json["RGB"],
        harga: json["Harga"],
        imageLink: json["ImageLink"],
        links: json["Links"],
      );

  Map<String, dynamic> toJson() => {
        "idPSU": idPsu,
        "NamaPSU": namaPsu,
        "MerkPSU": merkPsu,
        "WattPSU": wattPsu,
        "80PlusEfficient": the80PlusEfficient,
        "FormFactor": formFactor,
        "Modular": modular,
        "SataConnector": sataConnector,
        "PCIEConnector": pcieConnector,
        "SilentMode": silentMode,
        "FanSize": fanSize,
        "ATXConnector": atxConnector,
        "ColorPsu": colorPsu,
        "RGB": rgb,
        "Harga": harga,
        "ImageLink": imageLink,
        "Links": links,
      };
}

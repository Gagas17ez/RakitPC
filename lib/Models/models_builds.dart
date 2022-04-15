// To parse this JSON data, do
//
//     final builds = buildsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Builds> buildsFromJson(String str) =>
    List<Builds>.from(json.decode(str).map((x) => Builds.fromJson(x)));

String buildsToJson(List<Builds> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Builds {
  Builds({
    required this.idBuilds,
    required this.kebutuhanBuilds,
    required this.budgetBuilds,
    required this.motherboard,
    required this.cpu,
    required this.ram,
    required this.vga,
    required this.psu,
    required this.cpuCooler,
    required this.storage,
    required this.fans,
    required this.casing,
    required this.imgLinks,
  });

  String idBuilds;
  String kebutuhanBuilds;
  String budgetBuilds;
  String motherboard;
  String cpu;
  String ram;
  String vga;
  String psu;
  String cpuCooler;
  String storage;
  String fans;
  String casing;
  String imgLinks;

  factory Builds.fromJson(Map<String, dynamic> json) => Builds(
        idBuilds: json["idBuilds"],
        kebutuhanBuilds: json["KebutuhanBuilds"],
        budgetBuilds: json["BudgetBuilds"],
        motherboard: json["Motherboard"],
        cpu: json["Cpu"],
        ram: json["Ram"],
        vga: json["VGA"],
        psu: json["PSU"],
        cpuCooler: json["CpuCooler"],
        storage: json["Storage"],
        fans: json["Fans"],
        casing: json["Casing"],
        imgLinks: json["ImgLinks"],
      );

  Map<String, dynamic> toJson() => {
        "idBuilds": idBuilds,
        "KebutuhanBuilds": kebutuhanBuilds,
        "BudgetBuilds": budgetBuilds,
        "Motherboard": motherboard,
        "Cpu": cpu,
        "Ram": ram,
        "VGA": vga,
        "PSU": psu,
        "CpuCooler": cpuCooler,
        "Storage": storage,
        "Fans": fans,
        "Casing": casing,
        "ImgLinks": imgLinks,
      };
}

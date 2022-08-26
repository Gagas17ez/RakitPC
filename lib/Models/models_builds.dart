// To parse this JSON data, do
//
//     final builds = buildsFromJson(jsonString);

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
    required this.namaMobo,
    required this.hargaMobo,
    required this.imgMobo,
    required this.cpu,
    required this.namaCpu,
    required this.hargaCpu,
    required this.imgCpu,
    required this.ram,
    required this.namaRam,
    required this.hargaRam,
    required this.imgRam,
    required this.vga,
    required this.namaVga,
    required this.hargaVga,
    required this.imgVga,
    required this.psu,
    required this.namaPsu,
    required this.hargaPsu,
    required this.imgPsu,
    required this.cpuCooler,
    required this.namaCpuCooler,
    required this.hargaCpuCooler,
    required this.imgCpuCooler,
    required this.storage,
    required this.namaStorage,
    required this.hargaStorage,
    required this.imgStorage,
    required this.fans,
    required this.namaFans,
    required this.hargaFans,
    required this.imgFans,
    required this.casing,
    required this.namaCasing,
    required this.hargaCasing,
    required this.imgCasing,
    required this.imgLinks,
    required this.hargaBuilds,
    required this.links,
  });

  String idBuilds;
  String kebutuhanBuilds;
  String budgetBuilds;
  String motherboard;
  String namaMobo;
  String hargaMobo;
  String imgMobo;
  String cpu;
  String namaCpu;
  String hargaCpu;
  String imgCpu;
  String ram;
  String namaRam;
  String hargaRam;
  String imgRam;
  String vga;
  String namaVga;
  String hargaVga;
  String imgVga;
  String psu;
  String namaPsu;
  String hargaPsu;
  String imgPsu;
  String cpuCooler;
  String namaCpuCooler;
  String hargaCpuCooler;
  String imgCpuCooler;
  String storage;
  String namaStorage;
  String hargaStorage;
  String imgStorage;
  String fans;
  String namaFans;
  String hargaFans;
  String imgFans;
  String casing;
  String namaCasing;
  String hargaCasing;
  String imgCasing;
  String imgLinks;
  String hargaBuilds;
  String links;

  factory Builds.fromJson(Map<String, dynamic> json) => Builds(
        idBuilds: json["idBuilds"],
        kebutuhanBuilds: json["KebutuhanBuilds"],
        budgetBuilds: json["BudgetBuilds"],
        motherboard: json["Motherboard"],
        namaMobo: json["NamaMobo"],
        hargaMobo: json["HargaMobo"],
        imgMobo: json["ImgMobo"],
        cpu: json["Cpu"],
        namaCpu: json["NamaCpu"],
        hargaCpu: json["HargaCpu"],
        imgCpu: json["ImgCpu"],
        ram: json["Ram"],
        namaRam: json["NamaRam"],
        hargaRam: json["HargaRam"],
        imgRam: json["ImgRam"],
        vga: json["VGA"],
        namaVga: json["NamaVga"],
        hargaVga: json["HargaVga"],
        imgVga: json["ImgVga"],
        psu: json["PSU"],
        namaPsu: json["NamaPsu"],
        hargaPsu: json["HargaPsu"],
        imgPsu: json["ImgPsu"],
        cpuCooler: json["CpuCooler"],
        namaCpuCooler: json["NamaCpuCooler"],
        hargaCpuCooler: json["HargaCpuCooler"],
        imgCpuCooler: json["ImgCpuCooler"],
        storage: json["Storage"],
        namaStorage: json["NamaStorage"],
        hargaStorage: json["HargaStorage"],
        imgStorage: json["ImgStorage"],
        fans: json["Fans"],
        namaFans: json["NamaFans"],
        hargaFans: json["HargaFans"],
        imgFans: json["ImgFans"],
        casing: json["Casing"],
        namaCasing: json["NamaCasing"],
        hargaCasing: json["HargaCasing"],
        imgCasing: json["ImgCasing"],
        imgLinks: json["ImgLinks"],
        hargaBuilds: json["HargaBuilds"],
        links: json["Links"],
      );

  Map<String, dynamic> toJson() => {
        "idBuilds": idBuilds,
        "KebutuhanBuilds": kebutuhanBuilds,
        "BudgetBuilds": budgetBuilds,
        "Motherboard": motherboard,
        "NamaMobo": namaMobo,
        "HargaMobo": hargaMobo,
        "ImgMobo": imgMobo,
        "Cpu": cpu,
        "NamaCpu": namaCpu,
        "HargaCpu": hargaCpu,
        "ImgCpu": imgCpu,
        "Ram": ram,
        "NamaRam": namaRam,
        "HargaRam": hargaRam,
        "ImgRam": imgRam,
        "VGA": vga,
        "NamaVga": namaVga,
        "HargaVga": hargaVga,
        "ImgVga": imgVga,
        "PSU": psu,
        "NamaPsu": namaPsu,
        "HargaPsu": hargaPsu,
        "ImgPsu": imgPsu,
        "CpuCooler": cpuCooler,
        "NamaCpuCooler": namaCpuCooler,
        "HargaCpuCooler": hargaCpuCooler,
        "ImgCpuCooler": imgCpuCooler,
        "Storage": storage,
        "NamaStorage": namaStorage,
        "HargaStorage": hargaStorage,
        "ImgStorage": imgStorage,
        "Fans": fans,
        "NamaFans": namaFans,
        "HargaFans": hargaFans,
        "ImgFans": imgFans,
        "Casing": casing,
        "NamaCasing": namaCasing,
        "HargaCasing": hargaCasing,
        "ImgCasing": imgCasing,
        "ImgLinks": imgLinks,
        "HargaBuilds": hargaBuilds,
        "Links": links,
      };
}

// To parse this JSON data, do
//
//     final cpu = cpuFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Cpu> cpuFromJson(String str) =>
    List<Cpu>.from(json.decode(str).map((x) => Cpu.fromJson(x)));

String cpuToJson(List<Cpu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cpu {
  Cpu({
    required this.idCpu,
    required this.namaCpu,
    required this.merkCpu,
    required this.socket,
    required this.coreCount,
    required this.threadsCount,
    required this.baseClock,
    required this.defaultTdp,
    required this.launchDate,
    required this.cache,
    required this.maxClock,
    required this.unlocked,
    required this.maxTemp,
    required this.procTechnology,
    required this.harga,
    required this.imageLink,
    required this.links,
  });

  String idCpu;
  String namaCpu;
  String merkCpu;
  String socket;
  String coreCount;
  String threadsCount;
  String baseClock;
  String defaultTdp;
  String launchDate;
  String cache;
  String maxClock;
  String unlocked;
  String maxTemp;
  String procTechnology;
  String harga;
  String imageLink;
  String links;

  factory Cpu.fromJson(Map<String, dynamic> json) => Cpu(
        idCpu: json["idCPU"],
        namaCpu: json["NamaCPU"],
        merkCpu: json["MerkCPU"],
        socket: json["Socket"],
        coreCount: json["CoreCount"],
        threadsCount: json["ThreadsCount"],
        baseClock: json["BaseClock"],
        defaultTdp: json["DefaultTDP"],
        launchDate: json["LaunchDate"],
        cache: json["Cache"],
        maxClock: json["MaxClock"],
        unlocked: json["Unlocked"],
        maxTemp: json["MaxTemp"],
        procTechnology: json["ProcTechnology"],
        harga: json["Harga"],
        imageLink: json["ImageLink"],
        links: json["Links"],
      );

  Map<String, dynamic> toJson() => {
        "idCPU": idCpu,
        "NamaCPU": namaCpu,
        "MerkCPU": merkCpu,
        "Socket": socket,
        "CoreCount": coreCount,
        "ThreadsCount": threadsCount,
        "BaseClock": baseClock,
        "DefaultTDP": defaultTdp,
        "LaunchDate": launchDate,
        "Cache": cache,
        "MaxClock": maxClock,
        "Unlocked": unlocked,
        "MaxTemp": maxTemp,
        "ProcTechnology": procTechnology,
        "Harga": harga,
        "ImageLink": imageLink,
        "Links": links,
      };
}

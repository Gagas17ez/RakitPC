// To parse this JSON data, do
//
//     final storage = storageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Storage> storageFromJson(String str) =>
    List<Storage>.from(json.decode(str).map((x) => Storage.fromJson(x)));

String storageToJson(List<Storage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Storage {
  Storage({
    required this.idStorage,
    required this.namaStorage,
    required this.merkStorage,
    required this.typeStorage,
    required this.formFactor,
    required this.storageCapacity,
    required this.storageInterface,
    required this.cache,
    required this.readSpeed,
    required this.writeSpeed,
    required this.rpm,
    required this.storageWatt,
    required this.imageLink,
  });

  String idStorage;
  String namaStorage;
  String merkStorage;
  String typeStorage;
  String formFactor;
  String storageCapacity;
  String storageInterface;
  String cache;
  String readSpeed;
  String writeSpeed;
  String rpm;
  String storageWatt;
  String imageLink;

  factory Storage.fromJson(Map<String, dynamic> json) => Storage(
        idStorage: json["idStorage"],
        namaStorage: json["NamaStorage"],
        merkStorage: json["MerkStorage"],
        typeStorage: json["TypeStorage"],
        formFactor: json["FormFactor"],
        storageCapacity: json["StorageCapacity"],
        storageInterface: json["StorageInterface"],
        cache: json["Cache"],
        readSpeed: json["ReadSpeed"],
        writeSpeed: json["WriteSpeed"],
        rpm: json["RPM"],
        storageWatt: json["StorageWatt"],
        imageLink: json["ImageLink"],
      );

  Map<String, dynamic> toJson() => {
        "idStorage": idStorage,
        "NamaStorage": namaStorage,
        "MerkStorage": merkStorage,
        "TypeStorage": typeStorage,
        "FormFactor": formFactor,
        "StorageCapacity": storageCapacity,
        "StorageInterface": storageInterface,
        "Cache": cache,
        "ReadSpeed": readSpeed,
        "WriteSpeed": writeSpeed,
        "RPM": rpm,
        "StorageWatt": storageWatt,
        "ImageLink": imageLink,
      };
}

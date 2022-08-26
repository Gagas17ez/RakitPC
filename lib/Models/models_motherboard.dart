// To parse this JSON data, do
//
//     final motherboard = motherboardFromJson(jsonString);

import 'dart:convert';

List<Motherboard> motherboardFromJson(String str) => List<Motherboard>.from(
    json.decode(str).map((x) => Motherboard.fromJson(x)));

String motherboardToJson(List<Motherboard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Motherboard {
  Motherboard({
    required this.idMotherboard,
    required this.namaMobo,
    required this.merkMobo,
    required this.formFactor,
    required this.socketMobo,
    required this.chipsetMobo,
    required this.memoryType,
    required this.slotMemory,
    required this.sataSlot,
    required this.pcie,
    required this.pcIgen,
    required this.m2Slot,
    required this.usbPort,
    required this.audioPort,
    required this.displayOutput,
    required this.lanPort,
    required this.imageLink,
    required this.warna,
    required this.rgb,
    required this.harga,
    required this.links,
  });

  String idMotherboard;
  String namaMobo;
  String merkMobo;
  String formFactor;
  String socketMobo;
  String chipsetMobo;
  String memoryType;
  String slotMemory;
  String sataSlot;
  String pcie;
  String pcIgen;
  String m2Slot;
  String usbPort;
  String audioPort;
  String displayOutput;
  String lanPort;
  String imageLink;
  String warna;
  String rgb;
  String harga;
  String links;

  factory Motherboard.fromJson(Map<String, dynamic> json) => Motherboard(
        idMotherboard: json["idMotherboard"],
        namaMobo: json["NamaMobo"],
        merkMobo: json["MerkMobo"],
        formFactor: json["FormFactor"],
        socketMobo: json["SocketMobo"],
        chipsetMobo: json["ChipsetMobo"],
        memoryType: json["MemoryType"],
        slotMemory: json["SlotMemory"],
        sataSlot: json["SataSlot"],
        pcie: json["PCIE"],
        pcIgen: json["PCIgen"],
        m2Slot: json["M2Slot"],
        usbPort: json["UsbPort"],
        audioPort: json["AudioPort"],
        displayOutput: json["DisplayOutput"],
        lanPort: json["LanPort"],
        imageLink: json["ImageLink"],
        warna: json["Warna"],
        rgb: json["RGB"],
        harga: json["Harga"],
        links: json["Links"],
      );

  Map<String, dynamic> toJson() => {
        "idMotherboard": idMotherboard,
        "NamaMobo": namaMobo,
        "MerkMobo": merkMobo,
        "FormFactor": formFactor,
        "SocketMobo": socketMobo,
        "ChipsetMobo": chipsetMobo,
        "MemoryType": memoryType,
        "SlotMemory": slotMemory,
        "SataSlot": sataSlot,
        "PCIE": pcie,
        "PCIgen": pcIgen,
        "M2Slot": m2Slot,
        "UsbPort": usbPort,
        "AudioPort": audioPort,
        "DisplayOutput": displayOutput,
        "LanPort": lanPort,
        "ImageLink": imageLink,
        "Warna": warna,
        "RGB": rgb,
        "Harga": harga,
        "Links": links,
      };
}

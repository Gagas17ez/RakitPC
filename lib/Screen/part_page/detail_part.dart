// ignore_for_file: prefer__ructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:rakit_pc/Models/models_vga.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:rakit_pc/Screen/build_advanced/build_advanced_new.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../Api/api_casing.dart';
import '../../../../../Models/models_casing.dart';
import 'package:rakit_pc/global.dart' as global;

import '../../Api/api_cpu.dart';
import '../../Api/api_cpu_cooler.dart';
import '../../Api/api_fan.dart';
import '../../Api/api_motherboard.dart';
import '../../Api/api_psu.dart';
import '../../Api/api_ram.dart';
import '../../Api/api_storage.dart';
import '../../Api/api_vga.dart';
import '../../Models/models_cpu.dart';
import 'detail_part.dart';
import 'list_part.dart';

class DetailPart extends StatefulWidget {
  DetailPart({Key? key}) : super(key: key);

  @override
  State<DetailPart> createState() => _DetailPartState();
}

class _DetailPartState extends State<DetailPart> {
  late Future data;

  List<Casing> data1 = [];
  List<CpuCooler> data2 = [];
  List<Cpu> data3 = [];
  List<Fan> data4 = [];
  List<Motherboard> data5 = [];
  List<Ram> data6 = [];
  List<Storage> data7 = [];
  List<Psu> data8 = [];
  List<Vga> data9 = [];

  @override
  void initState() {
    if (global.namaPart == "Casing") {
      data = fetchCasing();
      data.then((value) => setState(() {
            data1 = value;
            //ListCasing(data1);
          }));
    } else if (global.namaPart == "CPU Cooler") {
      data = fetchCpuCooler();
      data.then((value) => setState(() {
            data2 = value;
            // /ListCpu_cooler(data2);
          }));
    } else if (global.namaPart == "CPU") {
      data = fetchCpu();
      data.then((value) => setState(() {
            data3 = value;
          }));
    } else if (global.namaPart == "Fan") {
      data = fetchFan();
      data.then((value) => setState(() {
            data4 = value;
          }));
    } else if (global.namaPart == "Motherboard") {
      data = fetchMotherboard();
      data.then((value) => setState(() {
            data5 = value;
          }));
    } else if (global.namaPart == "Ram") {
      data = fetchRam();
      data.then((value) => setState(() {
            data6 = value;
          }));
    } else if (global.namaPart == "Storage") {
      data = fetchStorage();
      data.then((value) => setState(() {
            data7 = value;
          }));
    } else if (global.namaPart == "PSU") {
      data = fetchPsu();
      data.then((value) => setState(() {
            data8 = value;
          }));
    } else if (global.namaPart == "VGA") {
      data = fetchVga();
      data.then((value) => setState(() {
            data9 = value;
          }));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/casing');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('Detail Part'),
        ),
        body: getlistPart());
  }

  Widget getlistPart() {
    if (global.namaPart == "Casing") {
      return data1.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 300,
                      child: ListTile(
                        //Text(questions[index])
                        title: Column(
                          children: <Widget>[
                            Image.network(data1[global.idDetail].imageLink),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        //subtitle: Text(penjelas[index]),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data1[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      100, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data1[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  global.idCaseAdv = int.parse(
                                      data1[global.idDetail].idCasing);
                                  global.hargaCase =
                                      int.parse(data1[global.idDetail].harga);
                                },
                              );
                            },
                            child: Text('Add to Build')),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nama Casing",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].namaCasing + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merek Casing",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].merkCasing + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Casing Side Panel",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].casingSidePanel + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Color Casing",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].colorCasing + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Dimension Casing",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].dimensionCasing + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Drivebay Casing",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].drivebayCasing + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Fan Support",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].fanSupport + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Panel Depan Casing",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].frontPanel + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Tinggi Max Cooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].maxCoolerHeight + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Max PSU",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].maxPsu + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Panjang Max VGA",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].maxVgaLength + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Berat Casing",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].weightCasing + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Motherboard Compatible",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].moboCompatible + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Vga Compatible",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].maxVgaLength + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Fan Compatible",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data1[global.idDetail].fanSupport + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );

      //cpucooler
    } else if (global.namaPart == "CPU Cooler") {
      return data2.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 300,
                      child: ListTile(
                        //Text(questions[index])
                        title: Column(
                          children: <Widget>[
                            Image.network(data2[global.idDetail].imageLink),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        //subtitle: Text(penjelas[index]),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    //Text(questions[index])
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data2[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      100, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data2[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(20, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  global.idCpuCoolerAdv = int.parse(
                                      data2[global.idDetail].idCooler);
                                  global.hargaCooler =
                                      int.parse(data2[global.idDetail].harga);
                                  global.wattCooler = int.parse(
                                      data2[global.idDetail].powerCooler);
                                },
                              );
                            },
                            child: Text(
                              'Add to Build',
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nama CPUCooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].namaCooler + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merek CPU Cooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].merkCooler + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Power CPU Cooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].powerCooler + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("RGB CPU Cooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].rgb + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Socket CPU Cooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].socketCooler + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Type CPU Cooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].typeCooler + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Fan Quantitiy",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].fanQuantity + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Fan Speed",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].fanSpeed + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Color CPU Cooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].colorCooler + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Dimension CPU Cooler",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data2[global.idDetail].dimensionCooler + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );

      //cpu
    } else if (global.namaPart == "CPU") {
      return data3.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 300,
                      child: ListTile(
                        title: Column(
                          children: <Widget>[
                            Image.network(data3[global.idDetail].imageLink),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data3[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      110, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data3[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  global.idCpuAdv =
                                      int.parse(data3[global.idDetail].idCpu);
                                  global.socketCpu =
                                      data3[global.idDetail].socket;
                                  global.hargaCpu =
                                      int.parse(data3[global.idDetail].harga);
                                  global.wattCpu = int.parse(
                                      data3[global.idDetail].defaultTdp);
                                },
                              );
                            },
                            child: Text('Add to Build')),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  global.idCompare1 =
                                      int.parse(data3[global.idDetail].idCpu);
                                },
                              );
                            },
                            child: Text('Add to Compare')),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nama CPU",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].namaCpu + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merek CPU",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].merkCpu + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Proc Technology",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].procTechnology + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Cores/Threads",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(
                            data3[global.idDetail].coreCount +
                                "/" +
                                data3[global.idDetail].threadsCount +
                                "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Clock Speed",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(
                            data3[global.idDetail].baseClock +
                                " to " +
                                data3[global.idDetail].maxClock +
                                "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Motherboard Socket",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].socket + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Release Year",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].launchDate + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Cache",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].cache + "\n",
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Technology",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].procTechnology + "\n",
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Default TDP",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].defaultTdp + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Max Temp",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].maxTemp + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Unlocked",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data3[global.idDetail].unlocked + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );
    } else if (global.namaPart == "Fan") {
      return data4.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 300,
                      child: ListTile(
                        //Text(questions[index])
                        title: Column(
                          children: <Widget>[
                            Image.network(data4[global.idDetail].imageLinks),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        //subtitle: Text(penjelas[index]),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    //Text(questions[index])
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data4[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      100, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data4[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  if (global.sengDiganti == 1) {
                                    global.idFanAdv = int.parse(
                                        data4[global.idDetail].idFans);
                                    global.hargaFan1 =
                                        int.parse(data4[global.idDetail].harga);
                                    global.wattFan1 = int.parse(
                                        data4[global.idDetail].powerFans);
                                  } else if (global.sengDiganti == 2) {
                                    global.idFan2Adv = int.parse(
                                        data4[global.idDetail].idFans);
                                    global.hargaFan2 =
                                        int.parse(data4[global.idDetail].harga);
                                    global.wattFan2 = int.parse(
                                        data4[global.idDetail].powerFans);
                                  } else if (global.sengDiganti == 3) {
                                    global.idFan3Adv = int.parse(
                                        data4[global.idDetail].idFans);
                                    global.hargaFan3 =
                                        int.parse(data4[global.idDetail].harga);
                                    global.wattFan3 = int.parse(
                                        data4[global.idDetail].powerFans);
                                  }
                                },
                              );
                            },
                            child: Text('Add to Build')),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nama Fan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].namaFans + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merek Fan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].merkFans + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Power Connector",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].powerConnector + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Speed Fan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].speedFans + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Size Fan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].sizeFans + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Color Fan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].colorFans + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("RGB Fan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].rgb + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Power Usage Fan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].powerFans + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Voltage Fan",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data4[global.idDetail].voltageFans + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );
    } else if (global.namaPart == "Motherboard") {
      return data5.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 250,
                      child: ListTile(
                        //Text(questions[index])
                        title: Column(
                          children: <Widget>[
                            Image.network(data5[global.idDetail].imageLink),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        //subtitle: Text(penjelas[index]),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    //Text(questions[index])
                    contentPadding: EdgeInsets.symmetric(horizontal: 35),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data5[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      100, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data5[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  global.idMoboAdv = int.parse(
                                      data5[global.idDetail].idMotherboard);
                                  global.socketMobo =
                                      data5[global.idDetail].socketMobo;
                                  global.hargaMobo =
                                      int.parse(data5[global.idDetail].harga);
                                },
                              );
                            },
                            child: Text('Add to Build')),
                        Text("Nama Motherboard",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].namaMobo + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merek Motherboard",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].merkMobo + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Motherboard Socket",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].socketMobo + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Supported Memory Type",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].memoryType + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Memory Slot ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].slotMemory + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("M2 Slot",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].m2Slot + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Sata Slot",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].sataSlot + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("USB Port",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].usbPort + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Audio Port",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].audioPort + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("LAN Port",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].lanPort + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Form Factor",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].formFactor + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Display Output",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].displayOutput + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("PCI-E Gen",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].pcIgen + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("PCI-E",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].pcie + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("RGB Motherboard",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].rgb + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Warna MotherBoard",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].warna + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Chipset Motherboard",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data5[global.idDetail].chipsetMobo + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );
    } else if (global.namaPart == "Ram") {
      return data6.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 300,
                      child: ListTile(
                        //Text(questions[index])
                        title: Column(
                          children: <Widget>[
                            Image.network(data6[global.idDetail].imageLink),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        //subtitle: Text(penjelas[index]),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    //Text(questions[index])
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data6[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      100, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data6[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  if (global.sengDiganti == 1) {
                                    global.idRamAdv =
                                        int.parse(data6[global.idDetail].idRam);
                                    global.hargaRam1 =
                                        int.parse(data6[global.idDetail].harga);
                                    global.wattRam1 = 5;
                                  } else {
                                    global.idRam2Adv =
                                        int.parse(data6[global.idDetail].idRam);
                                    global.hargaRam2 =
                                        int.parse(data6[global.idDetail].harga);
                                    global.wattRam2 = 5;
                                  }
                                },
                              );
                            },
                            child: Text('Add to Build')),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nama RAM",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data6[global.idDetail].namaRam + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Memory Type",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data6[global.idDetail].memoryType + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Memory Size",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data6[global.idDetail].memorySize + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Memory Speed",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data6[global.idDetail].memorySpeed + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merek RAM",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data6[global.idDetail].merkRam + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Color RAM",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data6[global.idDetail].color + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("RGB ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data6[global.idDetail].rgb + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Heat Spreader",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data6[global.idDetail].heatSpreader + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );
    } else if (global.namaPart == "Storage") {
      return data7.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 300,
                      child: ListTile(
                        //Text(questions[index])
                        title: Column(
                          children: <Widget>[
                            Image.network(data7[global.idDetail].imageLink),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        //subtitle: Text(penjelas[index]),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    //Text(questions[index])
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data7[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      100, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data7[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  if (global.sengDiganti == 1) {
                                    global.idStorageAdv = int.parse(
                                        data7[global.idDetail].idStorage);
                                    global.hargaStorage1 =
                                        int.parse(data7[global.idDetail].harga);
                                    global.wattStorage1 = int.parse(
                                        data7[global.idDetail].storageWatt);
                                  } else if (global.sengDiganti == 2) {
                                    global.idStorage2Adv = int.parse(
                                        data7[global.idDetail].idStorage);
                                    global.hargaStorage2 =
                                        int.parse(data7[global.idDetail].harga);
                                    global.wattStorage2 = int.parse(
                                        data7[global.idDetail].storageWatt);
                                  }
                                },
                              );
                            },
                            child: Text('Add to Build')),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nama Storage",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].namaStorage + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Type Storage",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].typeStorage + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merk Storage",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].merkStorage + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Storage Capacity",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].storageCapacity + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Read Speed",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].readSpeed + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Write Speed",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].writeSpeed + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Rpm",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].rpm + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Storage Watt",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].storageWatt + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Cache",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].cache + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Form Factor",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].formFactor + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Storage Interface",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data7[global.idDetail].storageInterface + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );
    } else if (global.namaPart == "PSU") {
      return data8.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 300,
                      child: ListTile(
                        //Text(questions[index])
                        title: Column(
                          children: <Widget>[
                            Image.network(data8[global.idDetail].imageLink),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        //subtitle: Text(penjelas[index]),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    //Text(questions[index])
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data8[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      100, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data8[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  global.idPsuAdv =
                                      int.parse(data8[global.idDetail].idPsu);
                                  global.hargaPsu =
                                      int.parse(data8[global.idDetail].harga);
                                },
                              );
                            },
                            child: Text('Add to Build')),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nama PSU",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].namaPsu + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Watt PSU",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].wattPsu + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merek PSU",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].merkPsu + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Modular",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].modular + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("ATX Connector",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].atxConnector + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("PCI-E Connector",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].pcieConnector + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Sata Connector",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].sataConnector + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Silent Mode",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].silentMode + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("RGB ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].rgb + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Fan Size",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].fanSize + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("PSU Color",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].colorPsu + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Form Factor",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data8[global.idDetail].formFactor + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );
    } else if (global.namaPart == "VGA") {
      return data9.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(167, 209, 206, 198))),
                    margin: EdgeInsets.all(40),
                    child: SizedBox(
                      height: 300,
                      child: ListTile(
                        title: Column(
                          children: <Widget>[
                            Image.network(data9[global.idDetail].imageLink),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        selected: true,
                        selectedTileColor: Color.fromARGB(221, 241, 237, 241),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      textBaseline: TextBaseline.alphabetic,
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                                child: Card(
                              color: Colors.green,
                              child: InkWell(
                                onTap: () async {
                                  final url = data9[global.idDetail].links;

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(
                                          "assets/img/tokopedia.png",
                                          width: 37,
                                          height: 37,
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Beli Part",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 233, 237, 240),

                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32.0)),
                                                  minimumSize: Size(
                                                      100, 30), //////// HERE
                                                ),
                                                onPressed: () async {},
                                                child: Text(
                                                    "Rp " +
                                                        data9[global.idDetail]
                                                            .harga
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 121, 119, 255),
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(100, 40), //////// HERE
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/build/advanced');
                              setState(
                                () {
                                  global.idVgaAdv =
                                      int.parse(data9[global.idDetail].idVga);
                                  global.hargaVga =
                                      int.parse(data9[global.idDetail].harga);
                                  global.wattVga = int.parse(
                                      data9[global.idDetail].powerConsumption);
                                },
                              );
                            },
                            child: Text('Add to Build')),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nama VGA",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].namaVga + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Merek VGA",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].merkVga + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Architecture",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].architecture + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Clocks",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(
                            data9[global.idDetail].baseClocks +
                                " to " +
                                data9[global.idDetail].boostClock +
                                "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Memory Clock",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].memoryClock + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Memory Type",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].memoryType + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Memory VGA",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].memoryVga + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Memory Bus",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].memoryBus + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("VGA Interface",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].vgaInterface + "\n",
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Output Port",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].outputPort + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Power Connection",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].powerConnection + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Power Consumption",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].powerConsumption + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Graphic Api",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].graphicApi + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Dimension VGA",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].dimensionVga + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Display Technology",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].displayTechnology + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Generation",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].generation + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("Year",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].releaseDate + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("RGB ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].rgb + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                        Text("RTCores",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffD7D7D7))),
                        Text(data9[global.idDetail].rTcores + "\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Color(0xffD7D7D7))),
                      ],
                    ),
                  ),
                ),
              ],
            );
    } else {
      return Scaffold(
          body: Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      ));
    }
  }
}

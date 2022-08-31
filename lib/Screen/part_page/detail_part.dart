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
    if (global.nama_part == "Casing") {
      data = fetchCasing();
      data.then((value) => setState(() {
            data1 = value;
            //ListCasing(data1);
          }));
    } else if (global.nama_part == "CPU Cooler") {
      data = fetchCpuCooler();
      data.then((value) => setState(() {
            data2 = value;
            // /ListCpu_cooler(data2);
          }));
    } else if (global.nama_part == "CPU") {
      data = fetchCpu();
      data.then((value) => setState(() {
            data3 = value;
          }));
    } else if (global.nama_part == "Fan") {
      data = fetchFan();
      data.then((value) => setState(() {
            data4 = value;
          }));
    } else if (global.nama_part == "Motherboard") {
      data = fetchMotherboard();
      data.then((value) => setState(() {
            data5 = value;
          }));
    } else if (global.nama_part == "Ram") {
      data = fetchRam();
      data.then((value) => setState(() {
            data6 = value;
          }));
    } else if (global.nama_part == "Storage") {
      data = fetchStorage();
      data.then((value) => setState(() {
            data7 = value;
          }));
    } else if (global.nama_part == "PSU") {
      data = fetchPsu();
      data.then((value) => setState(() {
            data8 = value;
          }));
    } else if (global.nama_part == "VGA") {
      data = fetchVga();
      data.then((value) => setState(() {
            data9 = value;
          }));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getlistPart(),
    );
  }

  Widget getlistPart() {
    if (global.nama_part == "Casing") {
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
          title: Text('Casing Detail'),
        ),
        body: data1.length == 0
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
                              Image.network(data1[global.id_detail].imageLink),
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
                                    final url = data1[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        100, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data1[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    global.id_case_adv = int.parse(
                                        data1[global.id_detail].idCasing);
                                    global.hargacase = int.parse(
                                        data1[global.id_detail].harga);
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
                          Text(data1[global.id_detail].namaCasing + "\n",
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
                          Text(data1[global.id_detail].merkCasing + "\n",
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
                          Text(data1[global.id_detail].casingSidePanel + "\n",
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
                          Text(data1[global.id_detail].colorCasing + "\n",
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
                          Text(data1[global.id_detail].dimensionCasing + "\n",
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
                          Text(data1[global.id_detail].drivebayCasing + "\n",
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
                          Text(data1[global.id_detail].fanSupport + "\n",
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
                          Text(data1[global.id_detail].frontPanel + "\n",
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
                          Text(data1[global.id_detail].maxCoolerHeight + "\n",
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
                          Text(data1[global.id_detail].maxPsu + "\n",
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
                          Text(data1[global.id_detail].maxVgaLength + "\n",
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
                          Text(data1[global.id_detail].weightCasing + "\n",
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
                          Text(data1[global.id_detail].moboCompatible + "\n",
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
                          Text(data1[global.id_detail].maxVgaLength + "\n",
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
                          Text(data1[global.id_detail].fanSupport + "\n",
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
              ),
      );

      //cpucooler
    } else if (global.nama_part == "CPU Cooler") {
      return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/cooler');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('CPU Cooler Detail'),
        ),
        body: data2.length == 0
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
                              Image.network(data2[global.id_detail].imageLink),
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
                                    final url = data2[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        100, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data2[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    global.id_cpu_cooler_adv = int.parse(
                                        data2[global.id_detail].idCooler);
                                    global.hargacooler = int.parse(
                                        data2[global.id_detail].harga);
                                    global.wattcooler = int.parse(
                                        data2[global.id_detail].powerCooler);
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
                          Text(data2[global.id_detail].namaCooler + "\n",
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
                          Text(data2[global.id_detail].merkCooler + "\n",
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
                          Text(data2[global.id_detail].powerCooler + "\n",
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
                          Text(data2[global.id_detail].rgb + "\n",
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
                          Text(data2[global.id_detail].socketCooler + "\n",
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
                          Text(data2[global.id_detail].typeCooler + "\n",
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
                          Text(data2[global.id_detail].fanQuantity + "\n",
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
                          Text(data2[global.id_detail].fanSpeed + "\n",
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
                          Text(data2[global.id_detail].colorCooler + "\n",
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
                          Text(data2[global.id_detail].dimensionCooler + "\n",
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
              ),
      );

      //cpu
    } else if (global.nama_part == "CPU") {
      return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/cpu');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('CPU Detail'),
        ),
        body: data3.length == 0
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
                              Image.network(data3[global.id_detail].imageLink),
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
                                    final url = data3[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        110, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data3[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    global.id_cpu_adv = int.parse(
                                        data3[global.id_detail].idCpu);
                                    global.socket_cpu =
                                        data3[global.id_detail].socket;
                                    global.hargacpu = int.parse(
                                        data3[global.id_detail].harga);
                                    global.wattcpu = int.parse(
                                        data3[global.id_detail].defaultTdp);
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
                                    global.id_compare1 = int.parse(
                                        data3[global.id_detail].idCpu);
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
                          Text(data3[global.id_detail].namaCpu + "\n",
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
                          Text(data3[global.id_detail].merkCpu + "\n",
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
                          Text(data3[global.id_detail].procTechnology + "\n",
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
                              data3[global.id_detail].coreCount +
                                  "/" +
                                  data3[global.id_detail].threadsCount +
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
                              data3[global.id_detail].baseClock +
                                  " to " +
                                  data3[global.id_detail].maxClock +
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
                          Text(data3[global.id_detail].socket + "\n",
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
                          Text(data3[global.id_detail].launchDate + "\n",
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
                          Text(data3[global.id_detail].cache + "\n",
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
                          Text(data3[global.id_detail].procTechnology + "\n",
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
                          Text(data3[global.id_detail].defaultTdp + "\n",
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
                          Text(data3[global.id_detail].maxTemp + "\n",
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
                          Text(data3[global.id_detail].unlocked + "\n",
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
              ),
      );
    } else if (global.nama_part == "Fan") {
      return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/fan');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('Fan Detail'),
        ),
        body: data4.length == 0
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
                              Image.network(data4[global.id_detail].imageLinks),
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
                                    final url = data4[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        100, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data4[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    if (global.seng_diganti == 1) {
                                      global.id_fan_adv = int.parse(
                                          data4[global.id_detail].idFans);
                                      global.hargafan1 = int.parse(
                                          data4[global.id_detail].harga);
                                      global.wattfan1 = int.parse(
                                          data4[global.id_detail].powerFans);
                                    } else if (global.seng_diganti == 2) {
                                      global.id_fan2_adv = int.parse(
                                          data4[global.id_detail].idFans);
                                      global.hargafan2 = int.parse(
                                          data4[global.id_detail].harga);
                                      global.wattfan2 = int.parse(
                                          data4[global.id_detail].powerFans);
                                    } else if (global.seng_diganti == 3) {
                                      global.id_fan3_adv = int.parse(
                                          data4[global.id_detail].idFans);
                                      global.hargafan3 = int.parse(
                                          data4[global.id_detail].harga);
                                      global.wattfan3 = int.parse(
                                          data4[global.id_detail].powerFans);
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
                          Text(data4[global.id_detail].namaFans + "\n",
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
                          Text(data4[global.id_detail].merkFans + "\n",
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
                          Text(data4[global.id_detail].powerConnector + "\n",
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
                          Text(data4[global.id_detail].speedFans + "\n",
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
                          Text(data4[global.id_detail].sizeFans + "\n",
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
                          Text(data4[global.id_detail].colorFans + "\n",
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
                          Text(data4[global.id_detail].rgb + "\n",
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
                          Text(data4[global.id_detail].powerFans + "\n",
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
                          Text(data4[global.id_detail].voltageFans + "\n",
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
              ),
      );
    } else if (global.nama_part == "Motherboard") {
      return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/motherboard');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('Motherboard Detail'),
        ),
        body: data5.length == 0
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
                              Image.network(data5[global.id_detail].imageLink),
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
                                    final url = data5[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        100, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data5[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    global.id_mobo_adv = int.parse(
                                        data5[global.id_detail].idMotherboard);
                                    global.socket_mobo =
                                        data5[global.id_detail].socketMobo;
                                    global.hargamobo = int.parse(
                                        data5[global.id_detail].harga);
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(data5[global.id_detail].namaMobo + "\n",
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
                          Text(data5[global.id_detail].merkMobo + "\n",
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
                          Text(data5[global.id_detail].socketMobo + "\n",
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
                          Text(data5[global.id_detail].memoryType + "\n",
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
                          Text(data5[global.id_detail].slotMemory + "\n",
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
                          Text(data5[global.id_detail].m2Slot + "\n",
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
                          Text(data5[global.id_detail].sataSlot + "\n",
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
                          Text(data5[global.id_detail].usbPort + "\n",
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
                          Text(data5[global.id_detail].audioPort + "\n",
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
                          Text(data5[global.id_detail].lanPort + "\n",
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
                          Text(data5[global.id_detail].formFactor + "\n",
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
                          Text(data5[global.id_detail].displayOutput + "\n",
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
                          Text(data5[global.id_detail].pcIgen + "\n",
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
                          Text(data5[global.id_detail].pcie + "\n",
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
                          Text(data5[global.id_detail].rgb + "\n",
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
                          Text(data5[global.id_detail].warna + "\n",
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
                          Text(data5[global.id_detail].chipsetMobo + "\n",
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
              ),
      );
    } else if (global.nama_part == "Ram") {
      return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/ram');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('RAM Detail'),
        ),
        body: data6.length == 0
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
                              Image.network(data6[global.id_detail].imageLink),
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
                                    final url = data6[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        100, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data6[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    if (global.seng_diganti == 1) {
                                      global.id_ram_adv = int.parse(
                                          data6[global.id_detail].idRam);
                                      global.hargaram1 = int.parse(
                                          data6[global.id_detail].harga);
                                      global.wattram1 = 5;
                                    } else {
                                      global.id_ram2_adv = int.parse(
                                          data6[global.id_detail].idRam);
                                      global.hargaram2 = int.parse(
                                          data6[global.id_detail].harga);
                                      global.wattram2 = 5;
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
                          Text(data6[global.id_detail].namaRam + "\n",
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
                          Text(data6[global.id_detail].memoryType + "\n",
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
                          Text(data6[global.id_detail].memorySize + "\n",
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
                          Text(data6[global.id_detail].memorySpeed + "\n",
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
                          Text(data6[global.id_detail].merkRam + "\n",
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
                          Text(data6[global.id_detail].color + "\n",
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
                          Text(data6[global.id_detail].rgb + "\n",
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
                          Text(data6[global.id_detail].heatSpreader + "\n",
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
              ),
      );
    } else if (global.nama_part == "Storage") {
      return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/storage');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('Storage Detail'),
        ),
        body: data7.length == 0
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
                              Image.network(data7[global.id_detail].imageLink),
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
                                    final url = data7[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        100, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data7[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    if (global.seng_diganti == 1) {
                                      global.id_storage_adv = int.parse(
                                          data7[global.id_detail].idStorage);
                                      global.hargastorage1 = int.parse(
                                          data7[global.id_detail].harga);
                                      global.wattstorage1 = int.parse(
                                          data7[global.id_detail].storageWatt);
                                    } else if (global.seng_diganti == 2) {
                                      global.id_storage2_adv = int.parse(
                                          data7[global.id_detail].idStorage);
                                      global.hargastorage2 = int.parse(
                                          data7[global.id_detail].harga);
                                      global.wattstorage2 = int.parse(
                                          data7[global.id_detail].storageWatt);
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
                          Text(data7[global.id_detail].namaStorage + "\n",
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
                          Text(data7[global.id_detail].typeStorage + "\n",
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
                          Text(data7[global.id_detail].merkStorage + "\n",
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
                          Text(data7[global.id_detail].storageCapacity + "\n",
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
                          Text(data7[global.id_detail].readSpeed + "\n",
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
                          Text(data7[global.id_detail].writeSpeed + "\n",
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
                          Text(data7[global.id_detail].rpm + "\n",
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
                          Text(data7[global.id_detail].storageWatt + "\n",
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
                          Text(data7[global.id_detail].cache + "\n",
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
                          Text(data7[global.id_detail].formFactor + "\n",
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
                          Text(data7[global.id_detail].storageInterface + "\n",
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
              ),
      );
    } else if (global.nama_part == "PSU") {
      return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/psu');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('PSU Detail'),
        ),
        body: data8.length == 0
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
                              Image.network(data8[global.id_detail].imageLink),
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
                                    final url = data8[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        100, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data8[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    global.id_psu_adv = int.parse(
                                        data8[global.id_detail].idPsu);
                                    global.hargapsu = int.parse(
                                        data8[global.id_detail].harga);
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
                          Text(data8[global.id_detail].namaPsu + "\n",
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
                          Text(data8[global.id_detail].wattPsu + "\n",
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
                          Text(data8[global.id_detail].merkPsu + "\n",
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
                          Text(data8[global.id_detail].modular + "\n",
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
                          Text(data8[global.id_detail].atxConnector + "\n",
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
                          Text(data8[global.id_detail].pcieConnector + "\n",
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
                          Text(data8[global.id_detail].sataConnector + "\n",
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
                          Text(data8[global.id_detail].silentMode + "\n",
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
                          Text(data8[global.id_detail].rgb + "\n",
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
                          Text(data8[global.id_detail].fanSize + "\n",
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
                          Text(data8[global.id_detail].colorPsu + "\n",
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
                          Text(data8[global.id_detail].formFactor + "\n",
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
              ),
      );
    } else if (global.nama_part == "VGA") {
      return Scaffold(
        backgroundColor: Color(0xff342C4C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part/list/vga');
              },
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: Text('VGA Detail'),
        ),
        body: data9.length == 0
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
                              Image.network(data9[global.id_detail].imageLink),
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
                                    final url = data9[global.id_detail].links;

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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 233, 237, 240),

                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0)),
                                                    minimumSize: Size(
                                                        100, 30), //////// HERE
                                                  ),
                                                  onPressed: () async {},
                                                  child: Text(
                                                      "Rp " +
                                                          data9[global
                                                                  .id_detail]
                                                              .harga
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
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
                                    global.id_vga_adv = int.parse(
                                        data9[global.id_detail].idVga);
                                    global.hargavga = int.parse(
                                        data9[global.id_detail].harga);
                                    global.wattvga = int.parse(
                                        data9[global.id_detail]
                                            .powerConsumption);
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
                          Text(data9[global.id_detail].namaVga + "\n",
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
                          Text(data9[global.id_detail].merkVga + "\n",
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
                          Text(data9[global.id_detail].architecture + "\n",
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
                              data9[global.id_detail].baseClocks +
                                  " to " +
                                  data9[global.id_detail].boostClock +
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
                          Text(data9[global.id_detail].memoryClock + "\n",
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
                          Text(data9[global.id_detail].memoryType + "\n",
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
                          Text(data9[global.id_detail].memoryVga + "\n",
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
                          Text(data9[global.id_detail].memoryBus + "\n",
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
                          Text(data9[global.id_detail].vgaInterface + "\n",
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
                          Text(data9[global.id_detail].outputPort + "\n",
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
                          Text(data9[global.id_detail].powerConnection + "\n",
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
                          Text(data9[global.id_detail].powerConsumption + "\n",
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
                          Text(data9[global.id_detail].graphicApi + "\n",
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
                          Text(data9[global.id_detail].dimensionVga + "\n",
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
                          Text(data9[global.id_detail].displayTechnology + "\n",
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
                          Text(data9[global.id_detail].generation + "\n",
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
                          Text(data9[global.id_detail].releaseDate + "\n",
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
                          Text(data9[global.id_detail].rgb + "\n",
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
                          Text(data9[global.id_detail].rTcores + "\n",
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
              ),
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

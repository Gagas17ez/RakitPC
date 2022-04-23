import 'package:flutter/material.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:rakit_pc/Models/models_vga.dart';

import 'package:rakit_pc/Screen/build_advanced/build_advanced_new.dart';

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
  const DetailPart({Key? key}) : super(key: key);

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

  void initState() {
    if (global.nama_part == "Casing") {
      data = fetch_casing();
      data.then((value) => setState(() {
            data1 = value;
            //ListCasing(data1);
          }));
    } else if (global.nama_part == "CPU Cooler") {
      data = fetch_cpu_cooler();
      data.then((value) => setState(() {
            data2 = value;
            // /ListCpu_cooler(data2);
          }));
    } else if (global.nama_part == "CPU") {
      data = fetch_cpu();
      data.then((value) => setState(() {
            data3 = value;
          }));
    } else if (global.nama_part == "Fan") {
      data = fetch_fan();
      data.then((value) => setState(() {
            data4 = value;
          }));
    } else if (global.nama_part == "Motherboard") {
      data = fetch_motherboard();
      data.then((value) => setState(() {
            data5 = value;
          }));
    } else if (global.nama_part == "Ram") {
      data = fetch_ram();
      data.then((value) => setState(() {
            data6 = value;
          }));
    } else if (global.nama_part == "Storage") {
      data = fetch_storage();
      data.then((value) => setState(() {
            data7 = value;
          }));
    } else if (global.nama_part == "PSU") {
      data = fetch_psu();
      data.then((value) => setState(() {
            data8 = value;
          }));
    } else if (global.nama_part == "VGA") {
      data = fetch_vga();
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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
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
                              Text("Nama Casing",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_case_adv = int.parse(
                                            data1[global.id_detail].idCasing);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data1[global.id_detail].namaCasing + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek Casing",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].merkCasing + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Casing Side Panel",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].casingSidePanel + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Color Casing",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].colorCasing + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Dimension Casing",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].dimensionCasing + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Drivebay Casing",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].drivebayCasing + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Fan Support",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].fanSupport + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Panel Depan Casing",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].frontPanel + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Tinggi Max Cooler",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].maxCoolerHeight + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Max PSU",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].maxPsu + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Panjang Max VGA",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].maxVgaLength + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Berat Casing",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data1[global.id_detail].weightCasing + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
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
                        height: 200,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Text("Motherboard Compatible",
                                  style: TextStyle(fontSize: 20)),
                              Text(data1[global.id_detail].moboCompatible,
                                  style: TextStyle(fontSize: 14))
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    } else if (global.nama_part == "CPU Cooler") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
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
                              Text("Nama CPUCooler",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(20, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_case_adv = int.parse(
                                            data2[global.id_detail].idCooler);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data2[global.id_detail].namaCooler + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek CPU Cooler",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].merkCooler + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Power CPU Cooler",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].powerCooler + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("RGB CPU Cooler",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].rgb + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Socket CPU Cooler",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].socketCooler + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Type CPU Cooler",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].typeCooler + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Fan Quantitiy",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].fanQuantity + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Fan Speed",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].fanSpeed + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Color CPU Cooler",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].colorCooler + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Dimension CPU Cooler",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data2[global.id_detail].dimensionCooler + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    } else if (global.nama_part == "CPU") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
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
                              Text("Nama CPU",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_cpu_adv = int.parse(
                                            data3[global.id_detail].idCpu);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data3[global.id_detail].namaCpu + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek CPU",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data3[global.id_detail].merkCpu + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Proc Technology",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data3[global.id_detail].procTechnology + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Cores/Threads",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(
                              data3[global.id_detail].coreCount +
                                  "/" +
                                  data3[global.id_detail].threadsCount +
                                  "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Clock Speed",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(
                              data3[global.id_detail].baseClock +
                                  " to " +
                                  data3[global.id_detail].maxClock +
                                  "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Motherboard Socket",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data3[global.id_detail].socket + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Release Year",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data3[global.id_detail].launchDate + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Cache", style: TextStyle(fontSize: 20)),
                          Text(data3[global.id_detail].cache,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
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
                        height: 200,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Text("Default TDP",
                                  style: TextStyle(fontSize: 20)),
                              Text(data3[global.id_detail].defaultTdp,
                                  style: TextStyle(fontSize: 14)),
                              Text("Max Temp", style: TextStyle(fontSize: 20)),
                              Text(data3[global.id_detail].maxTemp,
                                  style: TextStyle(fontSize: 14)),
                              Text("Unlocked", style: TextStyle(fontSize: 20)),
                              Text(data3[global.id_detail].unlocked,
                                  style: TextStyle(fontSize: 14))
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    } else if (global.nama_part == "Fan") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
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
                              Text("Nama Fan",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_fan_adv = int.parse(
                                            data4[global.id_detail].idFans);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data4[global.id_detail].namaFans + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek Fan",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data4[global.id_detail].merkFans + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Power Connector",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data4[global.id_detail].powerConnector + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Speed Fan",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data4[global.id_detail].speedFans + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Size Fan",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data4[global.id_detail].sizeFans + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Color Fan",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data4[global.id_detail].colorFans + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("RGB Fan",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data4[global.id_detail].rgb + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
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
                        height: 200,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Text("Voltage Fan",
                                  style: TextStyle(fontSize: 20)),
                              Text(data4[global.id_detail].voltageFans,
                                  style: TextStyle(fontSize: 14))
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    } else if (global.nama_part == "Motherboard") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                              Text("Nama Motherboard",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_mobo_adv = int.parse(
                                            data5[global.id_detail]
                                                .idMotherboard);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data5[global.id_detail].namaMobo + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek Motherboard",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].merkMobo + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Memory Type",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].memoryType + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Memory Slot ",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].slotMemory + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("M2 Slot",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].m2Slot + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Sata Slot",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].sataSlot + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("USB Port",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].usbPort + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Audio Port",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].audioPort + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("LAN Port",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].lanPort + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Form Factor",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].formFactor + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Display Output",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].displayOutput + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("PC I Gen",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].pcIgen + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("PC I e",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].pcie + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("RGB Motherboard",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].rgb + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Warna MotherBoard",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data5[global.id_detail].warna + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
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
                        height: 200,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Text("Chipset Mobo",
                                  style: TextStyle(fontSize: 20)),
                              Text(data5[global.id_detail].chipsetMobo,
                                  style: TextStyle(fontSize: 14))
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    } else if (global.nama_part == "Ram") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
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
                              Text("Nama RAM",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_ram_adv = int.parse(
                                            data6[global.id_detail].idRam);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data6[global.id_detail].namaRam + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek RAM",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data6[global.id_detail].merkRam + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Color RAM",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data6[global.id_detail].color + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("RGB ",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data6[global.id_detail].rgb + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Heat Spreader",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data6[global.id_detail].heatSpreader + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
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
                        height: 200,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Text("Memory Type",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Text(data6[global.id_detail].memoryType + "\n",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14)),
                              Text("Memory Size",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Text(data6[global.id_detail].memorySize + "\n",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14)),
                              Text("Memory Speed",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Text(data6[global.id_detail].memorySpeed + "\n",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14)),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    } else if (global.nama_part == "Storage") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
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
                              Text("Nama Storage",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_storage_adv = int.parse(
                                            data7[global.id_detail].idStorage);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data7[global.id_detail].namaStorage + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek Storage",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].merkStorage + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Read Speed",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].readSpeed + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Rpm",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].rpm + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek Storage",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].writeSpeed + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Storage Capacity",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].storageCapacity + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Storage Watt",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].storageWatt + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Type Storage",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].typeStorage + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Cache",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].cache + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Form Factor",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data7[global.id_detail].formFactor + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
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
                        height: 200,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Text("Storage Interface",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Text(
                                  data7[global.id_detail].storageInterface +
                                      "\n",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14)),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    } else if (global.nama_part == "PSU") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
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
                              Text("Nama PSU",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_psu_adv = int.parse(
                                            data8[global.id_detail].idPsu);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data8[global.id_detail].namaPsu + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek PSU",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].merkPsu + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("RGB ",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].rgb + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("PSU Color",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].colorPsu + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Modular",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].modular + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("PC IE Connector",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].pcieConnector + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Sata Connector",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].sataConnector + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Watt PSU",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].wattPsu + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Silent Mode",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].silentMode + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("ATX Connector",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].atxConnector + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Form Factor",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data8[global.id_detail].formFactor + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
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
                        height: 200,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Text("Fan Size",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Text(data8[global.id_detail].fanSize + "\n",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14)),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    } else if (global.nama_part == "VGA") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPart()),
                );
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
                        height: 350,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
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
                              Text("Nama VGA",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize:
                                        const Size(100, 40), //////// HERE
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              buildpc_advanced()),
                                    );
                                    setState(
                                      () {
                                        global.id_vga_adv = int.parse(
                                            data9[global.id_detail].idVga);
                                      },
                                    );
                                  },
                                  child: const Text('Add to Build')),
                            ],
                          ),
                          Text(data9[global.id_detail].namaVga + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Merek VGA",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].merkVga + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Architecture",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].architecture + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("RGB ",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].rgb + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("RTCores",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].rTcores + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Clocks",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(
                              data9[global.id_detail].baseClocks +
                                  " to " +
                                  data9[global.id_detail].boostClock +
                                  "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Memory Clock",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].memoryClock + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Memory Type",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].memoryType + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Memory VGA",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].memoryVga + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Memory Bus",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].memoryBus + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Output Port",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].outputPort + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Power Connection",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].powerConnection + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Power Consumption",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].powerConsumption + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Graphic Api",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].graphicApi + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Dimension VGA",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].dimensionVga + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Display Technology",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].displayTechnology + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("generation",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].generation + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                          Text("Year",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20)),
                          Text(data9[global.id_detail].releaseDate + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
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
                        height: 200,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Text("VGA Interface",
                                  style: TextStyle(fontSize: 20)),
                              Text(data9[global.id_detail].vgaInterface,
                                  style: TextStyle(fontSize: 14))
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        textBaseline: TextBaseline.alphabetic,
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/shoppe.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/tokopedia.png",
                                width: 50,
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 233, 237, 240),
                                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        minimumSize:
                                            const Size(100, 30), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: const Text('IDR 1 Rupiah')),
                                  Text("Tersedia"),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.greenAccent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize:
                                        const Size(60, 40), //////// HERE
                                  ),
                                  onPressed: () {},
                                  child: const Text('Beli')),
                            ],
                          ),
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
          color: Colors.black,
        ),
      ));
    }
  }
}

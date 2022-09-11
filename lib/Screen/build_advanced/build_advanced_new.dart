// ignore_for_file: avoid_unnecessary_containers, unnecessary_null_comparison, unnecessary_const
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Api/api_casing_id.dart';
import 'package:rakit_pc/Api/api_cpu_cooler_id.dart';
import 'package:rakit_pc/Api/api_cpu_id.dart';
import 'package:rakit_pc/Api/api_motherboard_id.dart';
import 'package:rakit_pc/Api/api_psu_id.dart';
import 'package:rakit_pc/Api/api_ram_id.dart';
import 'package:rakit_pc/Api/api_storage_id.dart';
import 'package:rakit_pc/Api/api_vga_id.dart';
import 'package:rakit_pc/Api/api_fan_id.dart';
import 'package:rakit_pc/Models/models_casing.dart';
import 'package:rakit_pc/Models/models_cpu.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:rakit_pc/Models/models_vga.dart';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/Models/models_simpan_build.dart';
import 'package:rakit_pc/my_sqf_lite.dart';

void main() {
  runApp(BuildAdvanced());
}

class BuildAdvanced extends StatefulWidget {
  const BuildAdvanced({Key? key}) : super(key: key);

  @override
  State<BuildAdvanced> createState() => _BuildAdvancedState();
}

class _BuildAdvancedState extends State<BuildAdvanced> {
  String cpuSocket = "";
  String moboSocket = "";
  String messageCompability = "";
  var formatter = NumberFormat('#,###,000');

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setState(() {
      global.hargaHarga = global.hargaCase +
          global.hargaCooler +
          global.hargaCpu +
          global.hargaVga +
          global.hargaFan1 +
          global.hargaFan2 +
          global.hargaFan3 +
          global.hargaMobo +
          global.hargaPsu +
          global.hargaRam1 +
          global.hargaRam2 +
          global.hargaStorage1 +
          global.hargaStorage2;
      global.wattTotal = global.wattCooler +
          global.wattCpu +
          global.wattVga +
          global.wattCooler +
          global.wattFan1 +
          global.wattFan2 +
          global.wattFan3 +
          global.wattRam1 +
          global.wattRam2 +
          global.wattStorage1 +
          global.wattStorage2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff342C4C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Sistem Pembangun Komputer',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          kotakCompability(),
          const SizedBox(
            width: 30,
            height: 30,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Total Harga : ',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                  "Rp " +
                      formatter.format(int.parse(global.hargaHarga.toString())),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ]),
          const SizedBox(
            width: 30,
            height: 30,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Casing',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: const Divider(
                        color: Colors.white,
                        height: 25,
                        thickness: 3,
                      ),
                    ),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.idCaseAdv = 0;
                        global.hargaCase = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getcasing()],
            ),
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'CPU',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.idCpuAdv = 0;
                        global.hargaCpu = 0;
                        global.wattCpu = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [getcpuwoi()],
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'CPU Cooler',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.idCpuCoolerAdv = 0;
                        global.hargaCooler = 0;
                        global.wattCooler = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getcpucooler()],
            ),
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Motherboard',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.idMoboAdv = 0;
                        global.hargaMobo = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getmobo()],
            ),
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Power Supply',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.hargaPsu = 0;
                        global.idPsuAdv = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getpower()],
            ),
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'RAM',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.idRamAdv = 0;
                        global.idRam2Adv = 0;
                        global.hargaRam1 = 0;
                        global.hargaRam2 = 0;

                        global.wattRam1 = 0;
                        global.wattRam2 = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getram(), getramAgain()],
            ),
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Storage',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.idStorageAdv = 0;
                        global.idStorage2Adv = 0;
                        global.hargaStorage1 = 0;
                        global.hargaStorage2 = 0;
                        global.wattStorage1 = 0;
                        global.wattStorage2 = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getstorage(), getstorageAgain()],
            ),
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'VGA',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.idVgaAdv = 0;
                        global.hargaVga = 0;
                        global.wattVga = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getvga()],
            ),
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Fan',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.idFanAdv = 0;
                        global.idFan2Adv = 0;
                        global.idFan3Adv = 0;
                        global.hargaFan1 = 0;
                        global.hargaFan2 = 0;
                        global.hargaFan3 = 0;
                        global.wattFan1 = 0;
                        global.wattFan2 = 0;
                        global.wattFan3 = 0;

                        init();
                      });
                    },
                  )
                ],
              )),
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [getfan(), getfanAgain(), getfanAgainAgain()]),
          ),
          const SizedBox(
            width: 30,
            height: 40,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: ElevatedButton(
                    onPressed: () {
                      _onSaveBuild();
                      Navigator.pushNamed(context, '/history');
                    },
                    child: Text('Simpan Build',
                        style: GoogleFonts.poppins(
                            color: HexColor("#9997FF"),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      // primary: Colors.white,
                      // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.89),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/build');
        },
        backgroundColor: HexColor("#7A77FF"),
        child: const Icon(
          Icons.build,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }

  _onSaveBuild() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if ((global.idCaseAdv != null) &&
        (global.idCpuAdv != null) &&
        (global.idVgaAdv != null)) {
      await MySqflite.instance.insertBuild(SimpanBuild(
        compatible: global.compatible,
        // harga: global.hargacooler + global.hargacase,
        harga: (global.hargaCase +
            global.hargaVga +
            global.hargaCooler +
            global.hargaCpu +
            global.hargaFan1 +
            global.hargaFan2 +
            global.hargaFan3 +
            global.hargaMobo +
            global.hargaPsu +
            global.hargaRam1 +
            global.hargaRam2 +
            global.hargaStorage1 +
            global.hargaStorage2),
        waktu: DateTime.now().toString(),
        idCasing: global.idCaseAdv,
        idCpu: global.idCpuAdv,
        idCpuCooler: global.idCpuCoolerAdv,
        idMotherboard: global.idMoboAdv,
        idPsu: global.idPsuAdv,
        idRam1: global.idRamAdv,
        idRam2: global.idRam2Adv,
        idStorage1: global.idStorageAdv,
        idStorage2: global.idStorage2Adv,
        idVga: global.idVgaAdv,
        idFan1: global.idFanAdv,
        idFan2: global.idFan2Adv,
        idFan3: global.idFan3Adv,
      ));
    }
  }

  Widget getcasing() {
    if (global.idCaseAdv != 0) {
      return FutureBuilder(
          future: fetchCasingId(global.idCaseAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    Casing casinggan = snapshot.data[index];

                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/casing');
                              setState(
                                () {
                                  global.namaPart = "Casing";
                                },
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    child: Image.network(
                                      casinggan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    casinggan.namaCasing,
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter
                                              .format(
                                                  int.parse(casinggan.harga))
                                              .toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          // ignore: prefer__ructors
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/casing');
            setState(
              () {
                global.namaPart = "Casing";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih Casing',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget kotakCompability() {
    setState(() {
      global.compatible = "All parts compatible";
    });
    if ((global.socketCpu.toLowerCase() != global.socketMobo.toLowerCase()) ||
        (global.idRamAdv != global.idRam2Adv &&
            global.idRamAdv != 0 &&
            global.idRam2Adv != 0)) {
      setState(() {
        global.compatible = "Some part Incompatible";
      });
      if (global.socketCpu.toLowerCase() != global.socketMobo.toLowerCase()) {
        messageCompability +=
            "- CPU tidak kompatible dengan motherboard pilihan\n";
      }
      if (global.idRamAdv != global.idRam2Adv) {
        messageCompability +=
            "- Single atau Ram yang berbeda bisa menimbulkan error\n";
      }

      return Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            margin: const EdgeInsets.all(0.0),
            color: HexColor("#d62828"),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  leading: const Icon(
                    Icons.clear_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                  title: Text('Compatiblity : ',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  subtitle: Text(messageCompability,
                      style: GoogleFonts.poppins(
                          color: const Color(0xffffba08),
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            margin: const EdgeInsets.all(0.0),
            color: HexColor("#2C85C5"),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                  title: Text(
                      'Perkiraan Watt : ' + global.wattTotal.toString() + "W",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          margin: const EdgeInsets.all(0.0),
          color: HexColor("#00B16A"),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                dense: true,
                leading: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.white,
                ),
                title: Text('Compatiblity : ',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                subtitle: Text('Tidak ada isu atau masalah ditemukan.',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          margin: const EdgeInsets.all(0.0),
          color: HexColor("#2C85C5"),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.offline_bolt_outlined,
                  color: Colors.white,
                ),
                title: Text(
                    'Perkiraan Watt : ' + global.wattTotal.toString() + "W",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getfan() {
    if (global.idFanAdv != 0) {
      return FutureBuilder(
          future: fetchFanId(global.idFanAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Fan fangan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/fan');
                              setState(
                                () {
                                  global.sengDiganti = 1;
                                  global.namaPart = "Fan";
                                  global.hargaFan1 = int.parse(fangan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(4.0)),
                                    child: Image.network(
                                      fangan.imageLinks,
                                    ),
                                  ),
                                  title: Text(
                                    fangan.namaFans,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              fangan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.sengDiganti = 1;
                global.namaPart = "Fan";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih Fan',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getfanAgain() {
    if (global.idFan2Adv != 0) {
      return FutureBuilder(
          future: fetchFanId(global.idFan2Adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Fan fangan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/fan');
                              setState(
                                () {
                                  global.sengDiganti = 2;
                                  global.namaPart = "Fan";
                                  global.hargaFan1 = int.parse(fangan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      fangan.imageLinks,
                                    ),
                                  ),
                                  title: Text(
                                    fangan.namaFans,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              fangan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.sengDiganti = 2;
                global.namaPart = "Fan";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih Fan',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getfanAgainAgain() {
    if (global.idFan3Adv != 0) {
      return FutureBuilder(
          future: fetchFanId(global.idFan3Adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Fan fangan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/fan');
                              setState(
                                () {
                                  global.sengDiganti = 3;
                                  global.namaPart = "Fan";
                                  global.hargaFan3 = int.parse(fangan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      fangan.imageLinks,
                                    ),
                                  ),
                                  title: Text(
                                    fangan.namaFans,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              fangan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.sengDiganti = 3;
                global.namaPart = "Fan";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih Fan',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getcpuwoi() {
    if (global.idCpuAdv != 0) {
      return FutureBuilder(
          future: fetchCpuId(global.idCpuAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Cpu cpugan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/cpu');
                              setState(
                                () {
                                  global.namaPart = "CPU";
                                  global.hargaCpu =
                                      int.parse(cpugan.harga.toString());
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(cpugan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      cpugan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    cpugan.namaCpu,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              cpugan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/cpu');
            setState(
              () {
                global.namaPart = "CPU";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih CPU',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getcpucooler() {
    if (global.idCpuCoolerAdv != 0) {
      return FutureBuilder(
          future: fetchCpuCoolerId(global.idCpuCoolerAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    CpuCooler cpucoolergan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/cooler');
                              setState(
                                () {
                                  global.namaPart = "CPU Cooler";
                                  global.hargaCooler =
                                      int.parse(cpucoolergan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(cpucoolergan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      cpucoolergan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    cpucoolergan.namaCooler,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              cpucoolergan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/cooler');
            setState(
              () {
                global.namaPart = "CPU Cooler";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih CPU Cooler',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getmobo() {
    if (global.idMoboAdv != 0) {
      return FutureBuilder(
          future: fetchMotherboardId(global.idMoboAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Motherboard mobogan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/part/list/motherboard');
                              setState(
                                () {
                                  global.hargaMobo = int.parse(mobogan.harga);
                                  global.namaPart = "Motherboard";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(mobogan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      mobogan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    mobogan.namaMobo,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              mobogan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/motherboard');
            setState(
              () {
                global.namaPart = "Motherboard";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih Motherboard',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getpower() {
    if (global.idPsuAdv != 0) {
      return FutureBuilder(
          future: fetchPsuId(global.idPsuAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Psu psugan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/psu');
                              setState(
                                () {
                                  global.namaPart = "PSU";
                                  global.hargaPsu = int.parse(psugan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(psugan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      psugan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    psugan.namaPsu,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              psugan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/psu');
            setState(
              () {
                global.namaPart = "PSU";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih Power Supply',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getram() {
    if (global.idRamAdv != 0) {
      return FutureBuilder(
          future: fetchRamId(global.idRamAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Ram ramgan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/ram');
                              setState(
                                () {
                                  global.sengDiganti = 1;
                                  global.namaPart = "Ram";
                                  global.hargaRam1 = int.parse(ramgan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      ramgan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    ramgan.namaRam,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              ramgan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/ram');
            setState(
              () {
                global.sengDiganti = 1;
                global.namaPart = "Ram";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih RAM',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getramAgain() {
    if (global.idRam2Adv != 0) {
      return FutureBuilder(
          future: fetchRamId(global.idRam2Adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Ram ramgan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/ram');
                              setState(
                                () {
                                  global.sengDiganti = 2;
                                  global.namaPart = "Ram";
                                  global.hargaRam2 = int.parse(ramgan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      ramgan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    ramgan.namaRam,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              ramgan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/ram');
            setState(
              () {
                global.sengDiganti = 2;
                global.namaPart = "Ram";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih RAM',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getstorage() {
    if (global.idStorageAdv != 0) {
      return FutureBuilder(
          future: fetchStorageId(global.idStorageAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Storage storagegan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/part/list/storage');
                              setState(
                                () {
                                  global.sengDiganti = 1;
                                  global.namaPart = "Storage";
                                  global.hargaStorage1 =
                                      int.parse(storagegan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(storagegan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      storagegan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    storagegan.namaStorage,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              storagegan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/storage');
            setState(
              () {
                global.sengDiganti = 1;
                global.namaPart = "Storage";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih Storage',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getstorageAgain() {
    if (global.idStorage2Adv != 0) {
      return FutureBuilder(
          future: fetchStorageId(global.idStorage2Adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Storage storagegan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/part/list/storage');
                              setState(
                                () {
                                  global.sengDiganti = 2;
                                  global.namaPart = "Storage";
                                  global.hargaStorage2 =
                                      int.parse(storagegan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(storagegan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      storagegan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    storagegan.namaStorage,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              storagegan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/storage');
            setState(
              () {
                global.sengDiganti = 2;
                global.namaPart = "Storage";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih Storage',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getvga() {
    if (global.idVgaAdv != 0) {
      return FutureBuilder(
          future: fetchVgaId(global.idVgaAdv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Vga vgagan = snapshot.data[index];
                    return SizedBox(
                      width: 200,
                      height: 90,
                      child: Card(
                          color: Colors.transparent,
                          elevation: 00,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/vga');
                              setState(
                                () {
                                  global.namaPart = "VGA";
                                  global.hargaVga = 69;
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(vgagan.imageLink),
                                  selected: true,
                                  selectedTileColor: const Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(4.0)),
                                    child: Image.network(
                                      vgagan.imageLink,
                                    ),
                                  ),
                                  title: Text(
                                    vgagan.namaVga,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      "Rp " +
                                          formatter.format(int.parse(
                                              vgagan.harga.toString())),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/vga');
            setState(
              () {
                global.namaPart = "VGA";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Pilih VGA',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }
}

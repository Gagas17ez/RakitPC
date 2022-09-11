// ignore_for_file: prefer_const_constructors
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_builds_id.dart';
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/Models/models_simpan_build.dart';
import 'package:rakit_pc/my_sqf_lite.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class RekomendasiPc extends StatefulWidget {
  const RekomendasiPc({Key? key}) : super(key: key);

  @override
  State<RekomendasiPc> createState() => _RekomendasiPCState();
}

class _RekomendasiPCState extends State<RekomendasiPc> {
  var formatter = NumberFormat('#,###,000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff342C4C),
      body: FutureBuilder(
          future: fetchBuildsId(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Builds build = snapshot.data[index];

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.90,
                              lineHeight: 30,
                              percent: 100 / 100,
                              animation: true,
                              animationDuration: 500,
                              animateFromLastPercent: true,
                              barRadius: Radius.circular(20),
                              backgroundColor: HexColor("#C9C9C9"),
                              progressColor: HexColor("#EE5584"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(10.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Rekomendasi Sistem',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Rp " +
                                              formatter
                                                  .format(int.parse(build
                                                      .hargaBuilds
                                                      .toString()))
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 36,
                                            color: Color(0xff52BB6F),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 25,
                                ),
                                printCpu(build),
                                const SizedBox(
                                  height: 10,
                                ),
                                printMobo(build),
                                const SizedBox(
                                  height: 10,
                                ),
                                printRam(build),
                                const SizedBox(
                                  height: 10,
                                ),
                                printVga(build),
                                const SizedBox(
                                  height: 10,
                                ),
                                printStorage(build),
                                const SizedBox(
                                  height: 10,
                                ),
                                printPsu(build),
                                const SizedBox(
                                  height: 10,
                                ),
                                printCpuCooler(build),
                                const SizedBox(
                                  height: 10,
                                ),
                                printFanCooler(build),
                                const SizedBox(
                                  height: 10,
                                ),
                                printCase(build),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 140,
                                height: 54,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ))),
                                  child: Text(
                                    "Beli Build",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: HexColor("#9997FF"),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () async {
                                    final url = build.links;

                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 140,
                                height: 54,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ))),
                                    child: Text(
                                      "Simpan Build",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: HexColor("#9997FF"),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                      ),
                                    ),
                                    onPressed: () {
                                      onSaveBuild(
                                          "All parts compatible",
                                          build.hargaBuilds,
                                          int.parse(build.casing),
                                          int.parse(build.cpu),
                                          int.parse(build.cpuCooler),
                                          int.parse(build.fans),
                                          int.parse(build.motherboard),
                                          int.parse(build.psu),
                                          int.parse(build.ram),
                                          int.parse(build.storage),
                                          int.parse(build.vga));
                                      Navigator.pushNamed(context, '/history');
                                    }),
                              ),
                              SizedBox(
                                height: 100.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            );
          }),
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

  Widget printCpu(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.cpu) - 1;
          global.namaPart = "CPU";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgCpu),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaCpu,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      "Rp " +
                          formatter
                              .format(int.parse(build.hargaCpu.toString()))
                              .toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff52BB6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printMobo(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.motherboard) - 1;
          global.namaPart = "Motherboard";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgMobo),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaMobo,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      "Rp " +
                          formatter
                              .format(int.parse(build.hargaMobo.toString()))
                              .toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff52BB6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printRam(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.ram) - 1;
          global.namaPart = "Ram";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgRam),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaRam,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      "Rp " +
                          formatter
                              .format(int.parse(build.hargaRam.toString()))
                              .toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff52BB6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printVga(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.vga) - 1;
          global.namaPart = "VGA";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgVga),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaVga,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: int.parse(build.hargaVga) == 0
                        ? Text(
                            "Gratis dengan CPU",
                            style: GoogleFonts.poppins(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff52BB6F)),
                          )
                        : Text(
                            "Rp " +
                                formatter
                                    .format(
                                        int.parse(build.hargaVga.toString()))
                                    .toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff52BB6F),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printStorage(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.storage) - 1;
          global.namaPart = "Storage";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgStorage),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaStorage,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      "Rp " +
                          formatter
                              .format(int.parse(build.hargaStorage.toString()))
                              .toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff52BB6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printPsu(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.psu) - 1;
          global.namaPart = "PSU";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgPsu),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaPsu,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      "Rp " +
                          formatter
                              .format(int.parse(build.hargaPsu.toString()))
                              .toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff52BB6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printCpuCooler(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.cpuCooler) - 1;
          global.namaPart = "CPU Cooler";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgCpuCooler),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaCpuCooler,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: int.parse(build.hargaCpuCooler) == 0
                        ? Text(
                            "Gratis dengan CPU",
                            style: GoogleFonts.poppins(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff52BB6F)),
                          )
                        : Text(
                            "Rp " +
                                formatter
                                    .format(int.parse(
                                        build.hargaCpuCooler.toString()))
                                    .toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff52BB6F),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printFanCooler(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.fans) - 1;
          global.namaPart = "Fan";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgFans),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaFans,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      "Rp " +
                          formatter
                              .format(int.parse(build.hargaFans.toString()))
                              .toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff52BB6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printCase(build) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/part/list/detail');
        setState(() {
          global.idDetail = int.parse(build.casing) - 1;
          global.namaPart = "Casing";
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(build.imgCasing),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      build.namaCasing,
                      style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                    child: Text(
                      "Rp " +
                          formatter
                              .format(int.parse(build.hargaCasing.toString()))
                              .toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff52BB6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onSaveBuild(
    String compatible,
    String hargaTotal,
    int idcasing,
    int idcpu,
    int idcooler,
    int idfan,
    int idmobo,
    int idpsu,
    int idram1,
    int idstorage1,
    int idvga,
  ) async {
    FocusScope.of(context).requestFocus(FocusNode());

    if ((global.idCaseAdv != null) &&
        (global.idCpuAdv != null) &&
        (global.idVgaAdv != null)) {
      await MySqflite.instance.insertBuild(SimpanBuild(
        compatible: compatible,
        harga: int.parse(hargaTotal),
        waktu: DateTime.now().toString(),
        idCasing: idcasing,
        idCpu: idcpu,
        idCpuCooler: idcooler,
        idMotherboard: idmobo,
        idPsu: idpsu,
        idRam1: idram1,
        idRam2: 0,
        idStorage1: idstorage1,
        idStorage2: 0,
        idVga: idvga,
        idFan1: idfan,
        idFan2: 0,
        idFan3: 0,
      ));
    }
  }
}

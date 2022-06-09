// ignore_for_file: prefer_const_constructors
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_builds_id.dart';
import 'package:rakit_pc/Api/api_cpu.dart';
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/Models/models_cpu.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/Models/models_SimpanBuild.dart';
import 'package:rakit_pc/MySqflite.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Rekomendasi_pc extends StatefulWidget {
  const Rekomendasi_pc({Key? key}) : super(key: key);

  @override
  State<Rekomendasi_pc> createState() => _RekomendasiPCState();
}

class _RekomendasiPCState extends State<Rekomendasi_pc> {
  var formatter = NumberFormat('#,###,000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff342C4C),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: const Text('Hasil Rekomendasi', textAlign: TextAlign.center),
      // ),
      body: FutureBuilder(
          future: fetch_builds_id(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Builds build = snapshot.data[index];

                    return Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                      child: Column(
                        children: <Widget>[
                          // CPU
                          Container(
                            padding: EdgeInsets.all(5),
                            child: LinearPercentIndicator(
                              width: 340,
                              lineHeight: 30,
                              percent: 100 / 100,
                              animation: true,
                              animationDuration: 700,
                              animateFromLastPercent: true,
                              barRadius: Radius.circular(20),
                              backgroundColor: HexColor("#C9C9C9"),
                              progressColor: HexColor("#EE5584"),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(10.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Rekomendasi system',
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
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgCpu),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/part/list/detail');
                                                setState(() {
                                                  global.id_detail =
                                                      int.parse(build.cpu);
                                                  global.nama_part = "CPU";
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      build.namaCpu,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 18.0,
                                                          color: Colors.white70,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Rp " +
                                                          formatter
                                                              .format(int.parse(build
                                                              .hargaCpu
                                                              .toString()))
                                                              .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white70),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgMobo),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/part/list/detail');
                                              setState(() {
                                                global.id_detail =
                                                    int.parse(build.motherboard);
                                                global.nama_part = "Motherboard";
                                              });
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  child:Text(
                                                    build.namaMobo,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 18.0,
                                                        color: Colors.white70,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Container(
                                                  child:Text(
                                                    "Rp " +
                                                        formatter
                                                            .format(int.parse(build
                                                            .hargaMobo
                                                            .toString()))
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white70,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgRam),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/part/list/detail');
                                              setState(() {
                                                global.id_detail =
                                                    int.parse(build.ram);
                                                global.nama_part = "Ram";
                                              });
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  child: Text(
                                                    build.namaRam,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 18.0,
                                                      color: Colors.white70,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Container(
                                                  child:Text(
                                                    "Rp " +
                                                        formatter
                                                            .format(int.parse(build
                                                            .hargaRam
                                                            .toString()))
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white70,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgVga),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/part/list/detail');
                                                setState(() {
                                                  global.id_detail =
                                                      int.parse(build.vga);
                                                  global.nama_part = "VGA";
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      build.namaVga,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 18.0,
                                                          color: Colors.white70,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Rp " +
                                                          formatter
                                                              .format(int.parse(build
                                                              .hargaVga
                                                              .toString()))
                                                              .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white70),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgStorage),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/part/list/detail');
                                                setState(() {
                                                  global.id_detail =
                                                      int.parse(build.storage);
                                                  global.nama_part = "Storage";
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      build.namaStorage,
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 18.0,
                                                        color: Colors.white70,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Rp " +
                                                          formatter
                                                              .format(int.parse(build
                                                              .hargaStorage
                                                              .toString()))
                                                              .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white70),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child:Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgPsu),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/part/list/detail');
                                                setState(() {
                                                  global.id_detail =
                                                      int.parse(build.psu);
                                                  global.nama_part = "PSU";
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      build.namaPsu,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 18.0,
                                                          color: Colors.white70,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Rp " +
                                                          formatter
                                                              .format(int.parse(build
                                                              .hargaPsu
                                                              .toString()))
                                                              .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white70),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgCpuCooler),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/part/list/detail');
                                                setState(() {
                                                  global.id_detail =
                                                      int.parse(build.cpuCooler);
                                                  global.nama_part = "CPU Cooler";
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      build.namaCpuCooler,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 18.0,
                                                          color: Colors.white70,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Rp " +
                                                          formatter
                                                              .format(int.parse(build
                                                              .hargaCpuCooler
                                                              .toString()))
                                                              .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white70),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgFans),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/part/list/detail');
                                                setState(() {
                                                  global.id_detail =
                                                      int.parse(build.fans);
                                                  global.nama_part = "Fan";
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      build.namaFans,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 18.0,
                                                          color: Colors.white70,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Rp " +
                                                          formatter
                                                              .format(int.parse(build
                                                              .hargaFans
                                                              .toString()))
                                                              .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white70),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 350,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(build.imgCasing),
                                                  fit: BoxFit.contain)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/part/list/detail');
                                                setState(() {
                                                  global.id_detail =
                                                      int.parse(build.casing);
                                                  global.nama_part = "Casing";
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Text(
                                                      build.namaCasing,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 18.0,
                                                          color: Colors.white70,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Rp " +
                                                          formatter
                                                              .format(int.parse(build
                                                              .hargaCasing
                                                              .toString()))
                                                              .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white70),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 54,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              HexColor("DBD8E3")),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ))),
                                  child: Text(
                                    "Beli Build",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18.0,
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
                              Container(
                                width: 140,
                                height: 54,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                HexColor("DBD8E3")),
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
                                        color: Colors.black,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    onPressed: () {
                                      onSaveBuild(
                                          global.compatible,
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
    FocusScope.of(context).requestFocus(new FocusNode());

    if ((global.id_case_adv != null) &&
        (global.id_cpu_adv != null) &&
        (global.id_vga_adv != null)) {
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
        idStorage1: idvga,
        idStorage2: 0,
        idVga: idvga,
        idFan1: idfan,
        idFan2: 0,
        idFan3: 0,
      ));
    }
  }
}

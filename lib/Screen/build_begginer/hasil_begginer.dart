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
                            width: 300,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green[300],
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
                                    children: const [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Rekomendasi system',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
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
                                          style: TextStyle(
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgCpu,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  build.namaCpu,
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "Rp.${build.hargaCpu}",
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgMobo,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
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
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            build.namaMobo,
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            "Rp. " + build.hargaMobo,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgRam,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
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
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                build.namaRam,
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Inter',
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                "Rp. " + build.hargaRam,
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Inter',
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgVga,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  build.namaVga,
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "Rp. " + build.hargaVga,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgStorage,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  build.namaStorage,
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white70,
                                                      height: 1.3,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "Rp. " + build.hargaStorage,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgPsu,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  build.namaPsu,
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "Rp. " + build.hargaPsu,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgCpuCooler,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  build.namaCpuCooler,
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "Rp. " + build.hargaCpuCooler,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgFans,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  build.namaFans,
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "Rp. " + build.hargaFans,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgCasing,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  build.namaCasing,
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "Rp. " + build.hargaCasing,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ))),
                                  ],
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
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontFamily: 'Inter',
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
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontFamily: 'Inter',
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

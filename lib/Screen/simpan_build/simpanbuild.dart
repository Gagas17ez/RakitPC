import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/Models/models_simpan_build.dart';
import 'package:rakit_pc/MySqflite.dart';
import 'package:intl/intl.dart';

class Simpan extends StatefulWidget {
  Simpan({Key? key}) : super(key: key);
  @override
  State<Simpan> createState() => _Simpan();
}

class _Simpan extends State<Simpan> {
  var formatter = NumberFormat('#,###,000');
  List<SimpanBuild> builds = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      builds = await MySqflite.instance.getBuild();
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272B40),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        title: const Text(
          'History Build',
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.builder(
          itemCount: builds.length,
          itemBuilder: (BuildContext context, int index) {
            var build = builds[index];

            return index == builds.length - 1
                ? Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 6,
                      margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: SizedBox(
                        width: 200,
                        height: 90,
                        child: ListTile(
                          leading: Image.asset(
                            "assets/img/partgan.png",
                            width: 57,
                            height: 57,
                          ),
                          title: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              build.waktu.substring(0, 16),
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              build.compatible == "All parts compatible"
                                  ? Text(
                                      "Semua part kompatible",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff52BB6F),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text(
                                      "Ada part tidak kompatible",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xffEE3C6D),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                              Text(
                                "Rp " +
                                    formatter
                                        .format(
                                            int.parse(build.harga.toString()))
                                        .toString(),
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _onDeleteBuild(build.waktu.toString());
                                },
                                icon: const Icon(Icons.delete),
                                iconSize: 30,
                              ),
                            ],
                          ),
                          selected: true,
                          selectedTileColor: const Color(0xFFffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/build/advanced');
                            setState(() {
                              global.hargaHarga = build.harga;
                              global.dariSimpan = true;
                              global.idCaseAdv = build.idCasing;
                              global.idCpuAdv = build.idCpu;
                              global.idMoboAdv = build.idMotherboard;
                              global.idVgaAdv = build.idVga;
                              global.idCpuCoolerAdv = build.idCpuCooler;
                              global.idFanAdv = build.idFan1;
                              global.idFan2Adv = build.idFan1;
                              global.idFan3Adv = build.idFan1;
                              global.idPsuAdv = build.idPsu;
                              global.idStorageAdv = build.idStorage1;
                              global.idStorage2Adv = build.idStorage2;
                              global.idRamAdv = build.idRam1;
                              global.idRam2Adv = build.idRam2;
                            });
                            const SizedBox(
                              height: 50,
                            );
                          },
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: Card(
                      color: Colors.transparent,
                      elevation: 6,
                      margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: SizedBox(
                        width: 200,
                        height: 90,
                        child: ListTile(
                          leading: Image.asset(
                            "assets/img/partgan.png",
                            width: 57,
                            height: 57,
                          ),
                          title: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              build.waktu.substring(0, 16),
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              build.compatible == "All parts compatible"
                                  ? Text(
                                      "Semua part compatible",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff52BB6F),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text(
                                      "Beberapa part tidak kompatible",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xffEE3C6D),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                              Text(
                                "Rp " +
                                    formatter
                                        .format(
                                            int.parse(build.harga.toString()))
                                        .toString(),
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _onDeleteBuild(build.waktu.toString());
                                },
                                icon: const Icon(Icons.delete),
                                iconSize: 30,
                              ),
                            ],
                          ),
                          selected: true,
                          selectedTileColor: const Color(0xFFffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/build/advanced');
                            setState(() {
                              global.hargaHarga = build.harga;
                              global.dariSimpan = true;
                              global.idCaseAdv = build.idCasing;
                              global.idCpuAdv = build.idCpu;
                              global.idMoboAdv = build.idMotherboard;
                              global.idVgaAdv = build.idVga;
                              global.idCpuCoolerAdv = build.idCpuCooler;
                              global.idFanAdv = build.idFan1;
                              global.idFan2Adv = build.idFan1;
                              global.idFan3Adv = build.idFan1;
                              global.idPsuAdv = build.idPsu;
                              global.idStorageAdv = build.idStorage1;
                              global.idStorage2Adv = 0;
                              global.idRamAdv = build.idRam1;
                            });
                            const SizedBox(
                              height: 50,
                            );
                          },
                        ),
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

  getBuilds() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    builds = await MySqflite.instance.getBuild();
    setState(() {});
  }

  _onDeleteBuild(String waktuh) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    await MySqflite.instance.clearData(waktuh);
    init();
  }
}

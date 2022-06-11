import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/Models/models_SimpanBuild.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Color(0xff272B40),
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

            return Container(
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
                                build.compatible.toString(),
                                style: GoogleFonts.poppins(
                                  color: Color(0xff52BB6F),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : Text(
                                build.compatible.toString(),
                                style: GoogleFonts.poppins(
                                  color: Color(0xffEE3C6D),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        Text(
                          "Rp " +
                              formatter
                                  .format(int.parse(build.harga.toString()))
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
                          icon: Icon(Icons.delete),
                          iconSize: 30,
                        ),
                      ],
                    ),
                    selected: true,
                    selectedTileColor: Color(0xFFffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/build/advanced');
                      setState(() {
                        global.hargaharga = build.harga;
                        global.darisimpan = true;
                        global.id_case_adv = build.idCasing;
                        global.id_cpu_adv = build.idCpu;
                        global.id_mobo_adv = build.idMotherboard;
                        global.id_vga_adv = build.idVga;
                        global.id_cpu_cooler_adv = build.idCpuCooler;
                        global.id_fan_adv = build.idFan1;
                        global.id_fan2_adv = build.idFan2;
                        global.id_fan3_adv = build.idFan3;
                        global.id_psu_adv = build.idPsu;
                        global.id_storage_adv = build.idStorage1;
                        global.id_storage2_adv = build.idStorage2;
                        global.id_ram_adv = build.idRam1;
                        global.id_ram2_adv = build.idRam2;
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

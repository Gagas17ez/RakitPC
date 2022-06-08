import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/Models/models_SimpanBuild.dart';
import 'package:flutter/material.dart';
import 'package:rakit_pc/MySqflite.dart';

class Simpan extends StatefulWidget {
  Simpan({Key? key}) : super(key: key);
  @override
  State<Simpan> createState() => _Simpan();
}

class _Simpan extends State<Simpan> {
  List<SimpanBuild> builds = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      builds = await MySqflite.instance.getBuild();
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272B40),
      appBar: AppBar(
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
        title: const Text('History Build'),
      ),
      body: ListView.builder(
          itemCount: builds.length,
          itemBuilder: (BuildContext context, int index) {
            var build = builds[index];
            //Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),

            return Container(
              child: Card(
                color: Colors.transparent,
                elevation: 6,
                margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: SizedBox(
                  width: 200,
                  height: 90,
                  child: ListTile(
                    title: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/img/casing.png",
                              width: 40,
                              height: 40,
                              color: Colors.white70,
                            ),
                            Text(
                              build.waktu.substring(0, 16),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          build.compatible.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Inter',
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          build.harga.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Inter',
                            fontSize: 14,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),

                    //trailing: Image.asset("assets/img/casing.png"),
                    selected: true,
                    selectedTileColor: Color(0xFF7A77FF),
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
}

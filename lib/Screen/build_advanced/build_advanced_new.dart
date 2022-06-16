// ignore_for_file: avoid_unnecessary_containers, unnecessary_null_comparison
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:rakit_pc/Api/api_fan.dart';
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
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Models/models_SimpanBuild.dart';
import 'package:rakit_pc/MySqflite.dart';

void main() {
  runApp(buildpc_advanced());
}

class buildpc_advanced extends StatefulWidget {
  buildpc_advanced({Key? key}) : super(key: key);

  @override
  State<buildpc_advanced> createState() => _buildpc_advancedState();
}

class _buildpc_advancedState extends State<buildpc_advanced> {
  String cpuSocket = "";
  String moboSocket = "";
  String messageCompability = "";
  var formatter = NumberFormat('#,###,000');

  void initState() {
    super.initState();

    init();
  }

  void init() async {
    setState(() {
      global.hargaharga = global.hargacase +
          global.hargacooler +
          global.hargacpu +
          global.hargavga +
          global.hargafan1 +
          global.hargafan2 +
          global.hargafan3 +
          global.hargamobo +
          global.hargapsu +
          global.hargaram1 +
          global.hargaram2 +
          global.hargastorage1 +
          global.hargastorage2;
      global.wattTotal = global.wattcooler +
          global.wattcpu +
          global.wattvga +
          global.wattcooler +
          global.wattfan1 +
          global.wattfan2 +
          global.wattfan3 +
          global.wattram1 +
          global.wattram2 +
          global.wattstorage1 +
          global.wattstorage2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff342C4C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'System Builder',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          kotak_compability(),
          SizedBox(
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
                      formatter.format(int.parse(global.hargaharga.toString())),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ]),
          SizedBox(
            width: 30,
            height: 30,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Divider(
                        color: Colors.white,
                        height: 25,
                        thickness: 3,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.id_case_adv = 0;
                        global.hargacase = 0;
                        messageCompability = "";
                        global.compatible = "All parts compatible";
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
          SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.id_cpu_adv = 0;
                        global.hargacpu = 0;
                        global.wattcpu = 0;
                        messageCompability = "";
                        global.compatible = "All parts compatible";
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
          SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.id_cpu_cooler_adv = 0;
                        global.id_cpu_cooler_adv = 0;
                        global.hargacooler = 0;
                        global.wattcooler = 0;
                        messageCompability = "";
                        global.compatible = "All parts compatible";
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
          SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.id_mobo_adv = 0;
                        global.hargamobo = 0;
                        messageCompability = "";
                        global.compatible = "All parts compatible";
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
          SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.hargapsu = 0;
                        global.id_psu_adv = 0;
                        messageCompability = "";
                        global.compatible = "All parts compatible";
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
          SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.id_ram_adv = 0;
                        global.id_ram2_adv = 0;
                        global.hargaram1 = 0;
                        global.hargaram2 = 0;
                        messageCompability = "";
                        global.wattram1 = 0;
                        global.wattram2 = 0;
                        global.compatible = "All parts compatible";
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
          SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.id_storage_adv = 0;
                        global.id_storage2_adv = 0;
                        global.hargastorage1 = 0;
                        global.hargastorage2 = 0;
                        global.wattstorage1 = 0;
                        global.wattstorage2 = 0;
                        messageCompability = "";
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
          SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.id_vga_adv = 0;
                        global.hargavga = 0;
                        global.wattvga = 0;
                        messageCompability = "";
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
          SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 25,
                          thickness: 3,
                        )),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onTap: () {
                      setState(() {
                        global.id_fan_adv = 0;
                        global.id_fan2_adv = 0;
                        global.id_fan3_adv = 0;
                        global.hargafan1 = 0;
                        global.hargafan2 = 0;
                        global.hargafan3 = 0;
                        global.wattfan1 = 0;
                        global.wattfan2 = 0;
                        global.wattfan3 = 0;
                        global.compatible = "";
                        messageCompability = "";
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
          SizedBox(
            width: 30,
            height: 40,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
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
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.89),
                    ),
                  ),
                ),
                SizedBox(
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
    FocusScope.of(context).requestFocus(new FocusNode());

    if ((global.id_case_adv != null) &&
        (global.id_cpu_adv != null) &&
        (global.id_vga_adv != null)) {
      await MySqflite.instance.insertBuild(SimpanBuild(
        compatible: global.compatible,
        // harga: global.hargacooler + global.hargacase,
        harga: (global.hargacase +
            global.hargavga +
            global.hargacooler +
            global.hargacpu +
            global.hargafan1 +
            global.hargafan2 +
            global.hargafan3 +
            global.hargamobo +
            global.hargapsu +
            global.hargaram1 +
            global.hargaram2 +
            global.hargastorage1 +
            global.hargastorage2),
        waktu: DateTime.now().toString(),
        idCasing: global.id_case_adv,
        idCpu: global.id_cpu_adv,
        idCpuCooler: global.id_cpu_cooler_adv,
        idMotherboard: global.id_mobo_adv,
        idPsu: global.id_psu_adv,
        idRam1: global.id_ram_adv,
        idRam2: global.id_ram2_adv,
        idStorage1: global.id_storage_adv,
        idStorage2: global.id_storage2_adv,
        idVga: global.id_vga_adv,
        idFan1: global.id_fan_adv,
        idFan2: global.id_fan2_adv,
        idFan3: global.id_fan3_adv,
      ));
    }
  }

  Widget getcasing() {
    if (global.id_case_adv != 0) {
      return FutureBuilder(
          future: fetch_casing_id(global.id_case_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.nama_part = "Casing";
                                },
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          // ignore: prefer__ructors
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/casing');
            setState(
              () {
                global.nama_part = "Casing";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih Casing',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget kotak_compability() {
    if (global.id_cpu_adv == 0 &&
        global.id_mobo_adv == 0 &&
        global.id_ram_adv == 0 &&
        global.id_ram2_adv == 0) {
      setState(() {
        global.compatible = "All parts compatible";
      });
      return Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            margin: EdgeInsets.all(0.0),
            color: HexColor("#00B16A"),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                  title: Text('Compatiblity : ',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600)),
                  subtitle: Text('No issues or incompatibilities found.',
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
            margin: EdgeInsets.all(0.0),
            color: HexColor("#2C85C5"),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                  title: Text(
                      'Estimated Wattage : ' +
                          global.wattTotal.toString() +
                          "W",
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
    } else {
      setState(() {
        global.compatible = "All parts compatible";
      });
      if ((global.socket_cpu.toLowerCase() !=
              global.socket_mobo.toLowerCase()) ||
          (global.id_ram_adv != global.id_ram2_adv)) {
        setState(() {
          global.compatible = "Some part Incompatible";
        });
        if (global.socket_cpu.toLowerCase() !=
            global.socket_mobo.toLowerCase()) {
          messageCompability +=
              "- Cpu might not compatible with the current Motherboard\n";
        }
        if (global.id_ram_adv != global.id_ram2_adv) {
          messageCompability +=
              "- Single or Different Ram speed & size might cause instability or error\n";
        }

        return Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              margin: EdgeInsets.all(0.0),
              color: HexColor("#d62828"),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.clear_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                    title: Text('Compatiblity : ',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w600)),
                    subtitle: Text(messageCompability,
                        style: GoogleFonts.poppins(
                            color: Color(0xffffba08),
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
              margin: EdgeInsets.all(0.0),
              color: HexColor("#2C85C5"),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.offline_bolt_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                    title: Text(
                        'Estimated Wattage : ' +
                            global.wattTotal.toString() +
                            "W",
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
            margin: EdgeInsets.all(0.0),
            color: HexColor("#00B16A"),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.white,
                  ),
                  title: Text('Compatiblity : ',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600)),
                  subtitle: Text('No issues or incompatibilities found.',
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
            margin: EdgeInsets.all(0.0),
            color: HexColor("#2C85C5"),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                      'Estimated Wattage : ' +
                          global.wattTotal.toString() +
                          "W",
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
  }

  Widget getfan() {
    if (global.id_fan_adv != 0) {
      return FutureBuilder(
          future: fetch_fan_id(global.id_fan_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.seng_diganti = 1;
                                  global.nama_part = "Fan";
                                  global.hargafan1 = int.parse(fangan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.seng_diganti = 1;
                global.nama_part = "Fan";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih Fan',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getfanAgain() {
    if (global.id_fan2_adv != 0) {
      return FutureBuilder(
          future: fetch_fan_id(global.id_fan2_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.seng_diganti = 2;
                                  global.nama_part = "Fan";
                                  global.hargafan1 = int.parse(fangan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.seng_diganti = 2;
                global.nama_part = "Fan";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih Fan',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getfanAgainAgain() {
    if (global.id_fan3_adv != 0) {
      return FutureBuilder(
          future: fetch_fan_id(global.id_fan3_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.seng_diganti = 3;
                                  global.nama_part = "Fan";
                                  global.hargafan3 = int.parse(fangan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.seng_diganti = 3;
                global.nama_part = "Fan";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih Fan',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getcpuwoi() {
    if (global.id_cpu_adv != 0) {
      return FutureBuilder(
          future: fetch_cpu_id(global.id_cpu_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.nama_part = "CPU";
                                  global.hargacpu =
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
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/cpu');
            setState(
              () {
                global.nama_part = "CPU";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih CPU',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getcpucooler() {
    if (global.id_cpu_cooler_adv != 0) {
      return FutureBuilder(
          future: fetch_cpu_cooler_id(global.id_cpu_cooler_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.nama_part = "CPU Cooler";
                                  global.hargacooler =
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
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/cooler');
            setState(
              () {
                global.nama_part = "CPU Cooler";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih CPU Cooler',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getmobo() {
    if (global.id_mobo_adv != 0) {
      return FutureBuilder(
          future: fetch_motherboard_id(global.id_mobo_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.hargamobo = int.parse(mobogan.harga);
                                  global.nama_part = "Motherboard";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(mobogan.imageLink),
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/motherboard');
            setState(
              () {
                global.nama_part = "Motherboard";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih Motherboard',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getpower() {
    if (global.id_psu_adv != 0) {
      return FutureBuilder(
          future: fetch_psu_id(global.id_psu_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.nama_part = "PSU";
                                  global.hargapsu = int.parse(psugan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(psugan.imageLink),
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/psu');
            setState(
              () {
                global.nama_part = "PSU";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih Power Supply',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getram() {
    if (global.id_ram_adv != 0) {
      return FutureBuilder(
          future: fetch_ram_id(global.id_ram_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.seng_diganti = 1;
                                  global.nama_part = "Ram";
                                  global.hargaram1 = int.parse(ramgan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/ram');
            setState(
              () {
                global.seng_diganti = 1;
                global.nama_part = "Ram";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih RAM',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getramAgain() {
    if (global.id_ram2_adv != 0) {
      return FutureBuilder(
          future: fetch_ram_id(global.id_ram2_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.seng_diganti = 2;
                                  global.nama_part = "Ram";
                                  global.hargaram2 = int.parse(ramgan.harga);
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/ram');
            setState(
              () {
                global.seng_diganti = 2;
                global.nama_part = "Ram";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih RAM',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getstorage() {
    if (global.id_storage_adv != 0) {
      return FutureBuilder(
          future: fetch_storage_id(global.id_storage_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.seng_diganti = 1;
                                  global.nama_part = "Storage";
                                  global.hargastorage1 =
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
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/storage');
            setState(
              () {
                global.seng_diganti = 1;
                global.nama_part = "Storage";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih Storage',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getstorageAgain() {
    if (global.id_storage2_adv != 0) {
      return FutureBuilder(
          future: fetch_storage_id(global.id_storage2_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.seng_diganti = 2;
                                  global.nama_part = "Storage";
                                  global.hargastorage2 =
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
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/storage');
            setState(
              () {
                global.seng_diganti = 2;
                global.nama_part = "Storage";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih Storage',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }

  Widget getvga() {
    if (global.id_vga_adv != 0) {
      return FutureBuilder(
          future: fetch_vga_id(global.id_vga_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                  global.nama_part = "VGA";
                                  global.hargavga = 69;
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(vgagan.imageLink),
                                  selected: true,
                                  selectedTileColor: Color(0xFFffffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        color: Color(0xff52BB6F),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 121, 119, 255)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/vga');
            setState(
              () {
                global.nama_part = "VGA";
              },
            );
          },
          icon: Icon(Icons.add),
          label: Text('Pilih VGA',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600)));
    }
  }
}

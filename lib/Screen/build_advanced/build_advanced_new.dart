// ignore_for_file: avoid_unnecessary_containers, unnecessary_null_comparison

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

  @override
  Widget build(BuildContext context) {
    return
        // Remove the debug banner

        ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFAE52BB),
          Color(0xFF0C062A),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text('System Builder'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          kotak_compability(),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Casing',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                  const Text(
                    'CPU',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                  const Text(
                    'CPU Cooler',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                  const Text(
                    'Motherboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                  const Text(
                    'Power Supply',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                  const Text(
                    'RAM',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                  const Text(
                    'Storage',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                  const Text(
                    'VGA',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                  const Text(
                    'Fan',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DmSans',
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
                ElevatedButton(
                  onPressed: () {
                    _onSaveBuild();
                    Navigator.pushNamed(context, '/history');
                  },
                  child: const Text('Simpan Build',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DmSans',
                        fontSize: 20,
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#2a292f"),
                    // primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.89),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _onSaveBuild() async {
    FocusScope.of(context).requestFocus(new FocusNode());

    if ((global.id_case_adv != null) &&
        (global.id_cpu_adv != null) &&
        (global.id_vga_adv != null)) {
      await MySqflite.instance.insertBuild(SimpanBuild(
        compatible: global.compatible,
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

      // mahasiswa = await MySqflite.instance.getMahasiswa();
      // setState(() {});
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
                  itemBuilder: (BuildContext context, index) {
                    Casing casinggan = snapshot.data[index];

                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(4.0)),
                                    child: Image.network(
                                      casinggan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    casinggan.namaCasing,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    casinggan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/casing');
            setState(
              () {
                global.nama_part = "Casing";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose Casing',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget kotak_compability() {
    if (global.id_cpu_adv == 0 &&
        global.id_mobo_adv == 0 &&
        global.id_ram_adv == 0 &&
        global.id_ram2_adv == 0) {
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
              children: const [
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.white,
                  ),
                  title: Text('Compatiblity : ',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('No issues or incompatibilities found.',
                      style: TextStyle(color: Colors.white)),
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
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.white,
                  ),
                  title: Text('Estimated Wattage : OW',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      if ((global.socket_cpu.toLowerCase() !=
              global.socket_mobo.toLowerCase()) ||
          (global.id_ram_adv != global.id_ram2_adv)) {
        if (global.socket_cpu.toLowerCase() !=
            global.socket_mobo.toLowerCase()) {
          messageCompability +=
              "Cpu might not compatible with the current Motherboard\n";
        }
        if (global.id_ram_adv != global.id_ram2_adv) {
          messageCompability +=
              "\nDifferent Ram speed & size might cause instability or error\n";
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
                    leading: Icon(
                      Icons.clear_rounded,
                      color: Colors.white,
                    ),
                    title: Text('Compatiblity : ',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(messageCompability,
                        style: TextStyle(color: Colors.white)),
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
                children: const [
                  ListTile(
                    leading: Icon(
                      Icons.offline_bolt_outlined,
                      color: Colors.white,
                    ),
                    title: Text('Estimated Wattage : OW',
                        style: TextStyle(color: Colors.white)),
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
              children: const [
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.white,
                  ),
                  title: Text('Compatiblity : ',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('No issues or incompatibilities found.',
                      style: TextStyle(color: Colors.white)),
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
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.offline_bolt_outlined,
                    color: Colors.white,
                  ),
                  title: Text('Estimated Wattage : OW',
                      style: TextStyle(color: Colors.white)),
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
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Fan fangan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/fan');
                              setState(
                                () {
                                  global.seng_diganti = 1;
                                  global.nama_part = "Fan";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      fangan.imageLinks,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    fangan.namaFans,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    fangan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.seng_diganti = 1;
                global.nama_part = "Fan";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose Fan',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getfanAgain() {
    if (global.id_fan2_adv != 0) {
      return FutureBuilder(
          future: fetch_fan_id(global.id_fan2_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Fan fangan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/fan');
                              setState(
                                () {
                                  global.seng_diganti = 2;
                                  global.nama_part = "Fan";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      fangan.imageLinks,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    fangan.namaFans,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    fangan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.seng_diganti = 2;
                global.nama_part = "Fan";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose Fan',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getfanAgainAgain() {
    if (global.id_fan3_adv != 0) {
      return FutureBuilder(
          future: fetch_fan_id(global.id_fan3_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Fan fangan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/fan');
                              setState(
                                () {
                                  global.seng_diganti = 3;
                                  global.nama_part = "Fan";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      fangan.imageLinks,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    fangan.namaFans,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    fangan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/fan');
            setState(
              () {
                global.seng_diganti = 3;
                global.nama_part = "Fan";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose Fan',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getcpuwoi() {
    if (global.id_cpu_adv != 0) {
      return FutureBuilder(
          future: fetch_cpu_id(global.id_cpu_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Cpu cpugan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/cpu');
                              setState(
                                () {
                                  global.nama_part = "CPU";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(cpugan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      cpugan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    cpugan.namaCpu,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    cpugan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(200, 50),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/cpu');
            setState(
              () {
                global.nama_part = "CPU";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose CPU',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getcpucooler() {
    if (global.id_cpu_cooler_adv != 0) {
      return FutureBuilder(
          future: fetch_cpu_cooler_id(global.id_cpu_cooler_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    CpuCooler cpucoolergan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/cooler');
                              setState(
                                () {
                                  global.nama_part = "CPU Cooler";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(cpucoolergan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      cpucoolergan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    cpucoolergan.namaCooler,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    cpucoolergan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/cooler');
            setState(
              () {
                global.nama_part = "CPU Cooler";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose CPU Cooler',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getmobo() {
    if (global.id_mobo_adv != 0) {
      return FutureBuilder(
          future: fetch_motherboard_id(global.id_mobo_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Motherboard mobogan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/part/list/motherboard');
                              setState(
                                () {
                                  global.nama_part = "Motherboard";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(mobogan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(4.0)),
                                    child: Image.network(
                                      mobogan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    mobogan.namaMobo,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    mobogan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/motherboard');
            setState(
              () {
                global.nama_part = "Motherboard";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose Motherboard',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getpower() {
    if (global.id_psu_adv != 0) {
      return FutureBuilder(
          future: fetch_psu_id(global.id_psu_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Psu psugan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/psu');
                              setState(
                                () {
                                  global.nama_part = "PSU";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(psugan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      psugan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    psugan.namaPsu,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    psugan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/psu');
            setState(
              () {
                global.nama_part = "PSU";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose Power Supply',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getram() {
    if (global.id_ram_adv != 0) {
      return FutureBuilder(
          future: fetch_ram_id(global.id_ram_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Ram ramgan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/ram');
                              setState(
                                () {
                                  global.seng_diganti = 1;
                                  global.nama_part = "Ram";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      ramgan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    ramgan.namaRam,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    ramgan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/ram');
            setState(
              () {
                global.seng_diganti = 1;
                global.nama_part = "Ram";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose RAM',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getramAgain() {
    if (global.id_ram_adv != 0 && global.id_ram2_adv != 0) {
      return FutureBuilder(
          future: fetch_ram_id(global.id_ram2_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Ram ramgan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/ram');
                              setState(
                                () {
                                  global.seng_diganti = 2;
                                  global.nama_part = "Ram";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(ramgan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      ramgan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    ramgan.namaRam,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    ramgan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/ram');
            setState(
              () {
                global.seng_diganti = 2;
                global.nama_part = "Ram";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose RAM',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getstorage() {
    if (global.id_storage_adv != 0) {
      return FutureBuilder(
          future: fetch_storage_id(global.id_storage_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Storage storagegan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/part/list/storage');
                              setState(
                                () {
                                  global.seng_diganti = 1;
                                  global.nama_part = "Storage";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(storagegan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      storagegan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    storagegan.namaStorage,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    storagegan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/storage');
            setState(
              () {
                global.seng_diganti = 1;
                global.nama_part = "Storage";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose Storage',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getstorageAgain() {
    if (global.id_storage2_adv != 0) {
      return FutureBuilder(
          future: fetch_storage_id(global.id_storage2_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Storage storagegan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/part/list/storage');
                              setState(
                                () {
                                  global.seng_diganti = 2;
                                  global.nama_part = "Storage";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(storagegan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      storagegan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    storagegan.namaStorage,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    storagegan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/storage');
            setState(
              () {
                global.seng_diganti = 2;
                global.nama_part = "Storage";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose Storage',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }

  Widget getvga() {
    if (global.id_vga_adv != 0) {
      return FutureBuilder(
          future: fetch_vga_id(global.id_vga_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Vga vgagan = snapshot.data[index];
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/part/list/vga');
                              setState(
                                () {
                                  global.nama_part = "VGA";
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  // leading: Image.network(vgagan.imageLink),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    child: Image.network(
                                      vgagan.imageLink,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  title: Text(
                                    vgagan.namaVga,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    vgagan.harga,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
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
          onPressed: () {
            Navigator.pushNamed(context, '/part/list/vga');
            setState(
              () {
                global.nama_part = "VGA";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose VGA',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }
}

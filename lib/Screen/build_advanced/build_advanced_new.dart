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
import 'package:rakit_pc/Models/models_casing.dart';
import 'package:rakit_pc/Models/models_cpu.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:rakit_pc/Models/models_vga.dart';
import 'package:rakit_pc/Screen/part_page/list_part.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Rakit PC',
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    primary: HexColor("#3AA0C0"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    textStyle: const TextStyle(
                      fontFamily: 'JakartaBold',
                      fontSize: 16,
                    )))),
        home: ScaffoldGradientBackground(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFFAE52BB),
              Color(0xFF0C062A),
            ],
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
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
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 20,
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
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [getcpuwoi()],
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
                        'CPU Cooler',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 20,
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
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 20,
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
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 20,
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
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [getram()],
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
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [getstorage()],
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
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 20,
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
              // const SizedBox(
              //   width: 30,
              //   height: 20,
              // ),
              // Container(
              //     margin: EdgeInsets.all(5),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         const Text(
              //           'Monitor',
              //           style: TextStyle(
              //             color: Colors.blueGrey,
              //             fontFamily: 'DmSans',
              //             fontSize: 18,
              //           ),
              //         ),
              //         Expanded(
              //           child: new Container(
              //               margin:
              //                   const EdgeInsets.only(left: 10.0, right: 10.0),
              //               child: Divider(
              //                 color: Colors.black,
              //                 height: 20,
              //               )),
              //         ),
              //       ],
              //     )),
              // Container(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       ElevatedButton.icon(
              //           onPressed: () {},
              //           icon: const Icon(Icons.add),
              //           label: const Text('Choose Monitor',
              //               style: TextStyle(
              //                 fontFamily: 'DmSans',
              //                 fontSize: 18,
              //               ))),
              //     ],
              //   ),
              // ),
              const SizedBox(
                width: 30,
                height: 40,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Simpan Build',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'DmSans',
                            fontSize: 20,
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#DBD8E3"),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 70),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(14.89),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
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
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPart()),
                            );
                            setState(
                              () {
                                global.nama_part = "Casing";
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(casinggan.imageLink),
                                title: Text(
                                  casinggan.namaCasing,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  casinggan.drivebayCasing,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListPart()),
            );
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
    if (global.id_cpu_adv == 0 && global.id_mobo_adv == 0) {
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
                const ListTile(
                  dense: true,
                  leading: const Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.white,
                  ),
                  title: Text('Compatiblity : ',
                      style: TextStyle(color: Colors.white)),
                  subtitle: const Text('No issues or incompatibilities found.',
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
              children: [
                const ListTile(
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
      if (global.socket_cpu.toLowerCase() == global.socket_mobo.toLowerCase()) {
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
                  const ListTile(
                    dense: true,
                    leading: const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.white,
                    ),
                    title: Text('Compatiblity : ',
                        style: TextStyle(color: Colors.white)),
                    subtitle: const Text(
                        'No issues or incompatibilities found.',
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
                children: [
                  const ListTile(
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
                  const ListTile(
                    dense: true,
                    leading: const Icon(
                      Icons.clear_rounded,
                      color: Colors.white,
                    ),
                    title: Text('Compatiblity : ',
                        style: TextStyle(color: Colors.white)),
                    subtitle: const Text(
                        '1 issues or more incompatibilities found. \n motherboard and cpu not compatible',
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
                children: [
                  const ListTile(
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
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPart()),
                            );
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
                                leading: Image.network(cpugan.imageLink),
                                title: Text(
                                  cpugan.namaCpu,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  "Core/Threads : " +
                                      cpugan.coreCount +
                                      "/" +
                                      cpugan.threadsCount,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListPart()),
            );
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
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPart()),
                            );
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
                                leading: Image.network(cpucoolergan.imageLink),
                                title: Text(
                                  cpucoolergan.namaCooler,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  "Core/Threads : " + cpucoolergan.typeCooler,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListPart()),
            );
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
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPart()),
                            );
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
                                leading: Image.network(mobogan.imageLink),
                                title: Text(
                                  mobogan.namaMobo,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  mobogan.socketMobo,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListPart()),
            );
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
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPart()),
                            );
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
                                leading: Image.network(psugan.imageLink),
                                title: Text(
                                  psugan.namaPsu,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  psugan.wattPsu,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListPart()),
            );
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
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPart()),
                            );
                            setState(
                              () {
                                global.nama_part = "Ram";
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(ramgan.imageLink),
                                title: Text(
                                  ramgan.namaRam,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  ramgan.memorySize,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListPart()),
            );
            setState(
              () {
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
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPart()),
                            );
                            setState(
                              () {
                                global.nama_part = "Storage";
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(storagegan.imageLink),
                                title: Text(
                                  storagegan.namaStorage,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  storagegan.typeStorage,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListPart()),
            );
            setState(
              () {
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
                    return Card(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListPart()),
                            );
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
                                leading: Image.network(vgagan.imageLink),
                                title: Text(
                                  vgagan.namaVga,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  vgagan.generation,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
            return const CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListPart()),
            );
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

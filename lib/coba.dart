import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_builds_id.dart';
import 'package:rakit_pc/Api/api_casing_id.dart';
import 'package:rakit_pc/Api/api_cpu.dart';
import 'package:rakit_pc/Api/api_cpu_cooler_id.dart';
import 'package:rakit_pc/Api/api_cpu_id.dart';
import 'package:rakit_pc/Api/api_fan.dart';
import 'package:rakit_pc/Api/api_fan_id.dart';
import 'package:rakit_pc/Api/api_motherboard.dart';
import 'package:rakit_pc/Api/api_motherboard_id.dart';
import 'package:rakit_pc/Api/api_psu.dart';
import 'package:rakit_pc/Api/api_psu_id.dart';
import 'package:rakit_pc/Api/api_ram.dart';
import 'package:rakit_pc/Api/api_ram_id.dart';
import 'package:rakit_pc/Api/api_storage.dart';
import 'package:rakit_pc/Api/api_storage_id.dart';
import 'package:rakit_pc/Api/api_vga.dart';
import 'package:rakit_pc/Api/api_vga_id.dart';
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/Models/models_casing.dart';
import 'package:rakit_pc/Models/models_cpu.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:rakit_pc/Models/models_vga.dart';

class MenuWisatapi extends StatefulWidget {
  const MenuWisatapi({Key? key}) : super(key: key);

  @override
  State<MenuWisatapi> createState() => _MenuWisataState();
}

class _MenuWisataState extends State<MenuWisatapi> {
  final List<Cpu> doneTourismPlaceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text(
            "Wisata Surabaya But With API",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'poppins',
              color: Colors.lightBlue,
            ),
          ),
        ),
        body: FutureBuilder(
            future: fetch_storage_id(2),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Storage wisata = snapshot.data[index];
                      return Card(
                          margin: EdgeInsets.all(5),
                          color: Colors.blue[400],
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: new InkWell(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Image.network("${wisata.imageLink}"),
                                  title: Text(
                                    "${wisata.namaStorage}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.white70),
                                  ),
                                  subtitle: Text(
                                    "${wisata.idStorage}",
                                    style: TextStyle(
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
              return CircularProgressIndicator();
            }));
  }
}

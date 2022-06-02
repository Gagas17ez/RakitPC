import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_advanced/build_advanced_new.dart';
import 'package:rakit_pc/Screen/build_begginer/hasil_begginer.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan2.dart';

import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan1.dart';
import 'package:rakit_pc/Screen/part_page/detail_part.dart';
import 'package:rakit_pc/Screen/part_page/list_casing.dart';
import 'package:rakit_pc/Screen/part_page/list_cpu.dart';
import 'package:rakit_pc/Screen/part_page/list_cpu_cooler.dart';
import 'package:rakit_pc/Screen/part_page/list_fan.dart';
import 'package:rakit_pc/Screen/part_page/list_motherboard.dart';
import 'package:rakit_pc/Screen/part_page/list_part.dart';
import 'package:rakit_pc/Screen/part_page/list_psu.dart';
import 'package:rakit_pc/Screen/part_page/list_ram.dart';
import 'package:rakit_pc/Screen/part_page/list_storage.dart';
import 'package:rakit_pc/Screen/part_page/list_vga.dart';
import 'package:rakit_pc/Screen/part_page/part_page.dart';
import 'package:rakit_pc/Screen/simpan_build/simpanbuild.dart';
import 'package:rakit_pc/coba.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Screen/part_page/part_page.dart';

void main() {
  runApp(const rakitpc());
}

class rakitpc extends StatelessWidget {
  const rakitpc({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RakitPC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => buildpc_advanced(),
        '/history': (context) => Simpan(),
        '/build': (context) => pertanyaan_awal(),
        '/build/advanced': (context) => buildpc_advanced(),
        '/build/begginer/pertanyaan1': (context) => Pertanyaan1(),
        '/build/begginer/pertanyaan2': (context) => Pertanyaan2(),
        '/build/begginer/hasil': (context) => Rekomendasi_pc(),
        '/part': (context) => Part(),
        '/part/list': (context) => ListPart(),
        '/part/list/casing': (context) => listCasing(),
        '/part/list/cooler': (context) => listCpuCooler(),
        '/part/list/cpu': (context) => listCpu(),
        '/part/list/fan': (context) => listFan(),
        '/part/list/motherboard': (context) => listMotherboard(),
        '/part/list/psu': (context) => listPsu(),
        '/part/list/ram': (context) => listRam(),
        '/part/list/storage': (context) => listStorage(),
        '/part/list/vga': (context) => listVga(),
        '/part/list/detail': (context) => DetailPart(),
      },
    );
  }
}

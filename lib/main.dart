import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_advanced/build_advanced_new.dart';
import 'package:rakit_pc/Screen/build_begginer/hasil_begginer.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan2.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/build_begginer/howitworks.dart';
import 'package:rakit_pc/Login/Screens/Welcome/welcome_screen.dart';
import 'package:rakit_pc/Screen/compare_part/compare_cpu.dart';
import 'package:rakit_pc/Screen/compare_part/list_part_compare.dart';
import 'package:rakit_pc/Screen/compare_part/pilih_compare_cpu.dart';
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
import 'package:rakit_pc/global.dart' as global;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/part_page/part_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences logindata = await SharedPreferences.getInstance();
  var email = logindata.getString('email');
  if (email != null) {
    global.currentState = homepage();
  } else {
    global.currentState = WelcomeScreen();
  }
  //global.checkLogin();
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Color(0xff9837a5),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => global.currentState,
      '/history': (context) => Simpan(),
      '/build': (context) => howItworks(), //compare_cpu(),
      '/buildAwal': (context) => pertanyaan_awal(),
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
      '/compare': (context) => listCompare(),
      '/compare/cpu': (context) => compare_cpu(),
      '/compare/cpu/list': (context) => listCompareCpu(),
    },
  ));
}

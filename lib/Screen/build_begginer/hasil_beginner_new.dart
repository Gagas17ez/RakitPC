import 'package:flutter/widgets.dart';
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
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:draggable_home/draggable_home.dart';

class Hasil_Rekom extends StatefulWidget {
  Hasil_Rekom({Key? key}) : super(key: key);

  @override
  State<Hasil_Rekom> createState() => _Hasil_RekomState();
}

class _Hasil_RekomState extends State<Hasil_Rekom> {
  var formatter = NumberFormat('#,###,000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff342C4C),

      body: FutureBuilder(
        future: fetch_builds_id(),
        builder: (context, AsyncSnapshot snapshot){
           if (snapshot.hasData){
             return ListView.builder(
               itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Builds build = snapshot.data[index];
             ),
           },
          },
        ),

    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Models/models_cpu.dart';
import '../../Api/api_cpu.dart';
import '../../Api/api_cpu_id.dart';
import 'package:intl/intl.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:rakit_pc/Models/models_vga.dart';
import '../../../../../Api/api_casing.dart';
import '../../../../../Models/models_casing.dart';
import '../../Api/api_cpu.dart';
import '../../Api/api_cpu_cooler.dart';
import '../../Api/api_fan.dart';
import '../../Api/api_motherboard.dart';
import '../../Api/api_psu.dart';
import '../../Api/api_ram.dart';
import '../../Api/api_storage.dart';
import '../../Api/api_vga.dart';
import '../../Models/models_cpu.dart';

class CompareCpu extends StatefulWidget {
  CompareCpu({Key? key}) : super(key: key);
  @override
  State<CompareCpu> createState() => _CompareCpuState();
}

class _CompareCpuState extends State<CompareCpu> {
  var formatter = NumberFormat('#,###,000');
  late Future data;
  List<Cpu> data3 = [];

  @override
  void initState() {
    data = fetchCpu();
    data.then((value) => setState(() {
          data3 = value;
        }));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272B40),
      appBar: AppBar(
        backgroundColor: const Color(0x44000000).withOpacity(0),
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        //backgroundColor: Color.fromARGB(240, 143, 5, 131),
        title: Text(
          "Compare CPU",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: <Widget>[
            if (global.id_compare1 == 0 && global.id_compare2 == 0) ...[
              kosongkiri(),
              const SizedBox(
                width: 20,
              ),
              kosongkanan()
            ] else if (global.id_compare1 != 0 && global.id_compare2 == 0) ...[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.47,
                child: keisiKiri(),
              ),
              kosongkanan()
            ] else if (global.id_compare1 == 0 && global.id_compare2 != 0) ...[
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.47,
                  child: kosongkiri()),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.47,
                  child: keisiKanan()),
            ] else ...[
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: keisiKiriCompare()),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: keisiKananCompare()),
            ],
          ],
        ),
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

  Widget kosongkiri() {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xffDBD8E3).withOpacity(0.3),
              borderRadius: const BorderRadius.all(const Radius.circular(10))),
          margin: const EdgeInsets.only(left: 5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.46,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Icon(
                Icons.add_box_rounded,
                color: Colors.white,
                size: 90.0,
              ),
              Text(
                "Tambah CPU",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 19.0,
                  color: Colors.white,
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.pushNamed(context, '/compare/cpu/list');
        setState(() {
          global.id_yang_dicompare = 1;
        });
      },
    );
  }

  Widget kosongkanan() {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xffDBD8E3).withOpacity(0.3),
              borderRadius: const BorderRadius.all(const Radius.circular(10))),
          margin: const EdgeInsets.only(right: 5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.46,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Icon(
                Icons.add_box_rounded,
                color: Colors.white,
                size: 90.0,
              ),
              Text(
                "Tambah CPU",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 19.0,
                  color: Colors.white,
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.pushNamed(context, '/compare/cpu/list');
        setState(() {
          global.id_yang_dicompare = 2;
        });
      },
    );
  }

  Widget keisiKanan() {
    return data3.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/compare/cpu/list');
              setState(() {
                global.id_yang_dicompare = 1;
              });
            },
            child: Column(
              children: [
                Image.network(
                  data3[global.id_compare2 - 1].imageLink,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text("Nama CPU",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].namaCpu + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Merek CPU",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].merkCpu + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Release Year",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].launchDate + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Cores/Threads",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(
                    data3[global.id_compare2 - 1].coreCount +
                        "/" +
                        data3[global.id_compare2 - 1].threadsCount +
                        "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Clock Speed",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(
                    data3[global.id_compare2 - 1].baseClock +
                        " to " +
                        data3[global.id_compare2 - 1].maxClock +
                        "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Motherboard Socket",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].socket + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Proc Technology",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].procTechnology + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Default TDP",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].defaultTdp + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Unlocked",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].unlocked + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Cache",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].cache + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
              ],
            ));
  }

  Widget keisiKananCompare() {
    return data3.length == 0
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/compare/cpu/list');
              setState(() {
                global.id_yang_dicompare = 2;
              });
            },
            child: Column(
              children: [
                Image.network(
                  data3[global.id_compare2 - 1].imageLink,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text("Nama CPU",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].namaCpu + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Merek CPU",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].merkCpu + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Release Year",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].launchDate + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Motherboard Socket",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].socket + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                if (int.parse(data3[global.id_compare1 - 1].coreCount) >
                    int.parse(data3[global.id_compare2 - 1].coreCount)) ...[
                  Text("Cores/Threads",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xffEB1D36))),
                  Text(
                      data3[global.id_compare2 - 1].coreCount +
                          "/" +
                          data3[global.id_compare2 - 1].threadsCount +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffEB1D36))),
                ] else if (int.parse(data3[global.id_compare1 - 1].coreCount) <
                    int.parse(data3[global.id_compare2 - 1].coreCount)) ...[
                  Text("Cores/Threads",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xff3CCF4E))),
                  Text(
                      data3[global.id_compare2 - 1].coreCount +
                          "/" +
                          data3[global.id_compare2 - 1].threadsCount +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff3CCF4E))),
                ] else ...[
                  Text("Cores/Threads",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(
                      data3[global.id_compare2 - 1].coreCount +
                          "/" +
                          data3[global.id_compare2 - 1].threadsCount +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                if (double.parse(data3[global.id_compare1 - 1].maxClock) >
                    double.parse(data3[global.id_compare2 - 1].maxClock)) ...[
                  Text("Clock Speed",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffEB1D36))),
                  Text(
                      data3[global.id_compare2 - 1].baseClock +
                          " to " +
                          data3[global.id_compare2 - 1].maxClock +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffEB1D36))),
                ] else if (double.parse(
                        data3[global.id_compare1 - 1].maxClock) <
                    double.parse(data3[global.id_compare2 - 1].maxClock)) ...[
                  Text("Clock Speed",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xff3CCF4E))),
                  Text(
                      data3[global.id_compare2 - 1].baseClock +
                          " to " +
                          data3[global.id_compare2 - 1].maxClock +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff3CCF4E))),
                ] else ...[
                  Text("Clock Speed",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(
                      data3[global.id_compare2 - 1].baseClock +
                          " to " +
                          data3[global.id_compare2 - 1].maxClock +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                if (int.parse(data3[global.id_compare1 - 1].procTechnology) >
                    int.parse(
                        data3[global.id_compare2 - 1].procTechnology)) ...[
                  Text("Proc Technology",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffEB1D36))),
                  Text(data3[global.id_compare2 - 1].procTechnology + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffEB1D36))),
                ] else if (int.parse(
                        data3[global.id_compare1 - 1].procTechnology) <
                    int.parse(
                        data3[global.id_compare2 - 1].procTechnology)) ...[
                  Text("Proc Technology",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xff3CCF4E))),
                  Text(data3[global.id_compare2 - 1].procTechnology + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff3CCF4E))),
                ] else ...[
                  Text("Proc Technology",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(data3[global.id_compare2 - 1].procTechnology + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                if (int.parse(data3[global.id_compare1 - 1].defaultTdp) >
                    int.parse(data3[global.id_compare2 - 1].defaultTdp)) ...[
                  Text("Default TDP",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xff3CCF4E))),
                  Text(data3[global.id_compare2 - 1].defaultTdp + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff3CCF4E))),
                ] else if (int.parse(data3[global.id_compare1 - 1].defaultTdp) <
                    int.parse(data3[global.id_compare2 - 1].defaultTdp)) ...[
                  Text("Default TDP",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffEB1D36))),
                  Text(data3[global.id_compare2 - 1].defaultTdp + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffEB1D36))),
                ] else ...[
                  Text("Default TDP",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(data3[global.id_compare2 - 1].defaultTdp + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                if (data3[global.id_compare1 - 1]
                            .unlocked
                            .toString()
                            .toLowerCase() ==
                        "Yes" &&
                    data3[global.id_compare2 - 1]
                            .unlocked
                            .toString()
                            .toLowerCase() ==
                        "No") ...[
                  Text("Unlocked",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffEB1D36))),
                  Text(data3[global.id_compare2 - 1].unlocked + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffEB1D36))),
                ] else if (data3[global.id_compare1 - 1]
                            .unlocked
                            .toString()
                            .toLowerCase() ==
                        "No" &&
                    data3[global.id_compare2 - 1]
                            .unlocked
                            .toString()
                            .toLowerCase() ==
                        "Yes") ...[
                  Text("Unlocked",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xff3CCF4E))),
                  Text(data3[global.id_compare2 - 1].unlocked + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff3CCF4E))),
                ] else ...[
                  Text("Unlocked",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(data3[global.id_compare2 - 1].unlocked + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                Text("Cache",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].cache + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
              ],
            ));
  }

  Widget keisiKiriCompare() {
    return data3.length == 0
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/compare/cpu/list');
              setState(() {
                global.id_yang_dicompare = 1;
              });
            },
            child: Column(
              children: [
                Image.network(
                  data3[global.id_compare1 - 1].imageLink,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text("Nama CPU",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].namaCpu + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Merek CPU",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].merkCpu + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Release Year",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].launchDate + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Motherboard Socket",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].socket + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                if (int.parse(data3[global.id_compare1 - 1].coreCount) <
                    int.parse(data3[global.id_compare2 - 1].coreCount)) ...[
                  Text("Cores/Threads",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xffEB1D36))),
                  Text(
                      data3[global.id_compare1 - 1].coreCount +
                          "/" +
                          data3[global.id_compare1 - 1].threadsCount +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffEB1D36))),
                ] else if (int.parse(data3[global.id_compare1 - 1].coreCount) >
                    int.parse(data3[global.id_compare2 - 1].coreCount)) ...[
                  Text("Cores/Threads",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xff3CCF4E))),
                  Text(
                      data3[global.id_compare1 - 1].coreCount +
                          "/" +
                          data3[global.id_compare1 - 1].threadsCount +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff3CCF4E))),
                ] else ...[
                  Text("Cores/Threads",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(
                      data3[global.id_compare1 - 1].coreCount +
                          "/" +
                          data3[global.id_compare1 - 1].threadsCount +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                if (double.parse(data3[global.id_compare1 - 1].maxClock) <
                    double.parse(data3[global.id_compare2 - 1].maxClock)) ...[
                  Text("Clock Speed",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffEB1D36))),
                  Text(
                      data3[global.id_compare1 - 1].baseClock +
                          " to " +
                          data3[global.id_compare1 - 1].maxClock +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffEB1D36))),
                ] else if (double.parse(
                        data3[global.id_compare1 - 1].maxClock) >
                    double.parse(data3[global.id_compare2 - 1].maxClock)) ...[
                  Text("Clock Speed",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xff3CCF4E))),
                  Text(
                      data3[global.id_compare1 - 1].baseClock +
                          " to " +
                          data3[global.id_compare1 - 1].maxClock +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff3CCF4E))),
                ] else ...[
                  Text("Clock Speed",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(
                      data3[global.id_compare1 - 1].baseClock +
                          " to " +
                          data3[global.id_compare1 - 1].maxClock +
                          "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                if (int.parse(data3[global.id_compare1 - 1].procTechnology) <
                    int.parse(
                        data3[global.id_compare2 - 1].procTechnology)) ...[
                  Text("Proc Technology",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffEB1D36))),
                  Text(data3[global.id_compare1 - 1].procTechnology + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffEB1D36))),
                ] else if (int.parse(
                        data3[global.id_compare1 - 1].procTechnology) >
                    int.parse(
                        data3[global.id_compare2 - 1].procTechnology)) ...[
                  Text("Proc Technology",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xff3CCF4E))),
                  Text(data3[global.id_compare1 - 1].procTechnology + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff3CCF4E))),
                ] else ...[
                  Text("Proc Technology",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(data3[global.id_compare1 - 1].procTechnology + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                if (int.parse(data3[global.id_compare1 - 1].defaultTdp) <
                    int.parse(data3[global.id_compare2 - 1].defaultTdp)) ...[
                  Text("Default TDP",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xff3CCF4E))),
                  Text(data3[global.id_compare1 - 1].defaultTdp + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff3CCF4E))),
                ] else if (int.parse(data3[global.id_compare1 - 1].defaultTdp) >
                    int.parse(data3[global.id_compare2 - 1].defaultTdp)) ...[
                  Text("Default TDP",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffEB1D36))),
                  Text(data3[global.id_compare1 - 1].defaultTdp + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffEB1D36))),
                ] else ...[
                  Text("Default TDP",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(data3[global.id_compare1 - 1].defaultTdp + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                if (data3[global.id_compare1 - 1]
                            .unlocked
                            .toString()
                            .toLowerCase() ==
                        "no" &&
                    data3[global.id_compare2 - 1]
                            .unlocked
                            .toString()
                            .toLowerCase() ==
                        "yes") ...[
                  Text("Unlocked",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffEB1D36))),
                  Text(data3[global.id_compare1 - 1].unlocked + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffEB1D36))),
                ] else if (data3[global.id_compare1 - 1]
                            .unlocked
                            .toString()
                            .toLowerCase() ==
                        "yes" &&
                    data3[global.id_compare2 - 1]
                            .unlocked
                            .toString()
                            .toLowerCase() ==
                        "no") ...[
                  Text("Unlocked",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xff3CCF4E))),
                  Text(data3[global.id_compare1 - 1].unlocked + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff3CCF4E))),
                ] else ...[
                  Text("Unlocked",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xffFFB200))),
                  Text(data3[global.id_compare1 - 1].unlocked + "\n",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFB200))),
                ],
                Text("Cache",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare2 - 1].cache + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
              ],
            ));
  }

  Widget keisiKiri() {
    return data3.length == 0
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/compare/cpu/list');
              setState(() {
                global.id_yang_dicompare = 1;
              });
            },
            child: Column(
              children: [
                Image.network(
                  data3[global.id_compare1 - 1].imageLink,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text("Nama CPU",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].namaCpu + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Merek CPU",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].merkCpu + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Release Year",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].launchDate + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Cores/Threads",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(
                    data3[global.id_compare1 - 1].coreCount +
                        "/" +
                        data3[global.id_compare1 - 1].threadsCount +
                        "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Clock Speed",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(
                    data3[global.id_compare1 - 1].baseClock +
                        " to " +
                        data3[global.id_compare1 - 1].maxClock +
                        "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Motherboard Socket",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].socket + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Proc Technology",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].procTechnology + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Default TDP",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].defaultTdp + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Unlocked",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].unlocked + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
                Text("Cache",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: const Color(0xffD7D7D7))),
                Text(data3[global.id_compare1 - 1].cache + "\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffD7D7D7))),
              ],
            ));
  }
}

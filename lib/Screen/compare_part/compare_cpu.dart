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

class CompareCpu extends StatefulWidget {
  CompareCpu({Key? key}) : super(key: key);
  @override
  State<CompareCpu> createState() => _CompareCpuState();
}

class _CompareCpuState extends State<CompareCpu> {
  var formatter = NumberFormat('#,###,000');

  @override
  void initState() {
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
                  height: MediaQuery.of(context).size.height,
                  child: keisiKanan()),
            ] else ...[
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.47,
                  height: MediaQuery.of(context).size.height,
                  child: keisiKiri()),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.47,
                  height: MediaQuery.of(context).size.height,
                  child: keisiKanan()),
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

  Widget kosong2() {
    return const Text(
      "data",
      textAlign: TextAlign.center,
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
    return FutureBuilder(
        future: fetchCpuId(global.id_compare2),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Cpu cpugan = snapshot.data[index];
                  return ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(167, 209, 206, 198))),
                          margin: const EdgeInsets.all(40),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: ListTile(
                              title: Column(
                                children: <Widget>[
                                  Image.network(cpugan.imageLink),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              selected: true,
                              selectedTileColor:
                                  const Color.fromARGB(131, 241, 237, 241),
                            ),
                          ),
                        ),
                      ),
                      Text("Nama CPU",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: const Color(0xffD7D7D7))),
                      Text(cpugan.namaCpu + "\n",
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
                      Text(cpugan.merkCpu + "\n",
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
                      Text(cpugan.procTechnology + "\n",
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
                      Text(cpugan.coreCount + "/" + cpugan.threadsCount + "\n",
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
                      Text(cpugan.baseClock + " to " + cpugan.maxClock + "\n",
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
                      Text(cpugan.socket + "\n",
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
                      Text(cpugan.launchDate + "\n",
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
                      Text(cpugan.cache + "\n",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffD7D7D7))),
                      Text("Technology",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: const Color(0xffD7D7D7))),
                      Text(cpugan.procTechnology + "\n",
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
                      Text(cpugan.defaultTdp + "\n",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffD7D7D7))),
                      Text("Max Temp",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: const Color(0xffD7D7D7))),
                      Text(cpugan.maxTemp + "\n",
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
                      Text(cpugan.unlocked + "\n",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffD7D7D7))),
                    ],
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget keisiKiri() {
    return FutureBuilder(
        future: fetchCpuId(global.id_compare1),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Cpu cpugan = snapshot.data[index];
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(167, 209, 206, 198))),
                          margin: const EdgeInsets.all(40),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: ListTile(
                              title: Column(
                                children: <Widget>[
                                  Image.network(cpugan.imageLink),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              selected: true,
                              selectedTileColor:
                                  const Color.fromARGB(131, 241, 237, 241),
                            ),
                          ),
                        ),
                      ),
                      Text("Nama CPU",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: const Color(0xffD7D7D7))),
                      Text(cpugan.namaCpu + "\n",
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
                      Text(cpugan.merkCpu + "\n",
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
                      Text(cpugan.procTechnology + "\n",
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
                      Text(cpugan.coreCount + "/" + cpugan.threadsCount + "\n",
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
                      Text(cpugan.baseClock + " to " + cpugan.maxClock + "\n",
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
                      Text(cpugan.socket + "\n",
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
                      Text(cpugan.launchDate + "\n",
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
                      Text(cpugan.cache + "\n",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffD7D7D7))),
                      Text("Technology",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: const Color(0xffD7D7D7))),
                      Text(cpugan.procTechnology + "\n",
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
                      Text(cpugan.defaultTdp + "\n",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffD7D7D7))),
                      Text("Max Temp",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: const Color(0xffD7D7D7))),
                      Text(cpugan.maxTemp + "\n",
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
                      Text(cpugan.unlocked + "\n",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffD7D7D7))),
                    ],
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

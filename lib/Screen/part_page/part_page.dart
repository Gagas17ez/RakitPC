import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/list_part.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:rakit_pc/global.dart' as global;

class Part extends StatefulWidget {
  Part({Key? key}) : super(key: key);
  @override
  State<Part> createState() => _PartState();
}

class _PartState extends State<Part> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272B40),
      appBar: AppBar(
        backgroundColor: Color(0x44000000).withOpacity(0),
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
        title: const Text('Part'),
      ),
      body: ListView(
        children: [
          //Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),

          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Casing',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffDBD8E3),
                                fontFamily: 'Inter',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/img/computer-case.png",
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Wadah dari komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
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
                    Navigator.pushNamed(context, '/part/list/casing');
                    setState(() {
                      global.nama_part = "Casing";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'CPU',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffDBD8E3),
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            'assets/img/cpu.png',
                            height: 50,
                            width: 50,
                            color: Colors.white70,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Otak Dari Komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //trailing: Image.asset('assets/img/cpu.png'),
                  selected: true,
                  selectedTileColor: Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/part/list/cpu');
                    setState(() {
                      global.nama_part = "CPU";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(),
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'VGA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffDBD8E3),
                                fontFamily: 'Inter',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/img/vga.png",
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Penerjemah tampilan komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //trailing: Image.asset("assets/img/vga.png"),
                  selected: true,
                  selectedTileColor: Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/part/list/vga');
                    setState(() {
                      global.nama_part = "VGA";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'CPU Cooler',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffDBD8E3),
                                fontFamily: 'Inter',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            'assets/img/cooler.png',
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Pendingin CPU',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //trailing: Image.asset('assets/img/cpu_cooler.png'),
                  selected: true,
                  selectedTileColor: Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/part/list/cooler');
                    setState(() {
                      global.nama_part = "CPU Cooler";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Motherboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xffDBD8E3),
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/img/motherboard.png",
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Dasar komputer penyambung komponen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //trailing: Image.asset("assets/img/motherboard.png"),
                  selected: true,
                  selectedTileColor: Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/part/list/motherboard');
                    setState(() {
                      global.nama_part = "Motherboard";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'RAM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffDBD8E3),
                                fontFamily: 'Inter',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/img/ram.png",
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Memori sementara komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //trailing: Image.asset("assets/img/ram.png"),
                  selected: true,
                  selectedTileColor: Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/part/list/ram');
                    setState(() {
                      global.nama_part = "Ram";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Fan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffDBD8E3),
                                fontFamily: 'Inter',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/img/cooling-fan.png",
                            width: 45,
                            height: 45,
                            color: Colors.white70,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Kipas pendingin Sistem',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //trailing: Image.asset("assets/img/fan.png"),
                  selected: true,
                  selectedTileColor: Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/part/list/fan');
                    setState(() {
                      global.nama_part = "Fan";
                    });
                  },
                ),
              ),
            ),
          ),

          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Storage',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffDBD8E3),
                                fontFamily: 'Inter',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 4),
                          Image.asset(
                            "assets/img/ssd.png",
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Penyimpanan Memori Komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //trailing: Image.asset("assets/img/storage.png"),
                  selected: true,
                  selectedTileColor: Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/part/list/storage');
                    setState(() {
                      global.nama_part = "Storage";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Power Supply',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffDBD8E3),
                                fontFamily: 'Inter',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/img/psu.png",
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'Pemasok listrik komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //trailing: Image.asset("assets/img/psu.png"),
                  selected: true,
                  selectedTileColor: Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/part/list/psu');
                    setState(() {
                      global.nama_part = "PSU";
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
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
}

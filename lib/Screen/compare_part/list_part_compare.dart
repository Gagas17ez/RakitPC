import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/list_part.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:rakit_pc/global.dart' as global;

class listCompare extends StatefulWidget {
  listCompare({Key? key}) : super(key: key);
  @override
  State<listCompare> createState() => _listCompareState();
}

class _listCompareState extends State<listCompare> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272B40),
      appBar: AppBar(
        backgroundColor: Color(0x44000000).withOpacity(0),
        elevation: 0,

        leading: Padding(
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Icon(Icons.arrow_back_rounded),
          ),
        ),
        //backgroundColor: Color.fromARGB(240, 143, 5, 131),
        title: Text(
          'list Part',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          //Padding(padding:  EdgeInsets.symmetric(horizontal: 10)),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Casing',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Wadah dari komputer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(context, '/listCompare/list/casing');
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'CPU',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Otak Dari Komputer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(context, '/compare/cpu');
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
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'VGA',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Penerjemah tampilan komputer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(context, '/listCompare/list/vga');
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'CPU Cooler',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Pendingin CPU',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(context, '/listCompare/list/cooler');
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Motherboard',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Dasar komputer penyambung komponen',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(
                        context, '/listCompare/list/motherboard');
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'RAM',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Memori sementara komputer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(context, '/listCompare/list/ram');
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Fan',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Kipas pendingin Sistem',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(context, '/listCompare/list/fan');
                  },
                ),
              ),
            ),
          ),

          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Storage',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Penyimpanan Memori Komputer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(context, '/listCompare/list/storage');
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Power Supply',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
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
                      Text(
                        'Pemasok listrik komputer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
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
                    Navigator.pushNamed(context, '/listCompare/list/psu');
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
        child: Icon(
          Icons.build,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}

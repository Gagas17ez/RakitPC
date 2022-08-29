import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/list_part.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:rakit_pc/global.dart' as global;

class ListCompare extends StatefulWidget {
  const ListCompare({Key? key}) : super(key: key);
  @override
  State<ListCompare> createState() => _ListCompareState();
}

class _ListCompareState extends State<ListCompare> {
  @override
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
          Card(
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
                        Text(
                          'Casing',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/img/computer-case.png",
                          width: 50,
                          height: 50,
                          color: Colors.white70,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
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
                selectedTileColor: const Color(0xFF7A77FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // onTap: () {
                //   Navigator.pushNamed(context, '/ListCompare/list/casing');
                // },
              ),
            ),
          ),
          Card(
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
                        Text(
                          'CPU',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/img/cpu.png',
                          height: 50,
                          width: 50,
                          color: Colors.white70,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
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
                selectedTileColor: const Color(0xFF7A77FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/compare/cpu');
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(),
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
                          Text(
                            'VGA',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/img/vga.png",
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
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
                  selectedTileColor: const Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/ListCompare/list/vga');
                  // },
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
                          Text(
                            'CPU Cooler',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/img/cooler.png',
                            width: 50,
                            height: 50,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
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
                  selectedTileColor: const Color(0xFF7A77FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/ListCompare/list/cooler');
                  // },
                ),
              ),
            ),
          ),
          Card(
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
                        Text(
                          'Motherboard',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/img/motherboard.png",
                          width: 50,
                          height: 50,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
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
                selectedTileColor: const Color(0xFF7A77FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // onTap: () {
                //   Navigator.pushNamed(
                //       context, '/ListCompare/list/motherboard');
                // },
              ),
            ),
          ),
          Card(
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
                        Text(
                          'RAM',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/img/ram.png",
                          width: 50,
                          height: 50,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
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
                selectedTileColor: const Color(0xFF7A77FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // onTap: () {
                //   Navigator.pushNamed(context, '/ListCompare/list/ram');
                // },
              ),
            ),
          ),
          Card(
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
                        Text(
                          'Fan',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/img/cooling-fan.png",
                          width: 45,
                          height: 45,
                          color: Colors.white70,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
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
                selectedTileColor: const Color(0xFF7A77FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // onTap: () {
                //   Navigator.pushNamed(context, '/ListCompare/list/fan');
                // },
              ),
            ),
          ),

          Card(
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
                        Text(
                          'Storage',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          "assets/img/ssd.png",
                          width: 50,
                          height: 50,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
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
                selectedTileColor: const Color(0xFF7A77FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // onTap: () {
                //   Navigator.pushNamed(context, '/ListCompare/list/storage');
                // },
              ),
            ),
          ),
          Card(
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
                        Text(
                          'Power Supply',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/img/psu.png",
                          width: 50,
                          height: 50,
                          color: Colors.white70,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
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
                selectedTileColor: const Color(0xFF7A77FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // onTap: () {
                //   Navigator.pushNamed(context, '/ListCompare/list/psu');
                // },
              ),
            ),
          ),
          const SizedBox(height: 40),
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

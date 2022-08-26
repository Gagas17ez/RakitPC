import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';

import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:rakit_pc/global.dart' as global;

class compare_cpu extends StatefulWidget {
  compare_cpu({Key? key}) : super(key: key);
  @override
  State<compare_cpu> createState() => _compare_cpuState();
}

class _compare_cpuState extends State<compare_cpu> {
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
          global.id_compare2.toString(),
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            if (global.id_compare1 == 0 && global.id_compare2 == 0) ...[
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffDBD8E3).withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(left: 5),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                          size: 90.0,
                        ),
                        Text(
                          "Tambah CPUs",
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
              ),
              VerticalDivider(
                color: Colors.white,
                thickness: 3,
                width: 20,
                indent: 50,
                endIndent: 50,
              ),
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffDBD8E3).withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(right: 5),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
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
              ),
            ] else if (global.id_compare1 != 0 && global.id_compare2 == 0) ...[
              InkWell(
                child: Container(
                    margin: EdgeInsets.only(left: 5),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                          size: 90.0,
                        ),
                        Text(
                          "cpu wes onok",
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
              ),
              VerticalDivider(
                color: Colors.white,
                thickness: 3,
                width: 20,
                indent: 50,
                endIndent: 50,
              ),
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffDBD8E3).withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(right: 5),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
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
              ),
            ],
          ],
        ),
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

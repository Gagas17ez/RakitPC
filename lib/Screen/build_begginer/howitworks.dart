import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Screen/build_advanced/build_advanced_new.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan1.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class howItworks extends StatefulWidget {
  howItworks({Key? key}) : super(key: key);

  @override
  State<howItworks> createState() => _howItworksState();
}

class _howItworksState extends State<howItworks> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272B40),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "How it Works",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 40,
                        ),
                        Container(
                          height: 100,
                          child: Text(
                            "Step 1 :",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 15.0,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 30,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                              "Kami akan menanyakan beberapa pertanyaan untuk memahami kebutuhan serta budget Anda",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 40,
                        ),
                        Container(
                          height: 100,
                          child: Text(
                            "Step 2 :",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 15.0,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 30,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                              "Kemudian kami akan merekomendasikan part PC terbaik sesuai kebutuhan Anda",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200),
                  ElevatedButton(
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/buildAwal');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: HexColor("#7A77FF"),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        textStyle: GoogleFonts.poppins(
                          fontSize: 16.0,
                        )),
                  ),
                ],
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/buildAwal');
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

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';

class HowItWorks extends StatefulWidget {
  const HowItWorks({Key? key}) : super(key: key);

  @override
  State<HowItWorks> createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272B40),
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
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 100,
                    width: 40,
                  ),
                  SizedBox(
                    height: 100,
                    child: Text(
                      "Langkah 1 :",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 14.7,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                    width: 30,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                      child: Text(
                        "Kami akan menanyakan beberapa pertanyaan untuk memahami kebutuhan serta budget Anda",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: 14.7,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 100,
                    width: 40,
                  ),
                  SizedBox(
                    height: 100,
                    child: Text(
                      "Langkah 2 :",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 14.7,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                    width: 30,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                      child: Text(
                        "Kemudian kami akan merekomendasikan part PC terbaik sesuai kebutuhan Anda",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: 14.7,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                    width: 40,
                  ),
                ],
              ),
              const SizedBox(height: 200),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16.0,
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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

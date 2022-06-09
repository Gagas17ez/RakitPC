import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/part_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:google_fonts/google_fonts.dart';

class card_home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272B40),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20.0),
          Container(
              padding: const EdgeInsets.only(right: 0.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 100.0,
              child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    _buildCard('Build PC', 'assets/img/build1.png', false,
                        false, context),
                    _buildCard('Part PC', 'assets/img/assemble.png', false,
                        false, context),
                  ])),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(
      String name, String imgPath, bool added, bool isFavorite, context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 6.0, bottom: 5.0, left: 12.0, right: 12.0),
        child: InkWell(
          onTap: () {
            returnbutton(context, name);
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Color.fromARGB(225, 121, 119, 255)),
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    )),
                Hero(
                    tag: imgPath,
                    child: SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: Image.asset(imgPath),
                    )),
                const SizedBox(height: 40.0),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ])),
        ));
  }
}

Future returnbutton(context, name) {
  if (name == "Build PC") {
    return Navigator.pushNamed(context, '/build');
  } else if (name == "Part PC") {
    return Navigator.pushNamed(context, '/part');
  } else {
    return Navigator.pushNamed(context, '/build');
  }
}

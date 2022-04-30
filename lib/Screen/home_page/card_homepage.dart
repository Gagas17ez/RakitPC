import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/part_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class card_home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFAE52BB),
          Color(0xFF0C062A),
        ],
      ),
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
                    _buildCard('Build PC', 'assets/img/rakitBuild.png', false,
                        false, context),
                    _buildCard('Part PC', 'assets/img/rakitPart.png', false,
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
                  color: HexColor("7A77FF")),
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    )),
                Hero(
                    tag: imgPath,
                    child: SizedBox(
                      height: 110.0,
                      width: 110.0,
                      child: Image.asset(imgPath),
                    )),
                const SizedBox(height: 25.0),
                Text(name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'SfM',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400)),
              ])),
        ));
  }
}

Future returnbutton(context, name) {
  if (name == "Build PC") {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pertanyaan_awal()),
    );
  } else if (name == "Part PC") {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Part()),
    );
  } else {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Part()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/part_page.dart';

class card_home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    _buildCard('Build PC', 'assets/img/BuildPC.png', false,
                        false, context),
                    _buildCard('Part PC', 'assets/img/PartPC.png', false, false,
                        context),
                  ])),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(
      String name, String imgPath, bool added, bool isFavorite, context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
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
                  color: Colors.white),
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    )),
                Hero(
                    tag: imgPath,
                    child: Container(
                        height: 70.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)))),
                const SizedBox(height: 7.0),
                Text(name,
                    style: const TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
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

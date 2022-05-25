import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:rakit_pc/global.dart' as global;

class Simpan extends StatefulWidget {
  Simpan({Key? key}) : super(key: key);
  @override
  State<Simpan> createState() => _Simpan();
}

class _Simpan extends State<Simpan> {
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          HexColor("#0C062A"),
          HexColor("#272B40"),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        title: const Text('History Build'),
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
                width: 200,
                height: 70,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/img/casing.png",
                            width: 40,
                            height: 40,
                            color: Colors.white70,
                          ),
                          const Text(
                            'Build 30/02/2022',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'DmSans',
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        '9 components',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'DmSans',
                          fontSize: 14,
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
                    Navigator.pushNamed(context, '/part/list');
                    setState(() {
                      global.nama_part = "Casing";
                    });
                  },
                ),
              ),
            ),
          )
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

import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/card_homepage.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    global.id_builds = 0;
    global.id_cpu_adv = 0;
    global.id_cpu_cooler_adv = 0;
    global.id_fan_adv = 0;
    global.id_mobo_adv = 0;
    global.id_part = 0;
    global.id_psu_adv = 0;
    global.id_ram_adv = 0;
    global.id_storage_adv = 0;
    global.id_ram_adv = 0;
    global.nama_part = "";
  }

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
      appBar: AppBar(
        backgroundColor: Color(0xFF272B40).withOpacity(0.0),
        elevation: 0.0,
        centerTitle: true,
        title: const Text('HomePage',
            style: TextStyle(
                fontFamily: 'SfM', fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.only(left: 0),
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height - 60.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                card_home(),
                card_home(),
                card_home(),
              ]))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pertanyaan_awal()),
          );
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

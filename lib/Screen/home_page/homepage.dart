import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/Welcome/welcome_screen.dart';
import 'package:rakit_pc/Screen/home_page/card_homepage.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late SharedPreferences logindata;
  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    var email = logindata.getString('email');
    if (email != null) {
      setState(() {
        global.currentState = const homepage();
      });
    } else {
      setState(() {
        global.currentState = const WelcomeScreen();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
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
    global.seng_diganti = 0;
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272B40),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('HomePage',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded, color: Colors.white),
            onPressed: () {
              logout(context);
            },
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
              child: TabBarView(
                  controller: _tabController, children: [card_home()]))
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

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (Route<dynamic> route) => false);
    logindata = await SharedPreferences.getInstance();
    setState(() {
      logindata.remove('email');
      global.currentState = WelcomeScreen();
    });
  }
}

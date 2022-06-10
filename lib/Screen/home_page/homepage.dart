import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Login/Screens/Welcome/welcome_screen.dart';
import 'package:rakit_pc/Screen/home_page/card_homepage.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rakit_pc/Models/model_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
    global.darisimpan = false;
    global.id_builds = 0;
    global.id_case_adv = 0;
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
    global.hargacase = 0;
    global.hargacooler = 0;
    global.hargacpu = 0;
    global.hargavga = 0;
    global.hargafan1 = 0;
    global.hargafan2 = 0;
    global.hargafan3 = 0;
    global.hargamobo = 0;
    global.hargapsu = 0;
    global.hargaram1 = 0;
    global.hargaram2 = 0;
    global.hargastorage1 = 0;
    global.hargastorage2 = 0;
    global.hargaharga = 0;
    checkLogin();

    //get the data from firestore
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
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
        title: Text('HomePage',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            )),
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
              padding: const EdgeInsets.all(15.0),
              child: Text(
                greetingMessage() + "${loggedInUser.name}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              )),
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

  //this methode for logout
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

  //Methode for greeting based on time
  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'Good Morning, ';
    } else if (timeNow > 12 && timeNow <= 16) {
      return 'Good Afternoon, ';
    } else if (timeNow > 16 && timeNow < 20) {
      return 'Good Evening, ';
    } else {
      return 'Good Night, ';
    }
  }
}

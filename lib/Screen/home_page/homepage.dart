import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakit_pc/Login/Screens/Welcome/welcome_screen.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/home_page/card_homepage.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rakit_pc/Models/model_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
        global.currentState = const HomePage();
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
    global.dariSimpan = false;
    global.idBuilds = 0;
    global.idCaseAdv = 0;
    global.idVgaAdv = 0;
    global.idCpuAdv = 0;
    global.compatible = "All parts compatible";
    global.idCpuCoolerAdv = 0;
    global.idFanAdv = 0;
    global.idFan2Adv = 0;
    global.idFan3Adv = 0;
    global.idMoboAdv = 0;
    global.idPart = 0;
    global.idPsuAdv = 0;
    global.idRamAdv = 0;
    global.idRam2Adv = 0;
    global.idStorageAdv = 0;
    global.idStorage2Adv = 0;
    global.idRamAdv = 0;
    global.namaPart = "";
    global.sengDiganti = 0;
    global.hargaCase = 0;
    global.hargaCooler = 0;
    global.hargaCpu = 0;
    global.hargaVga = 0;
    global.hargaFan1 = 0;
    global.hargaFan2 = 0;
    global.hargaFan3 = 0;
    global.hargaMobo = 0;
    global.hargaPsu = 0;
    global.hargaRam1 = 0;
    global.hargaRam2 = 0;
    global.hargaStorage1 = 0;
    global.hargaStorage2 = 0;
    global.hargaHarga = 0;
    global.wattTotal = 0;
    global.wattCpu = 0;
    global.wattVga = 0;
    global.wattCooler = 0;
    global.wattFan1 = 0;
    global.wattFan2 = 0;
    global.wattFan3 = 0;
    global.wattRam1 = 0;
    global.wattRam2 = 0;
    global.wattStorage1 = 0;
    global.wattStorage2 = 0;
    global.idCompare1 = 0;
    global.idCompare2 = 0;
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
        // title: Text('RakitPC',
        //     textAlign: TextAlign.center,
        //     style: GoogleFonts.poppins(
        //       fontSize: 22,
        //       color: Colors.white,
        //       fontWeight: FontWeight.w600,
        //     )),
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
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 1),
            child: Text(
              "HomePage",
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 19,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
            child: Text(
              greetingMessage() + "${loggedInUser.name}",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height - 60.0,
              width: double.infinity,
              child: TabBarView(
                  controller: _tabController, children: [CardHome()]))
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
      return 'Selamat Pagi, ';
    } else if (timeNow > 12 && timeNow <= 16) {
      return 'Selamat Siang, ';
    } else if (timeNow > 16 && timeNow < 20) {
      return 'Selamat Sore, ';
    } else {
      return 'Selamat Malam, ';
    }
  }
}

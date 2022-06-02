import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakit_pc/MySqflite.dart';

import '../../Models/models_SimpanBuild.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: tabbar(),
    );
  }
}


class tabbar extends StatefulWidget {


  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {

  List<SimpanBuild> builds = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      builds = await MySqflite.instance.getBuild();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:

      Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          DefaultTabController(
              length: 3, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'This Day'),
                      Tab(text: 'This Week'),
                      Tab(text: 'This Mounth'),
                    ],
                  ),
                ),
                Container(
                    height: 120, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      Container(
                        child: Card(
                          color: Colors.transparent,
                          elevation: 6,
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20), //LTRB
                          child: SizedBox(
                            child: ListTile(
                              title: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/img/casing.png",
                                        width: 35,
                                        height: 35,
                                        color: Colors.white70,
                                      ),
                                      Text(
                                        "build.waktu.toString()",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'DmSans',
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "build.waktu.toString()",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'DmSans',
                                      fontSize: 12,
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
                                  var global;
                                  global.nama_part = "Casing";
                                });
                              },
                            ),
                          ),
                        ),//halaman pertama

                      ),
                      Container(
                        child: Card(
                          color: Colors.transparent,
                          elevation: 6,
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20), //LTRB
                          child: SizedBox(
                            child: ListTile(
                              title: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/img/casing.png",
                                        width: 35,
                                        height: 35,
                                        color: Colors.white70,
                                      ),
                                      Text(
                                        "build.waktu.toString()",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'DmSans',
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "build.waktu.toString()",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'DmSans',
                                      fontSize: 12,
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
                                  var global;
                                  global.nama_part = "Casing";
                                });
                              },
                            ),
                          ),
                        ),//halaman kedua
                      ),
                      Container(
                        child: Card(
                          color: Colors.transparent,
                          elevation: 6,
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20), //LTRB
                          child: SizedBox(
                            child: ListTile(
                              title: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/img/casing.png",
                                        width: 35,
                                        height: 35,
                                        color: Colors.white70,
                                      ),
                                      Text(
                                        "build.waktu.toString()",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'DmSans',
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "build.waktu.toString()",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'DmSans',
                                      fontSize: 12,
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
                                  var global;
                                  global.nama_part = "Casing";
                                });
                              },
                            ),
                          ),
                        ),//halaman ketiga
                      ),
                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
  getBuilds() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    builds = await MySqflite.instance.getBuild();
    setState(() {});
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Api/api_cpu_id.dart';
import 'package:rakit_pc/Models/models_cpu.dart';
import 'package:rakit_pc/Screen/part_page/list_part.dart';
import 'package:rakit_pc/global.dart' as global;

void main() {
  runApp(buildpc_advanced());
}

class buildpc_advanced extends StatefulWidget {
  buildpc_advanced({Key? key}) : super(key: key);

  @override
  State<buildpc_advanced> createState() => _buildpc_advancedState();
}

class _buildpc_advancedState extends State<buildpc_advanced> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Rakit PC',
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    primary: HexColor("#3AA0C0"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    textStyle: const TextStyle(
                      fontFamily: 'JakartaBold',
                      fontSize: 16,
                    )))),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('System Builder'),
          ),
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    margin: EdgeInsets.all(0.0),
                    color: HexColor("#00B16A"),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.check_circle_outline_rounded,
                            color: Colors.white,
                          ),
                          title: const Text('Compatiblity : ',
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                              'No issues or incompatibilities found.',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    margin: EdgeInsets.all(0.0),
                    color: HexColor("#2C85C5"),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.offline_bolt_outlined,
                            color: Colors.white,
                          ),
                          title: Text('Estimated Wattage : OW',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'CPU',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [getcpuwoi()],
                ),
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'CPU Cooler',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Choose Cooler',
                            style: TextStyle(
                              fontFamily: 'DmSans',
                              fontSize: 18,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Memory',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Choose Memory',
                            style: TextStyle(
                              fontFamily: 'DmSans',
                              fontSize: 18,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Motherboard',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Choose Motherboard',
                            style: TextStyle(
                              fontFamily: 'DmSans',
                              fontSize: 18,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Video Card',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Choose Video Card',
                            style: TextStyle(
                              fontFamily: 'DmSans',
                              fontSize: 18,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Storage',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Choose Storage',
                            style: TextStyle(
                              fontFamily: 'DmSans',
                              fontSize: 18,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Monitor',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'DmSans',
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                            )),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Choose Monitor',
                            style: TextStyle(
                              fontFamily: 'DmSans',
                              fontSize: 18,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
                height: 40,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Simpan Build',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'DmSans',
                            fontSize: 20,
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#DBD8E3"),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 70),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(14.89),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }

  Widget getcpuwoi() {
    if (global.id_cpu_adv != 0) {
      return FutureBuilder(
          future: fetch_cpu_id(global.id_cpu_adv),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Cpu cpugan = snapshot.data[index];
                    return Card(
                        margin: EdgeInsets.all(5),
                        color: Colors.blue[400],
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListPart()),
                            );
                            setState(
                              () {
                                global.nama_part = "CPU";
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(cpugan.imageLink),
                                title: Text(
                                  cpugan.namaCpu,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.white70),
                                ),
                                subtitle: Text(
                                  "Core/Threads : " +
                                      cpugan.coreCount +
                                      "/" +
                                      cpugan.threadsCount,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
            return CircularProgressIndicator();
          });
      //
    } else {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListPart()),
            );
            setState(
              () {
                global.nama_part = "CPU";
              },
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Choose CPU',
              style: TextStyle(
                fontFamily: 'DmSans',
                fontSize: 18,
              )));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/casing.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/cpu.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/cpu_cooler.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/fan.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/motherboard.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/ram.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/storage.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/vga.dart';
import 'package:rakit_pc/Screen/part_page/bagian_list_part/psu.dart';
import 'package:rakit_pc/global.dart' as global;

class Part extends StatefulWidget {
  Part({Key? key}) : super(key: key);

  @override
  State<Part> createState() => _PartState();
}

class _PartState extends State<Part> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            child: Icon(Icons.arrow_back_rounded),
          ),
        ),
        //backgroundColor: Color.fromARGB(240, 143, 5, 131),
        title: Text('Part'),
      ),
      body: ListView(
        children: [
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text(
                        'Casing',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Tempat Sebagian Besar Komponen',
                        textAlign: TextAlign.center,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/casing.png"),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CasingList()),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text('CPU Cooler'),
                      Text('Pendingin CPU'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset('assets/img/cpu_cooler.png'),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CpuCoolerList()),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text('CPU'),
                      Text('Otak Dari Komputer'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset('assets/img/cpu.png'),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CpuList()),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text('Fan'),
                      Text('Pendingin Sistem'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/fan.png"),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FanList()),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text('Motherboard'),
                      Text(
                        'Dasar Komputer Penyambung Komponen',
                        textAlign: TextAlign.center,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/motherboard.png"),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MotherboardList()),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text('RAM'),
                      Text(
                        'Penyimpanan Memori Komputer Sementara',
                        textAlign: TextAlign.center,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/ram.png"),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RamList()),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text('Storage'),
                      Text('Penyimpanan Memori Komputer'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/storage.png"),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StorageList()),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text('PSU'),
                      Text('Power Supply Komputer'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/psu.png"),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PsuList()),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      Text('VGA'),
                      Text(
                        'Penerjemah Tampilan Monitor',
                        textAlign: TextAlign.center,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/vga.png"),
                  selected: true,
                  selectedTileColor: Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VgaList()),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/*
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pertanyaan2()),
                  );
                  setState(
                    () {
                      global.budget = 2;
                    },
                  );
                },
 */

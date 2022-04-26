import 'package:flutter/material.dart';

import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/list_part.dart';

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
                MaterialPageRoute(builder: (context) => const homepage()),
              );
            },
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        //backgroundColor: Color.fromARGB(240, 143, 5, 131),
        title: const Text('Part'),
      ),
      body: ListView(
        children: [
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text('Casing',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      const Text(
                        'Tempat Sebagian Besar Komponen',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/casing.png"),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "Casing";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text(
                        'CPU Cooler',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Pendingin CPU',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset('assets/img/cpu_cooler.png'),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "CPU Cooler";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text(
                        'CPU',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Otak Dari Komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset('assets/img/cpu.png'),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "CPU";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text(
                        'Fan',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Pendingin Sistem',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/fan.png"),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "Fan";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text(
                        'Motherboard',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Dasar Komputer Penyambung Komponen',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/motherboard.png"),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "Motherboard";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text(
                        'RAM',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Penyimpanan Memori Komputer Sementara',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/ram.png"),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "Ram";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text(
                        'Storage',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Penyimpanan Memori Komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/storage.png"),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "Storage";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text(
                        'PSU',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Power Supply Komputer',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/psu.png"),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "PSU";
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.all(30),
              child: SizedBox(
                height: 150,
                child: ListTile(
                  //Text(questions[index])
                  title: Column(
                    children: <Widget>[
                      const Text(
                        'VGA',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Penerjemah Tampilan Monitor',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  //subtitle: Text(penjelas[index]),
                  trailing: Image.asset("assets/img/vga.png"),
                  selected: true,
                  selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPart()),
                    );
                    setState(() {
                      global.nama_part = "VGA";
                    });
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

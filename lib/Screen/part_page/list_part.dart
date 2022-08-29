import 'package:flutter/material.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:rakit_pc/Models/models_vga.dart';

import '../../../../../Api/api_casing.dart';
import '../../../../../Models/models_casing.dart';
import 'package:rakit_pc/global.dart' as global;

import '../../Api/api_cpu.dart';
import '../../Api/api_cpu_cooler.dart';
import '../../Api/api_fan.dart';
import '../../Api/api_motherboard.dart';
import '../../Api/api_psu.dart';
import '../../Api/api_ram.dart';
import '../../Api/api_storage.dart';
import '../../Api/api_vga.dart';
import '../../Models/models_cpu.dart';

class ListPart extends StatefulWidget {
  const ListPart({Key? key}) : super(key: key);

  @override
  State<ListPart> createState() => _ListPartState();
}

class _ListPartState extends State<ListPart> {
  late Future data;

  List<Casing> data1 = [];
  List<CpuCooler> data2 = [];
  List<Cpu> data3 = [];
  List<Fan> data4 = [];
  List<Motherboard> data5 = [];
  List<Ram> data6 = [];
  List<Storage> data7 = [];
  List<Psu> data8 = [];
  List<Vga> data9 = [];

  @override
  void initState() {
    if (global.nama_part == "Casing") {
      data = fetchCasing();
      data.then((value) => setState(() {
            data1 = value;
            //ListCasing(data1);
          }));
    } else if (global.nama_part == "CPU Cooler") {
      data = fetchCpuCooler();
      data.then((value) => setState(() {
            data2 = value;
            // /ListCpu_cooler(data2);
          }));
    } else if (global.nama_part == "CPU") {
      data = fetchCpu();
      data.then((value) => setState(() {
            data3 = value;
          }));
    } else if (global.nama_part == "Fan") {
      data = fetchFan();
      data.then((value) => setState(() {
            data4 = value;
          }));
    } else if (global.nama_part == "Motherboard") {
      data = fetchMotherboard();
      data.then((value) => setState(() {
            data5 = value;
          }));
    } else if (global.nama_part == "Ram") {
      data = fetchRam();
      data.then((value) => setState(() {
            data6 = value;
          }));
    } else if (global.nama_part == "Storage") {
      data = fetchStorage();
      data.then((value) => setState(() {
            data7 = value;
          }));
    } else if (global.nama_part == "PSU") {
      data = fetchPsu();
      data.then((value) => setState(() {
            data8 = value;
          }));
    } else if (global.nama_part == "VGA") {
      data = fetchVga();
      data.then((value) => setState(() {
            data9 = value;
          }));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getPart(),
    );
  }

  Widget getPart() {
    if (global.nama_part == "Casing") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('Casing'),
        ),
        body: data1.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data1.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 1;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 500,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data1[index].imageLink),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data1[index].namaCasing,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data1[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data1[index].colorCasing,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data1[index].maxPsu,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "CPU Cooler") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('CPU Cooler'),
        ),
        body: data2.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data2.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 2;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 500,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data2[index].imageLink),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data2[index].namaCooler,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data2[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data2[index].merkCooler,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data2[index].fanSpeed,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                    // cardddddddd
                  );
                }),
      );
    } else if (global.nama_part == "CPU") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('CPU'),
        ),
        body: data3.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data3.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 3;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 500,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data3[index].imageLink),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data3[index].namaCpu,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data3[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data3[index].baseClock,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data3[index].threadsCount,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "Fan") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('Fan'),
        ),
        body: data4.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data4.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 4;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 500,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data4[index].imageLinks),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data4[index].namaFans,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data4[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data4[index].merkFans,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data4[index].colorFans,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "Motherboard") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('Motherboard'),
        ),
        body: data5.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data5.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 5;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 500,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data5[index].imageLink),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data5[index].namaMobo,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data5[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data5[index].namaMobo,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data5[index].chipsetMobo,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "Ram") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('RAM'),
        ),
        body: data6.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data6.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 6;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 500,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data6[index].imageLink),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data6[index].namaRam,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data6[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data6[index].merkRam,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data6[index].memorySize,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data6[index].memorySpeed,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "Storage") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('Storage'),
        ),
        body: data7.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data7.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 7;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 550,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data7[index].imageLink),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data7[index].namaStorage,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data7[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data7[index].merkStorage,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data7[index].storageCapacity,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data7[index].storageInterface,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "PSU") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('PSU'),
        ),
        body: data8.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data8.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 8;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 500,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data8[index].imageLink),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data8[index].namaPsu,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data8[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data8[index].merkPsu,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data8[index].colorPsu,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data8[index].fanSize,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "VGA") {
      return Scaffold(
        backgroundColor: const Color(0xff342C4C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF272B40).withOpacity(0.0),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/part');
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('VGA'),
        ),
        body: data9.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data9.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          width: 2,
                          // color: Color.fromARGB(167, 209, 206, 198)
                          color: Colors.deepPurpleAccent,
                        )),
                    margin: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/part/list/detail');
                        setState(() {
                          global.id_part = 9;
                          global.id_detail = index;
                        });
                      },
                      child: SizedBox(
                        height: 500,
                        child: ListTile(
                          //Text(questions[index])
                          title: Column(
                            children: <Widget>[
                              Image.network(data9[index].imageLink),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data9[index].namaVga,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data9[index].harga.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                          ),
                                        )),
                                    Text(
                                      data9[index].architecture,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      data9[index].boostClock,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          selected: true,
                          selectedTileColor:
                              const Color.fromARGB(221, 241, 237, 241),
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ));
    }
  }
}

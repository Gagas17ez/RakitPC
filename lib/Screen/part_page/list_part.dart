import 'package:flutter/material.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:rakit_pc/Models/models_vga.dart';
import 'package:rakit_pc/Screen/part_page/part_page.dart';

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
import 'detail_part.dart';

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

  void initState() {
    if (global.nama_part == "Casing") {
      data = fetch_casing();
      data.then((value) => setState(() {
            data1 = value;
            //ListCasing(data1);
          }));
    } else if (global.nama_part == "CPU Cooler") {
      data = fetch_cpu_cooler();
      data.then((value) => setState(() {
            data2 = value;
            // /ListCpu_cooler(data2);
          }));
    } else if (global.nama_part == "CPU") {
      data = fetch_cpu();
      data.then((value) => setState(() {
            data3 = value;
          }));
    } else if (global.nama_part == "Fan") {
      data = fetch_fan();
      data.then((value) => setState(() {
            data4 = value;
          }));
    } else if (global.nama_part == "Motherboard") {
      data = fetch_motherboard();
      data.then((value) => setState(() {
            data5 = value;
          }));
    } else if (global.nama_part == "Ram") {
      data = fetch_ram();
      data.then((value) => setState(() {
            data6 = value;
          }));
    } else if (global.nama_part == "Storage") {
      data = fetch_storage();
      data.then((value) => setState(() {
            data7 = value;
          }));
    } else if (global.nama_part == "PSU") {
      data = fetch_psu();
      data.then((value) => setState(() {
            data8 = value;
          }));
    } else if (global.nama_part == "VGA") {
      data = fetch_vga();
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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('Casing'),
        ),
        body: data1.length == 0
            ? const Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data1.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 1;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data1[index].imageLink,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data1[index].namaCasing,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data1[index].casingSidePanel),
                                  Text(data1[index].colorCasing),
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "CPU Cooler") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('CPU Cooler'),
        ),
        body: data2.length == 0
            ? const Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data2.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 2;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data2[index].imageLink,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data2[index].namaCooler,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data2[index].merkCooler),
                                  Text(data2[index].powerCooler),
                                  Text(data2[index].fanSpeed),
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "CPU") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('CPU'),
        ),
        body: data3.length == 0
            ? const Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data3.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 3;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data3[index].imageLink,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data3[index].namaCpu,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data3[index].harga),
                                  Text(data3[index].maxClock),
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "Fan") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('Fan'),
        ),
        body: data4.length == 0
            ? const Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data4.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 4;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data4[index].imageLinks,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data4[index].namaFans,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data4[index].merkFans),
                                  Text(data4[index].colorFans),
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "Motherboard") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('Motherboard'),
        ),
        body: data5.length == 0
            ? const Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data5.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 5;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data5[index].imageLink,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data5[index].namaMobo,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data5[index].chipsetMobo),
                                  Text(data5[index].audioPort),
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "Ram") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('RAM'),
        ),
        body: data6.length == 0
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data6.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 6;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data6[index].imageLink,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data6[index].namaRam,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data6[index].merkRam),
                                  Text(data6[index].memorySize),
                                  Text(data6[index].memorySpeed),
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "Storage") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('Storage'),
        ),
        body: data7.length == 0
            ? const Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data7.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 7;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data7[index].imageLink,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data7[index].namaStorage,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data7[index].merkStorage),
                                  Text(data7[index].storageCapacity),
                                  Text(data7[index].storageInterface),
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "PSU") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('PSU'),
        ),
        body: data8.length == 0
            ? const Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data8.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 8;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data8[index].imageLink,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data8[index].namaPsu,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data8[index].merkPsu),
                                  Text(data8[index].colorPsu),
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else if (global.nama_part == "VGA") {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Part()),
                );
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          title: const Text('VGA'),
        ),
        body: data9.length == 0
            ? const Center(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: data9.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPart()),
                        );
                        setState(() {
                          global.id_part = 9;
                          global.id_detail = index;
                        });
                      },
                      child: Container(
                        // height: 330,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  data9[index].imageLink,
                                  // height: 400,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data9[index].namaVga,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data9[index].architecture),
                                  Text(data9[index].boostClock),
                                  Text(data9[index].dimensionVga)
                                ],
                              ),
                            ),
                            const ButtonBar(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      );
    } else {
      return const Scaffold(
          body: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ));
    }
  }
}

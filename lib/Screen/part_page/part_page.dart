import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/part_page/list_part.dart';

class Part extends StatelessWidget {
  // Generate some dummy data

  var questions = ['CPU', 'Motherboard', 'RAM', 'Storage', 'PSU'];
  var penjelas = [
    'Otak Dari Komputer',
    'Dasar Komputer Penyambung Komponen',
    'Penyimpanan Memori Komputer Sementara',
    'Penyimpanan Memori Komputer',
    'Power Supply Komputer',
  ];
  var gambar = [
    'assets/img/cpu.png',
    'assets/img/motherboard.png',
    'assets/img/ram.png',
    'assets/img/storage.png',
    'assets/img/psu.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back_rounded),
              ),
            ),
            //backgroundColor: Color.fromARGB(240, 143, 5, 131),
            title: const Text('Part'),
          ),
          //backgroundColor: Color.fromARGB(240, 143, 5, 131),
          body: SafeArea(
              child: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) => Card(
              elevation: 6,
              margin: const EdgeInsets.all(15),
              child: SizedBox(
                height: 100,
                child: ListTile(
                    //Text(questions[index])
                    title: Column(
                      children: <Widget>[
                        Text(questions[index]),
                        Text(penjelas[index]),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    //subtitle: Text(penjelas[index]),
                    trailing: Image.asset(gambar[index]),
                    selected: true,
                    selectedTileColor: const Color.fromARGB(255, 205, 207, 207),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(width: 2)),
                    onTap: () => Listpart()),
              ),
            ),
          ))),
    );
  }
}

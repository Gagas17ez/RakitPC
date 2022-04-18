import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_vga.dart';
import 'package:rakit_pc/Models/models_vga.dart';

class VgaList extends StatefulWidget {
  const VgaList({Key? key}) : super(key: key);

  @override
  State<VgaList> createState() => _VgaListState();
}

class _VgaListState extends State<VgaList> {
  late Future data;

  List<Vga> data1 = [];

  void initState() {
    data = fetch_vga();
    data.then((value) => setState(() {
          data1 = value;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data1.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: data1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data1[index].namaVga),
                  subtitle: Image.network(data1[index].imageLink),
                );
              }),
    );
  }
}

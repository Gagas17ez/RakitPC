import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_ram.dart';
import 'package:rakit_pc/Models/models_ram.dart';

class RamList extends StatefulWidget {
  const RamList({Key? key}) : super(key: key);

  @override
  State<RamList> createState() => _RamListState();
}

class _RamListState extends State<RamList> {
  late Future data;

  List<Ram> data1 = [];

  void initState() {
    data = fetch_ram();
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
                  title: Text(data1[index].namaRam),
                  subtitle: Image.network(data1[index].imageLink),
                );
              }),
    );
  }
}

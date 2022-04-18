import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_motherboard.dart';
import 'package:rakit_pc/Models/models_motherboard.dart';

class MotherboardList extends StatefulWidget {
  const MotherboardList({Key? key}) : super(key: key);

  @override
  State<MotherboardList> createState() => _MotherboardListState();
}

class _MotherboardListState extends State<MotherboardList> {
  late Future data;

  List<Motherboard> data1 = [];

  void initState() {
    data = fetch_motherboard();
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
                  title: Text(data1[index].namaMobo),
                  subtitle: Image.network(data1[index].imageLink),
                );
              }),
    );
  }
}

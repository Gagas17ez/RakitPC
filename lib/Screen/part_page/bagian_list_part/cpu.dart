import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_cpu.dart';
import 'package:rakit_pc/Models/models_cpu.dart';

class CpuList extends StatefulWidget {
  const CpuList({Key? key}) : super(key: key);

  @override
  State<CpuList> createState() => _CpuListState();
}

class _CpuListState extends State<CpuList> {
  late Future data;

  List<Cpu> data1 = [];

  void initState() {
    data = fetch_cpu();
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
                  title: Text(data1[index].namaCpu),
                  subtitle: Image.network(data1[index].imageLink),
                );
              }),
    );
  }
}

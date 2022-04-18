import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';

class CpuCoolerList extends StatefulWidget {
  const CpuCoolerList({Key? key}) : super(key: key);

  @override
  State<CpuCoolerList> createState() => _CpuCoolerListState();
}

class _CpuCoolerListState extends State<CpuCoolerList> {
  late Future data;

  List<CpuCooler> data1 = [];

  void initState() {
    data = fetch_cpu_cooler();
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
                  title: Text(data1[index].namaCooler),
                  subtitle: Image.network(data1[index].imageLink),
                );
              }),
    );
  }
}

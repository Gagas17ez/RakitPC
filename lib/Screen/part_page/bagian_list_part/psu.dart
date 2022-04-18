import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_psu.dart';
import 'package:rakit_pc/Models/models_psu.dart';

class PsuList extends StatefulWidget {
  const PsuList({Key? key}) : super(key: key);

  @override
  State<PsuList> createState() => _PsuListState();
}

class _PsuListState extends State<PsuList> {
  late Future data;

  List<Psu> data1 = [];

  void initState() {
    data = fetch_psu();
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
                  title: Text(data1[index].namaPsu),
                  subtitle: Image.network(data1[index].imageLink),
                );
              }),
    );
  }
}

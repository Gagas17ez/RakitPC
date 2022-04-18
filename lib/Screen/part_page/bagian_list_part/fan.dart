import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_fan.dart';
import 'package:rakit_pc/Models/models_fan.dart';

class FanList extends StatefulWidget {
  const FanList({Key? key}) : super(key: key);

  @override
  State<FanList> createState() => _FanListState();
}

class _FanListState extends State<FanList> {
  late Future data;

  List<Fan> data1 = [];

  void initState() {
    data = fetch_fan();
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
                  title: Text(data1[index].namaFans),
                  subtitle: Image.network(data1[index].imageLinks),
                );
              }),
    );
  }
}

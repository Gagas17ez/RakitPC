import 'package:flutter/material.dart';

import '../../../Api/api_casing.dart';
import '../../../Models/models_casing.dart';

class CasingList extends StatefulWidget {
  const CasingList({Key? key}) : super(key: key);

  @override
  State<CasingList> createState() => _CasingListState();
}

class _CasingListState extends State<CasingList> {
  late Future data;

  List<Casing> data1 = [];

  void initState() {
    data = fetch_casing();
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
                  title: Text(data1[index].namaCasing),
                  subtitle: Image.network(data1[index].imageLink),
                );
              }),
    );
  }
}

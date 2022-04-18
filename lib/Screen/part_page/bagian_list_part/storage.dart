import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_storage.dart';
import 'package:rakit_pc/Models/models_storage.dart';

class StorageList extends StatefulWidget {
  const StorageList({Key? key}) : super(key: key);

  @override
  State<StorageList> createState() => _StorageListState();
}

class _StorageListState extends State<StorageList> {
  late Future data;

  List<Storage> data1 = [];

  void initState() {
    data = fetch_storage();
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
                  title: Text(data1[index].namaStorage),
                  subtitle: Image.network(data1[index].imageLink),
                );
              }),
    );
  }
}

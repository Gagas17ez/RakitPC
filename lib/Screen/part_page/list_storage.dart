import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../Api/api_storageID_nyar.dart';
import '../../../../../Models/models_storage.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/widget/search_widget.dart';

class listStorage extends StatefulWidget {
  listStorage({Key? key}) : super(key: key);

  @override
  State<listStorage> createState() => _listStorageState();
}

class _listStorageState extends State<listStorage> {
  late Future data;

  List<Storage> storage = [];
  String query = '';
  Timer? debouncer;

  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final storageu = await StorageApi.fetch_storageID_nyar(query);
    setState(() => this.storage = storageu);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff342C4C),
      appBar: AppBar(
        backgroundColor: Color(0xFF272B40).withOpacity(0.0),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/part');
            },
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        //backgroundColor: Color.fromARGB(240, 143, 5, 131),
        title: const Text('Storage'),
      ),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
                itemCount: storage.length,
                itemBuilder: (context, index) {
                  final hasil = storage[index];
                  return buildList(hasil, index);
                }),
          )
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Nama produk, merk atau besar watt',
        onChanged: searchGan,
      );

  Widget buildList(Storage hasil, int index) => Card(
        elevation: 6,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 2,
              // color: Color.fromARGB(167, 209, 206, 198)
              color: Colors.deepPurpleAccent,
            )),
        margin: EdgeInsets.all(30),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/part/list/detail');
            setState(() {
              global.nama_part = "Storage";
              global.id_detail = int.parse(hasil.idStorage) - 1;
            });
          },
          child: SizedBox(
            height: 550,
            child: ListTile(
              //Text(questions[index])
              title: Column(
                children: <Widget>[
                  Image.network(hasil.imageLink),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          hasil.namaStorage,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shadowColor: Colors.grey,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () {},
                            child: Text(
                              hasil.harga.toString(),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                            )),
                        Text(
                          hasil.merkStorage,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          hasil.storageCapacity,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          hasil.storageInterface,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              selected: true,
              selectedTileColor: Color.fromARGB(221, 241, 237, 241),
            ),
          ),
        ),
      );

  Future searchGan(String query) async => debounce(() async {
        final Storageuu = await StorageApi.fetch_storageID_nyar(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.storage = Storageuu;
        });
      });
}

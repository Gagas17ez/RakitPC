import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../Api/api_motherboardID_nyar.dart';
import '../../../../../Models/models_motherboard.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/widget/search_widget.dart';

class listMotherboard extends StatefulWidget {
  listMotherboard({Key? key}) : super(key: key);

  @override
  State<listMotherboard> createState() => _listMotherboardState();
}

class _listMotherboardState extends State<listMotherboard> {
  late Future data;

  List<Motherboard> mobo = [];
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
    final moboo = await MoboApi.fetch_motherboardID_nyar(query);
    setState(() => this.mobo = moboo);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFAE52BB),
          Color(0xFF0C062A),
        ],
      ),
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
        title: const Text('Motherboard'),
      ),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
                itemCount: mobo.length,
                itemBuilder: (context, index) {
                  final hasil = mobo[index];
                  return buildList(hasil, index);
                }),
          )
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Nama produk, merk atau socket',
        onChanged: searchGan,
      );

  Widget buildList(Motherboard hasil, int index) => Card(
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
              global.nama_part = "Motherboard";
              global.id_detail = int.parse(hasil.idMotherboard) - 1;
            });
          },
          child: SizedBox(
            height: 500,
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
                          hasil.namaMobo,
                          style: const TextStyle(
                            color: Colors.black,
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
                              hasil.harga,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            )),
                        Text(
                          hasil.namaMobo,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          hasil.chipsetMobo,
                          style: const TextStyle(
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
        final mobooo = await MoboApi.fetch_motherboardID_nyar(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.mobo = mobooo;
        });
      });
}

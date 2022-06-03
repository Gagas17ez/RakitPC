import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  var formatter = NumberFormat('#,###,000');
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
    return Scaffold(
      backgroundColor: Color(0xff342C4C),
      appBar: AppBar(
        elevation: 0,
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
        title: const Text('Motherboard',
            style: TextStyle(
                color: Color(0xffDBD8E3),
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
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
        margin: EdgeInsets.fromLTRB(30, 15, 30, 10),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/part/list/detail');
            setState(() {
              global.nama_part = "Motherboard";
              global.id_detail = int.parse(hasil.idMotherboard) - 1;
            });
          },
          child: SizedBox(
            height: 470,
            child: ListTile(
              //Text(questions[index])
              title: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(hasil.imageLink),
                        SizedBox(height: 10),
                        Text(
                          hasil.namaMobo,
                          style: const TextStyle(
                            color: Color(0xff1C1255),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
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
                              "Rp " +
                                  formatter
                                      .format(int.parse(hasil.harga.toString()))
                                      .toString(),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                            )),
                        Text(
                          "Socket : " + hasil.socketMobo,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1C1255),
                          ),
                        ),
                        Text(
                          "Chipset : " + hasil.chipsetMobo,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1C1255),
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

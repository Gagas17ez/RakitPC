import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../Api/api_casingID_nyar.dart';
import '../../../../../Models/models_casing.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:rakit_pc/widget/search_widget.dart';

class listCasing extends StatefulWidget {
  listCasing({Key? key}) : super(key: key);

  @override
  State<listCasing> createState() => _listCasingState();
}

class _listCasingState extends State<listCasing> {
  late Future data;
  bool isDescending = false;

  var formatter = NumberFormat('#,###,000');
  List<Casing> casing = [];
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
    final casee = await CasingApi.fetch_casingID_nyar(query);
    setState(() => this.casing = casee);
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
        title: const Text('Casing',
            style: TextStyle(
                color: Color(0xffDBD8E3),
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(        
        children: <Widget>[
          buildSearch(),
          buildSort(),
          Expanded(
            child: ListView.builder(
                itemCount: casing.length,
                itemBuilder: (context, index) {
                  final sortedItems = casing
                    ..sort((casing1, casing2) => isDescending ? casing2.compareTo(casing1) : casing1.compareTo(casing2));
                  final data = sortedItems[index];
                  final hasil = casing[index];
                  return buildList(hasil, index);
                }),
          )
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Nama produk atau merk',
        onChanged: searchGan,
      );
  Widget buildSort() => Column(
                children: [
                    TextButton.icon(
                      icon: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.compare_arrows, size: 28)
                      ),
                      label: Text(
                        isDescending ? 'Descending' : 'Ascending',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () => setState(() => isDescending = !isDescending),
                    ),
                    Expanded(child: Center()),
                ],        

      );  

  Widget buildList(Casing hasil, int index) => Card(
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
              global.id_detail = int.parse(hasil.idCasing) - 1;
              global.nama_part = "Casing";
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
                          hasil.namaCasing,
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
                          "Merk : " + hasil.merkCasing,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1C1255),
                          ),
                        ),
                        Text(
                          "Dimensi : " + hasil.dimensionCasing,
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
        final caseee = await CasingApi.fetch_casingID_nyar(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.casing = caseee;
        });
      });
}

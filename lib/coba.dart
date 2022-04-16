import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_cpu.dart';
import 'package:rakit_pc/Models/models_cpu.dart';

class MenuWisatapi extends StatefulWidget {
  const MenuWisatapi({Key? key}) : super(key: key);

  @override
  State<MenuWisatapi> createState() => _MenuWisataState();
}

class _MenuWisataState extends State<MenuWisatapi> {
  final List<Cpu> doneTourismPlaceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text(
            "Wisata Surabaya But With API",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'poppins',
              color: Colors.lightBlue,
            ),
          ),
        ),
        body: FutureBuilder(
            future: fetch_cpu(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Cpu wisata = snapshot.data[index];
                      return Card(
                          margin: EdgeInsets.all(5),
                          color: Colors.blue[400],
                          shadowColor: Colors.grey,
                          elevation: 10,
                          child: new InkWell(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Image.network("${wisata.imageLink}"),
                                  title: Text(
                                    "${wisata.namaCpu}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.white70),
                                  ),
                                  subtitle: Text(
                                    "${wisata.coreCount}",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins',
                                        color: Colors.black45),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    });
              }
              return CircularProgressIndicator();
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_builds_id.dart';
import 'package:rakit_pc/Api/api_cpu.dart';
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/Models/models_cpu.dart';

class Rekomendasi_pc extends StatefulWidget {
  const Rekomendasi_pc({Key? key}) : super(key: key);

  @override
  State<Rekomendasi_pc> createState() => _RekomendasiPCState();
}

class _RekomendasiPCState extends State<Rekomendasi_pc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetch_builds_id(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Builds build = snapshot.data[index];
                      return Card(
                        margin: EdgeInsets.all(1),
                        color: Colors.blue.withOpacity(0.1),
                        shadowColor: Colors.grey.withOpacity(0.0),
                        elevation: 10,
                        child: new InkWell(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                child: SizedBox(
                                    width: 200,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "Hasil Rekomendasi kami",
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 50, 10, 5),
                                leading: Image.network(build.imgCpu,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaCpu,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp.${build.hargaCpu}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Image.network(build.imgMobo,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaMobo,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp. " + build.hargaMobo,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Image.network(build.imgRam,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaRam,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp. " + build.hargaRam,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Image.network(build.imgVga,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaVga,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp. " + build.hargaVga,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Image.network(build.imgStorage,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaStorage,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp. " + build.hargaStorage,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Image.network(build.imgPsu,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaPsu,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp. " + build.hargaPsu,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Image.network(build.imgCpuCooler,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaCpuCooler,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp. " + build.hargaCpuCooler,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Image.network(build.imgFans,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaFans,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp. " + build.hargaFans,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Image.network(build.imgCasing,
                                    width: 50, height: 50, fit: BoxFit.cover),
                                title: Text(
                                  build.namaCasing,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  "Rp. " + build.hargaCasing,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'poppins',
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              );
            }));
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_builds_id.dart';
import 'package:rakit_pc/Api/api_cpu.dart';
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/Models/models_cpu.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class Rekomendasi_pc extends StatefulWidget {
  const Rekomendasi_pc({Key? key}) : super(key: key);

  @override
  State<Rekomendasi_pc> createState() => _RekomendasiPCState();
}

class _RekomendasiPCState extends State<Rekomendasi_pc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#272B40"),
      appBar: AppBar(
          title: const Text('Hasil Rekomendasi', textAlign: TextAlign.center),
          backgroundColor: HexColor("#0C062A")),
      body: FutureBuilder(
          future: fetch_builds_id(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Builds build = snapshot.data[index];
                    return Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                      child: Column(
                        children: <Widget>[
                          // CPU

                          Container(
                            // height: 100.0,
                            // padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(const Radius.circular(10.0)),
                              // gradient: const LinearGradient(
                              //   begin: Alignment.bottomRight,
                              //   end: Alignment.topLeft,
                              //   colors: [
                              //     Color(0xFFAE52BB),
                              //     Color(0xFF0C062A),
                              //   ],
                              // ),
                            ),

                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Rekomendasi system',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Rp 13.000.000',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgCpu,
                                          width: 70, height: 70, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              build.namaCpu,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp.${build.hargaCpu}",
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgMobo,
                                          width: 70, height: 70, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: <Widget>[
                                            Text(
                                              build.namaMobo,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. " + build.hargaMobo,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white70,),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgRam,
                                          width: 70, height: 70, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              build.namaRam,
                                              style: const TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Inter',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. " + build.hargaRam,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Inter',
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgVga,
                                          width: 70, height: 70, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              build.namaVga,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. " + build.hargaVga,
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgStorage,
                                          width: 70, height: 70, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              build.namaStorage,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  height: 1.3,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. " + build.hargaStorage,
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgPsu,
                                          width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              build.namaPsu,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. " + build.hargaPsu,
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgCpuCooler,
                                          width: 70, height: 70, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              build.namaCpuCooler,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. " + build.hargaCpuCooler,
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgFans,
                                          width: 70, height: 70, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              build.namaFans,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. " + build.hargaFans,
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Image.network(build.imgCasing,
                                          width: 70, height: 70, fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              build.namaCasing,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Rp. " + build.hargaCasing,
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),

                          // Container(
                          //   height: 100.0,
                          //   // padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(const Radius.circular(10.0)),
                          //     // gradient: const LinearGradient(
                          //     //   begin: Alignment.bottomRight,
                          //     //   end: Alignment.topLeft,
                          //     //   colors: [
                          //     //     Color(0xFFAE52BB),
                          //     //     Color(0xFF0C062A),
                          //     //   ],
                          //     // ),
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10.0, right: 10.0),
                          //         child: Image.network(build.imgMobo,
                          //             width: 70, height: 70, fit: BoxFit.cover),
                          //       ),
                          //       Expanded(
                          //           child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             build.namaMobo,
                          //             style: const TextStyle(
                          //                 fontSize: 20.0,
                          //                 color: Colors.white70,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 8.0,
                          //           ),
                          //           Text(
                          //             "Rp. " + build.hargaMobo,
                          //             style: const TextStyle(
                          //                 fontSize: 12.0,
                          //                 color: Colors.white70),
                          //           ),
                          //         ],
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // Container(
                          //   height: 100.0,
                          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(const Radius.circular(10.0)),
                          //     gradient: const LinearGradient(
                          //       begin: Alignment.bottomRight,
                          //       end: Alignment.topLeft,
                          //       colors: [
                          //         Color(0xFFAE52BB),
                          //         Color(0xFF0C062A),
                          //       ],
                          //     ),
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10.0, right: 10.0),
                          //         child: Image.network(build.imgRam,
                          //             width: 50, height: 50, fit: BoxFit.cover),
                          //       ),
                          //       Expanded(
                          //           child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             build.namaRam,
                          //             style: const TextStyle(
                          //                 fontSize: 20.0,
                          //                 color: Colors.white70,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 8.0,
                          //           ),
                          //           Text(
                          //             "Rp. " + build.hargaRam,
                          //             style: const TextStyle(
                          //                 fontSize: 12.0,
                          //                 color: Colors.white70),
                          //           ),
                          //         ],
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 100.0,
                          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(const Radius.circular(10.0)),
                          //     gradient: const LinearGradient(
                          //       begin: Alignment.bottomRight,
                          //       end: Alignment.topLeft,
                          //       colors: [
                          //         Color(0xFFAE52BB),
                          //         Color(0xFF0C062A),
                          //       ],
                          //     ),
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10.0, right: 10.0),
                          //         child: Image.network(build.imgVga,
                          //             width: 50, height: 50, fit: BoxFit.cover),
                          //       ),
                          //       Expanded(
                          //           child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             build.namaVga,
                          //             style: const TextStyle(
                          //                 fontSize: 20.0,
                          //                 color: Colors.white70,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 8.0,
                          //           ),
                          //           Text(
                          //             "Rp. " + build.hargaVga,
                          //             style: const TextStyle(
                          //                 fontSize: 12.0,
                          //                 color: Colors.white70),
                          //           ),
                          //         ],
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 100.0,
                          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(const Radius.circular(10.0)),
                          //     gradient: const LinearGradient(
                          //       begin: Alignment.bottomRight,
                          //       end: Alignment.topLeft,
                          //       colors: [
                          //         Color(0xFFAE52BB),
                          //         Color(0xFF0C062A),
                          //       ],
                          //     ),
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10.0, right: 10.0),
                          //         child: Image.network(build.imgStorage,
                          //             width: 50, height: 50, fit: BoxFit.cover),
                          //       ),
                          //       Expanded(
                          //           child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             build.namaStorage,
                          //             style: const TextStyle(
                          //                 fontSize: 20.0,
                          //                 color: Colors.white70,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 8.0,
                          //           ),
                          //           Text(
                          //             "Rp. " + build.hargaStorage,
                          //             style: const TextStyle(
                          //                 fontSize: 12.0,
                          //                 color: Colors.white70),
                          //           ),
                          //         ],
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 100.0,
                          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(const Radius.circular(10.0)),
                          //     gradient: const LinearGradient(
                          //       begin: Alignment.bottomRight,
                          //       end: Alignment.topLeft,
                          //       colors: [
                          //         Color(0xFFAE52BB),
                          //         Color(0xFF0C062A),
                          //       ],
                          //     ),
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10.0, right: 10.0),
                          //         child: Image.network(build.imgPsu,
                          //             width: 50, height: 50, fit: BoxFit.cover),
                          //       ),
                          //       Expanded(
                          //           child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             build.namaPsu,
                          //             style: const TextStyle(
                          //                 fontSize: 20.0,
                          //                 color: Colors.white70,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 8.0,
                          //           ),
                          //           Text(
                          //             "Rp. " + build.hargaPsu,
                          //             style: const TextStyle(
                          //                 fontSize: 12.0,
                          //                 color: Colors.white70),
                          //           ),
                          //         ],
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 100.0,
                          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(const Radius.circular(10.0)),
                          //     gradient: const LinearGradient(
                          //       begin: Alignment.bottomRight,
                          //       end: Alignment.topLeft,
                          //       colors: [
                          //         Color(0xFFAE52BB),
                          //         Color(0xFF0C062A),
                          //       ],
                          //     ),
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10.0, right: 10.0),
                          //         child: Image.network(build.imgCpuCooler,
                          //             width: 50, height: 50, fit: BoxFit.cover),
                          //       ),
                          //       Expanded(
                          //           child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             build.namaCpuCooler,
                          //             style: const TextStyle(
                          //                 fontSize: 20.0,
                          //                 color: Colors.white70,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 8.0,
                          //           ),
                          //           Text(
                          //             "Rp. " + build.hargaCpuCooler,
                          //             style: const TextStyle(
                          //                 fontSize: 12.0,
                          //                 color: Colors.white70),
                          //           ),
                          //         ],
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 100.0,
                          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(const Radius.circular(10.0)),
                          //     gradient: const LinearGradient(
                          //       begin: Alignment.bottomRight,
                          //       end: Alignment.topLeft,
                          //       colors: [
                          //         Color(0xFFAE52BB),
                          //         Color(0xFF0C062A),
                          //       ],
                          //     ),
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10.0, right: 10.0),
                          //         child: Image.network(build.imgFans,
                          //             width: 50, height: 50, fit: BoxFit.cover),
                          //       ),
                          //       Expanded(
                          //           child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             build.namaFans,
                          //             style: const TextStyle(
                          //                 fontSize: 20.0,
                          //                 color: Colors.white70,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 8.0,
                          //           ),
                          //           Text(
                          //             "Rp. " + build.hargaFans,
                          //             style: const TextStyle(
                          //                 fontSize: 12.0,
                          //                 color: Colors.white70),
                          //           ),
                          //         ],
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 100.0,
                          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(const Radius.circular(10.0)),
                          //     gradient: const LinearGradient(
                          //       begin: Alignment.bottomRight,
                          //       end: Alignment.topLeft,
                          //       colors: [
                          //         Color(0xFFAE52BB),
                          //         Color(0xFF0C062A),
                          //       ],
                          //     ),
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10.0, right: 10.0),
                          //         child: Image.network(build.imgCasing,
                          //             width: 50, height: 50, fit: BoxFit.cover),
                          //       ),
                          //       Expanded(
                          //           child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             build.namaCasing,
                          //             style: const TextStyle(
                          //                 fontSize: 20.0,
                          //                 color: Colors.white70,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 8.0,
                          //           ),
                          //           Text(
                          //             "Rp. " + build.hargaCasing,
                          //             style: const TextStyle(
                          //                 fontSize: 12.0,
                          //                 color: Colors.white70),
                          //           ),
                          //         ],
                          //       )),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 54,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          HexColor("DBD8E3")),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(14),
                                          ))),
                                  child: Text(
                                    "Beli Build",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  onPressed: () async {
                                    final url = build.links;

                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 140,
                                height: 54,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            HexColor("DBD8E3")),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(14),
                                            ))),
                                    child: Text(
                                      "Kembali ke Home",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/');
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/build');
        },
        backgroundColor: HexColor("#7A77FF"),
        child: const Icon(
          Icons.build,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}

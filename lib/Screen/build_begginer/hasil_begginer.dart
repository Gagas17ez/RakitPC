import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_builds_id.dart';
import 'package:rakit_pc/Api/api_cpu.dart';
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/Models/models_cpu.dart';
import 'package:rakit_pc/Screen/home_page/bottom_navbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rakit_pc/Screen/build_begginer/pertanyaan_awal.dart';

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
                                    height: 100.0,
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                      gradient: new LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                        colors: [
                                          Color(0xFFAE52BB),
                                          Color(0xFF0C062A),
                                        ],
                                      ),
                                    ),
                                    child: new Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                          child: new Image.network(build.imgCpu, width: 50, height: 50, fit: BoxFit.cover),
                                        ),
                                        new Expanded(child:
                                        new Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Text(build.namaCpu, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                            new SizedBox(height: 8.0,),
                                            new Text("Rp.${build.hargaCpu}", style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                          ],)),
                                      ],),

                                  ),
                              const SizedBox(
                                height: 10,

                              ),

                              Container(
                                height: 100.0,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFFAE52BB),
                                      Color(0xFF0C062A),
                                    ],
                                  ),
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new Image.network(build.imgMobo,width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    new Expanded(child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(build.namaMobo, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                        new SizedBox(height: 8.0,),
                                        new Text("Rp. " + build.hargaMobo, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                      ],)),
                                  ],),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100.0,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFFAE52BB),
                                      Color(0xFF0C062A),
                                    ],
                                  ),
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new Image.network(build.imgRam,width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    new Expanded(child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(build.namaRam, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                        new SizedBox(height: 8.0,),
                                        new Text("Rp. " + build.hargaRam, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                      ],)),
                                  ],),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100.0,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFFAE52BB),
                                      Color(0xFF0C062A),
                                    ],
                                  ),
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new Image.network(build.imgVga,width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    new Expanded(child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(build.namaVga, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                        new SizedBox(height: 8.0,),
                                        new Text("Rp. " + build.hargaVga, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                      ],)),
                                  ],),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100.0,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFFAE52BB),
                                      Color(0xFF0C062A),
                                    ],
                                  ),
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new Image.network(build.imgStorage,width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    new Expanded(child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(build.namaStorage, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                        new SizedBox(height: 8.0,),
                                        new Text( "Rp. " + build.hargaStorage, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                      ],)),
                                  ],),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100.0,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFFAE52BB),
                                      Color(0xFF0C062A),
                                    ],
                                  ),
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new Image.network(build.imgPsu,width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    new Expanded(child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(build.namaPsu, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                        new SizedBox(height: 8.0,),
                                        new Text("Rp. " + build.hargaPsu, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                      ],)),
                                  ],),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100.0,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFFAE52BB),
                                      Color(0xFF0C062A),
                                    ],
                                  ),
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new Image.network(build.imgCpuCooler,width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    new Expanded(child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(build.namaCpuCooler, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                        new SizedBox(height: 8.0,),
                                        new Text("Rp. " + build.hargaCpuCooler, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                      ],)),
                                  ],),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100.0,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFFAE52BB),
                                      Color(0xFF0C062A),
                                    ],
                                  ),
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new Image.network(build.imgFans, width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    new Expanded(child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(build.namaFans, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                        new SizedBox(height: 8.0,),
                                        new Text("Rp. " + build.hargaFans, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                      ],)),
                                  ],),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100.0,
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFFAE52BB),
                                      Color(0xFF0C062A),
                                    ],
                                  ),
                                ),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new Image.network(build.imgCasing, width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                    new Expanded(child:
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(build.namaCasing, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                                        new SizedBox(height: 8.0,),
                                        new Text("Rp. " + build.hargaCasing, style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                                      ],)),
                                  ],),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 160,
                                    height: 54,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(HexColor("DBD8E3")),
                                          shape:
                                          MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(14),
                                              ))),
                                      child: Text(
                                        "Simpan Build",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: 'SfM',
                                        ),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: ( ),
                                        // );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 160,
                                    height: 54,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(HexColor("DBD8E3")),
                                          shape:
                                          MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(14),
                                              ))),
                                      child: Text(
                                        "Kembali ke Home",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: 'SfM',
                                        ),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: ( ),
                                        // );
                                      },
                                    ),
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pertanyaan_awal()),
          );
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

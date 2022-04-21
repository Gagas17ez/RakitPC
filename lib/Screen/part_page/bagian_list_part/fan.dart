import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_fan.dart';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:rakit_pc/Screen/part_page/part_page.dart';

class FanList extends StatefulWidget {
  const FanList({Key? key}) : super(key: key);

  @override
  State<FanList> createState() => _FanListState();
}

class _FanListState extends State<FanList> {
  late Future data;

  List<Fan> data1 = [];

  void initState() {
    data = fetch_fan();
    data.then((value) => setState(() {
          data1 = value;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Part()),
              );
            },
            child: Icon(Icons.arrow_back_rounded),
          ),
        ),
        //backgroundColor: Color.fromARGB(240, 143, 5, 131),
        title: Text('Fan'),
      ),
      body: data1.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: data1.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      // height: 330,
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image.network(data1[index].imageLinks,
                                // height: 400,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data1[index].namaFans,
                                  style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text( data1[index].merkFans),
                                Text(data1[index].colorFans),
                              ],
                            ),
                          ),
                          ButtonBar(),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}

// title: Text(data1[index].namaFans),
// subtitle: Image.network(data1[index].imageLinks),
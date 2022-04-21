import 'package:flutter/material.dart';
import 'package:rakit_pc/Api/api_cpu_cooler.dart';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:rakit_pc/Screen/part_page/part_page.dart';

class CpuCoolerList extends StatefulWidget {
  const CpuCoolerList({Key? key}) : super(key: key);

  @override
  State<CpuCoolerList> createState() => _CpuCoolerListState();
}

class _CpuCoolerListState extends State<CpuCoolerList> {
  late Future data;

  List<CpuCooler> data1 = [];

  void initState() {
    data = fetch_cpu_cooler();
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
        title: Text('Cpu Cooler'),
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
                              Image.network(data1[index].imageLink,
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
                                  data1[index].namaCooler,
                                  style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text( data1[index].merkCooler),
                                Text(data1[index].powerCooler),
                                Text(data1[index].fanSpeed),
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

// return ListTile(
// title: Text(data1[index].namaCooler),
// subtitle: Image.network(data1[index].imageLink),
// );

// return Card(
// child: ListTile(
// subtitle: Image.network(data1[index].imageLink),
// title: Text(data1[index].namaCooler),
// ),
// elevation: 8,
// shadowColor: Colors.blueGrey,
// margin: EdgeInsets.all(20),
// );
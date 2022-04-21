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
                  child:Container(
                    height: 100,
                    width: 200,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Expanded(
                              child:Image.network(data1[index].imageLink),
                              flex:2 ,
                            ),
                          ),
                        ),
                        Expanded(
                          child:Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: ListTile(
                                    title: Text(data1[index].namaCooler),
                                    subtitle: Text("RP 3.000.000"),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        child:Text("Beli"),
                                        onPressed: ()
                                        {},
                                      ),
                                      SizedBox(width: 8,),
                                      TextButton(
                                        child: Text("Tambahkan ke List"),
                                        onPressed: (){},
                                      ),
                                      SizedBox(width: 8,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          flex:8 ,
                        ),
                      ],
                    ),
                  ),
                  elevation: 8,
                  margin: EdgeInsets.all(10),
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
// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(const build_advanced());
}

class build_advanced extends StatelessWidget {
  const build_advanced({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Rakit PC',
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    primary: HexColor("#3AA0C0"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    textStyle: const TextStyle(
                      fontFamily: 'JakartaBold',
                      fontSize: 16,
                    )))),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('System Builder'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),

        children: [

          Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                margin: EdgeInsets. all(0.0),
                color: HexColor("#00B16A"),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      dense:true,
                      leading: Icon(Icons.check_circle_outline_rounded,
                        color: Colors.white,
                      ),
                      title: const Text('Compatiblity : ',
                      style: TextStyle(color: Colors.white)),
                      subtitle: Text(
                        'No issues or incompatibilities found.',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                margin: EdgeInsets. all(0.0),
                color: HexColor("#2C85C5"),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.offline_bolt_outlined,
                        color: Colors.white,
                      ),
                      title:  Text('Estimated Wattage : OW',
                          style: TextStyle(color: Colors.white)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Container(
          //   child: Card(
          //     clipBehavior: Clip.antiAlias,
          //     child: Column(
          //       children: [
          //         ListTile(
          //           leading: Icon(Icons.offline_bolt_outlined),
          //           title: const Text('Estimated Wattage : 0W'),
          //           subtitle: Text(
          //             '',
          //             style: TextStyle(color: Colors.black.withOpacity(0.6)),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(
            width: 30,
            height: 20,
          ),

          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                 const Text('CPU',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'DmSans',
                  fontSize: 18,
                  ),
                ),

                 Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                  color: Colors.black,
                  height: 20,
                  )),
                ),
              ],
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.                                                                                                                                                       add),
                    label: const Text('Choose CPU',
                    style: TextStyle(
                      
                      fontFamily: 'DmSans',
                      fontSize: 18,
                    ))),
              ],
            ),
          ),

          const SizedBox(
            width: 30,
            height: 20,
          ),

          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                 const Text('CPU Cooler',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'DmSans',
                  fontSize: 18,
                  ),
                ),

                 Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                  color: Colors.black,
                  height: 20,
                  )),
                ),
              ],
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Choose Cooler',
                    style: TextStyle(
                      fontFamily: 'DmSans',
                      fontSize: 18,
                    ))),
              ],
            ),
          ),

          const SizedBox(
            width: 30,
            height: 20,
          ),

          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                 const Text('Memory',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'DmSans',
                  fontSize: 18,
                  ),
                ),

                 Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                  color: Colors.black,
                  height: 20,
                  )),
                ),
              ],
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Choose Memory',
                    style: TextStyle(
                      fontFamily: 'DmSans',
                      fontSize: 18,
                    ))),
              ],
            ),
          ),

          const SizedBox(
            width: 30,
            height: 20,
          ),

          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                 const Text('Motherboard',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'DmSans',
                  fontSize: 18,
                  ),
                ),

                 Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                  color: Colors.black,
                  height: 20,
                  )),
                ),
              ],
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Choose Motherboard',
                    style: TextStyle(
                      fontFamily: 'DmSans',
                      fontSize: 18,
                    ))),
              ],
            ),
          ),

          const SizedBox(
            width: 30,
            height: 20,
          ),

          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                 const Text('Video Card',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'DmSans',
                  fontSize: 18,
                  ),
                ),

                 Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                  color: Colors.black,
                  height: 20,
                  )),
                ),
              ],
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Choose Video Card',
                    style: TextStyle(
                      fontFamily: 'DmSans',
                      fontSize: 18,
                    ))),
              ],
            ),
          ),
          
          const SizedBox(
            width: 30,
            height: 20,
          ),

          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                 const Text('Storage',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'DmSans',
                  fontSize: 18,
                  ),
                ),

                 Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                  color: Colors.black,
                  height: 20,
                  )),
                ),
              ],
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(

                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Choose Storage',
                    style: TextStyle(
                      fontFamily: 'DmSans',
                      fontSize: 18,
                    ))),
              ],
            ),
          ),
          
          const SizedBox(
            width: 30,
            height: 20,
          ),

          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                 const Text('Monitor',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'DmSans',
                  fontSize: 18,
                  ),
                ),

                 Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Divider(
                  color: Colors.black,
                  height: 20,
                  )),
                ),
              ],
            )
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Choose Monitor',
                    style: TextStyle(
                      fontFamily: 'DmSans',
                      fontSize: 18,
                    ))
                    
                ),
              ],
            ),
          ),
          
          const SizedBox(
            width: 30,
            height: 40,
          ),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Simpan Build',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'DmSans',
                            fontSize: 20,
                          )),
                          style: ElevatedButton.styleFrom(
                            primary: HexColor("#DBD8E3"),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(14.89),
                            ),
                      ),
                  ),
              ],
            ),
          ),

          // Container(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           primary: Colors.black,
          //         ),
          //         onPressed: () {},
          //         child: const Text(
          //           'Simpan Build',
          //           style: TextStyle(fontSize: 24),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          
        ],
      ),
      // body: (
      //   children: Padding(
      //     padding: EdgeInsets.all(20),
      //     children: [
      //       ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
      //       const SizedBox(
      //         width: 30,
      //         height: 20,
      //       ),
      //       ElevatedButton.icon(
      //           onPressed: () {},
      //           icon: const Icon(Icons.add),
      //           label: const Text('Choose Cooler')),
      //       ElevatedButton.icon(
      //           onPressed: () {},
      //           icon: const Icon(Icons.add),
      //           label: const Text('Choose Cooler'))

      //     ],
      //   ),
      // ),
      // The bottom navigation bar
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.grey[300],
      //   // this creates a notch in the center of the bottom bar
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 6,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(
      //         icon: const Icon(
      //           Icons.home,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(
      //           Icons.people,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {},
      //       ),
      //       const SizedBox(
      //         width: 20,
      //       ),
      //       IconButton(
      //         icon: const Icon(
      //           Icons.chat_outlined,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(
      //           Icons.account_circle_rounded,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
      // // implement the floating button
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {},
      //     backgroundColor: Colors.deepPurple[300],
      //     child: const Icon(Icons.build_rounded)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const Build_Advanced());
}

class Build_Advanced extends StatelessWidget {
  const Build_Advanced({Key? key}) : super(key: key);

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
                    primary: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    textStyle: const TextStyle(
                      fontFamily: 'JakartaBold',
                      fontSize: 24,
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
          Container(
            margin: EdgeInsets.all(5),
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
          ),
          const SizedBox(
            width: 30,
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(5),
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
          ),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        // this creates a notch in the center of the bottom bar
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                Icons.chat_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      // implement the floating button
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.deepPurple[300],
          child: const Icon(Icons.build_rounded)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

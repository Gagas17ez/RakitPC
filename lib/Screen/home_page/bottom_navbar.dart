import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';
import 'package:rakit_pc/Screen/part_page/part_page.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // ignore: prefer_const_constructors
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Icon(Icons.home, color: Color(0xFFEF7532)),
                          //Icon(Icons.chat, color: Color(0xFF676E79))
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width / 2 - 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // Icon(Icons.history, color: Color(0xFF676E79)),
                            const Icon(Icons.devices_other,
                                color: const Color(0xFF676E79))
                          ],
                        )),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Part()),
                      );
                    },
                  )
                ])));
  }
}
import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/home_page/homepage.dart';

class card_home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    _buildCard('Build PC', 'assets/img/BuildPC.png',
                        false, false, context),
                    _buildCard('Part PC', 'assets/img/PartPC.png', false,
                        false, context),
                    _buildCard('Coming Soon', 'assets/img/UpgradePC.png',
                        false, false, context),
                    _buildCard('Coming Soon', 'assets/img/GuidesPC.png',
                        false, false, context),
                  ])),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            // onTap: () {
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => HomeDetail(
            //           assetPath: imgPath,
            //           cookieprice: price,
            //           cookiename: name)));
            // },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // children: [
                          //   isFavorite
                          //       ? const Icon(Icons.favorite,
                          //           color: Color(0xFFEF7532))
                          //       : const Icon(Icons.favorite_border,
                          //           color: Color(0xFFEF7532))
                          // ]
                      )
                  ),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  const SizedBox(height: 7.0),
                  // Text(price,
                  //     style: const TextStyle(
                  //         color: Color(0xFFCC8053),
                  //         fontFamily: 'Varela',
                  //         fontSize: 14.0)),
                  Text(name,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  // Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //         color: const Color(0xFFEBEBEB), height: 1.0)),
                  // Padding(
                  //     padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           if (!added) ...[
                  //             const Icon(Icons.build,
                  //                 color: Color(0xFFD17E50), size: 12.0),
                  //             const Text('add to build',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Varela',
                  //                     color: Color(0xFFD17E50),
                  //                     fontSize: 12.0)),
                  //           ],
                  //           if (added) ...[
                  //             const Icon(Icons.remove_circle_outline,
                  //                 color: Color(0xFFD17E50), size: 12.0),
                  //             const Text('3',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Varela',
                  //                     color: Color(0xFFD17E50),
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 12.0)),
                  //             const Icon(Icons.add_circle_outline,
                  //                 color: Color(0xFFD17E50), size: 12.0),
                  //           ]
                  //         ]))
                ]))));
  }
}

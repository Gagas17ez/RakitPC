import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/Signup/components/body/body_mobile.dart';
import 'package:rakit_pc/Login/Screens/Signup/components/body/body_desktop.dart';
import 'package:rakit_pc/Login/responsive/responsive.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: BodyMobile(),
      tablet: BodyDesktop(),
      desktop: BodyDesktop(),
    );
  }
}

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    // return Responsive(
    //   mobile: BodyMobile(),
    //   tablet: BodyDesktop(),
    //   desktop: BodyDesktop(),
    // );
//   }
// }

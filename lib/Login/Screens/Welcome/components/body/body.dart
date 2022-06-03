import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/Welcome/components/body/body_desktop.dart';
import 'package:rakit_pc/Login/Screens/Welcome/components/body/body_mobile.dart';
import 'package:rakit_pc/Login/responsive/responsive.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: BodyMobile(),
      tablet: BodyDesktop(),
      desktop: BodyDesktop(),
    );
  }
}

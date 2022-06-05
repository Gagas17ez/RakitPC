import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/Screens/Login/login_screen.dart';
import 'package:rakit_pc/Login/Screens/Signup/components/background.dart';
import 'package:rakit_pc/Login/Screens/Signup/components/or_divider.dart';
import 'package:rakit_pc/Login/components/already_have_an_account_acheck.dart';
import 'package:rakit_pc/Login/components/rounded_button.dart';
import 'package:rakit_pc/Login/components/rounded_input_field.dart';
import 'package:rakit_pc/Login/components/rounded_nama_field.dart';
import 'package:rakit_pc/Login/components/rounded_password_field.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../Screen/home_page/homepage.dart';
// import 'package:flutter_svg/svg.dart';

class BodyMobile extends StatefulWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  State<BodyMobile> createState() => _BodyMobileState();
}

class _BodyMobileState extends State<BodyMobile> {
  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/RPC_final.png",
              width: size.width * 0.4,
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/signup.svg",
            //   height: size.height * 0.35,
            // ),
            // RoundedNamaField(
            //   hintText: " Name",
            //   onChanged: (value) {},
            // ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                _email = value.trim();
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value.trim();
              },
            ),
            RoundedButton(
              color: Colors.black,
              text: "SIGNUP",
              press: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );                
              },
            ),
            const OrDivider(),
          ],
        ),
      ),
    );
  }
}

/*
class BodyMobile extends StatelessWidget {
  BodyMobile({Key? key}) : super(key: key);

  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/RPC_final.png",
              width: size.width * 0.4,
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/signup.svg",
            //   height: size.height * 0.35,
            // ),
            // RoundedNamaField(
            //   hintText: " Name",
            //   onChanged: (value) {},
            // ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                _email = value.trim();
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value.trim();
              },
            ),
            RoundedButton(
              color: Colors.black,
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                });
              },
            ),
            const OrDivider(),
          ],
        ),
      ),
    );
  }
}

 */
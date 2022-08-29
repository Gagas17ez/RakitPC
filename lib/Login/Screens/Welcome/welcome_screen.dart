import 'package:flutter/material.dart';
import 'components/body/body.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<bool> _onwillPop() async {
    return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Are You sure?'),
              content: const Text('Do you want to exit App'),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Yes')),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onwillPop,
        child: const Scaffold(
          body: Body(),
        ));
  }
}

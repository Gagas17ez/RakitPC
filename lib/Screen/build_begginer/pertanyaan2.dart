import 'package:flutter/material.dart';
import 'package:rakit_pc/Screen/build_begginer/hasil_begginer.dart';
import 'package:rakit_pc/global.dart' as global;
import 'package:im_stepper/stepper.dart';

class Pertanyaan2 extends StatefulWidget {
  Pertanyaan2({Key? key}) : super(key: key);

  @override
  State<Pertanyaan2> createState() => _Pertanyaan2State();
}

class _Pertanyaan2State extends State<Pertanyaan2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertanyaan 2'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: const Card(
              child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Apa kegunaan dari komputer tersebut",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 50, 5, 5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {},
                child: const Text('Button 1')),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {},
                child: const Text('Button 2')),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {},
                child: const Text('Button 2')),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () {},
                child: const Text('Button 2')),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                DotStepper(
                  // direction: Axis.vertical,
                  dotCount: global.dot_count,
                  dotRadius: 12,

                  /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
                  activeStep: global.active_dot,
                  shape: Shape.circle,
                  spacing: 10,
                  indicator: Indicator.shift,

                  /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
                  onDotTapped: (tappedDotIndex) {
                    setState(() {
                      global.active_dot = tappedDotIndex;
                    });
                  },

                  // DOT-STEPPER DECORATIONS
                ),

                /// Jump buttons.
                Padding(padding: const EdgeInsets.all(18.0), child: steps()),

                // Next and Previous buttons.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [previousButton(), nextButton()],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row steps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(global.dot_count, (index) {
        return ElevatedButton(
          child: Text('${index + 1}'),
          onPressed: () {
            setState(() {
              global.active_dot = index;
            });
          },
        );
      }),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
        if (global.active_dot < global.dot_count - 1) {
          setState(() {
            global.active_dot++;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Rekomendasi_pc()),
            );
          });
        }
      },
    );
  }

  Widget previousButton() {
    return ElevatedButton(
      child: Text('Prev'),
      onPressed: () {
        // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.
        if (global.active_dot > 0) {
          setState(() {
            global.active_dot--;
          });
        }
      },
    );
  }
}

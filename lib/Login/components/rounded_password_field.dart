import 'package:flutter/material.dart';
import 'package:rakit_pc/Login/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: _isObscure,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: Colors.purple,
          ),
          suffixIcon: InkWell(
            onTap: () => setState(() => _isObscure = !_isObscure),
            child: Icon(!_isObscure ? Icons.visibility : Icons.visibility_off),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

// class RoundedPasswordField extends StatefulWidget {
//    final ValueChanged<String> onChanged;
//    const RoundedPasswordField({Key? key,required this.onChanged,}) : super(key: key);
//
//   @override
//   State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
// }
//
// class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
//      String? onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return TextFieldContainer(
//       child: TextField(
//         obscureText: true,
//         onChanged: onChanged,
//         cursorColor: Colors.purple,
//         decoration: const InputDecoration(
//           hintText: "Password",
//           icon: Icon(
//             Icons.lock,
//             color: Colors.purple,
//           ),
//           suffixIcon: Icon(
//             Icons.visibility,
//             color: Colors.purple,
//           ),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }

// class RoundedPasswordField extends StatelessWidget {
//   final ValueChanged<String> onChanged;
//
//   const RoundedPasswordField({
//     Key? key,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFieldContainer(
//       child: TextField(
//         obscureText: true,
//         onChanged: onChanged,
//         cursorColor: Colors.purple,
//         decoration: const InputDecoration(
//           hintText: "Password",
//           icon: Icon(
//             Icons.lock,
//             color: Colors.purple,
//           ),
//           suffixIcon: Icon(
//             Icons.visibility,
//             color: Colors.purple,
//           ),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }

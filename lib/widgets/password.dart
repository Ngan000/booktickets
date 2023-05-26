import 'package:flutter/material.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.hint, required this.inputAction}) : super(key: key);

  final String hint;

  final TextInputAction inputAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
      child: Container(
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFF4F6FD),
        ),

        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15)),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: Styles.headLineStyle4.copyWith(fontSize: 16)
          ),
          obscureText: true,
          style: Styles.headLineStyle2.copyWith(color: Colors.blueGrey),
          textInputAction: inputAction,
          //textInputAction: TextInputType.next,
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class TexttInput extends StatelessWidget {
  const TexttInput({Key? key, required this.hint, required this.inputType, required this.inputAction}) : super(key: key);

  final String hint;
  final TextInputType inputType;
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
          style: Styles.headLineStyle2.copyWith(color: Colors.blueGrey),
          keyboardType: inputType,
          textInputAction: inputAction,
          //textInputAction: TextInputType.next,
        ),
      ),
    );
  }
}

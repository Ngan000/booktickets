import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/fly_1.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

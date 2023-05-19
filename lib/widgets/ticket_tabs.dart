import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs({Key? key, required this.firstTab, required this.secondTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
      child: Container(
        // co them 1 viền to hơn ở ngoài
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(50),),
          color: const Color(0xFFF4F6F0),
        ),
        child: Row(
          children: [
            //Airline tickets
            Container(
              width: size.width*.44, //44% man hinh
              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
              decoration: BoxDecoration(
                //chi co ben trai bo goc
                borderRadius: BorderRadius.horizontal(left: Radius.circular(AppLayout.getHeight(50)),),
                color: Colors.white,
              ),
              child: Center(
                child: Text(firstTab),
              ),
            ),
            /*
                hotels
                 */
            Container(
              width: size.width*.44, //44% man hinh
              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
              decoration: BoxDecoration(
                //chi co ben phai bo goc
                borderRadius: BorderRadius.horizontal(right: Radius.circular(AppLayout.getHeight(50)),),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(secondTab),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:booktickets/model/cheap.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';

class UpcomingCheap extends StatelessWidget {
  final bool? isColor;
  final String originName;
  final String destination;
  //Data? data;
  //String? originName;
  final String destinationName;
  final String originCode;
  UpcomingCheap({
    super.key,
    required this.originName,
    required this.destination,
    this.isColor,
    //required this.originName,
    required this.destinationName,
    required this.originCode,
    //this.data
  });

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      child: Column(
        children: [
          // showing the blue part of the card/ticket
          Container(
            decoration: BoxDecoration(
              //nếu null thì dùng màu đó, còn không thì dùng màu trắng
              color: isColor == null ? Color(0xFF526799) : Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      originCode,
                      style: isColor == null
                          ? Styles.headLineStyle3.copyWith(color: Colors.white)
                          : Styles.headLineStyle3,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    ThickContainer(isColor: true),
                    Expanded(
                      child: Stack(children: [
                        SizedBox(
                          height: AppLayout.getHeight(24),
                          child: AppLayoutBuilderWidget(
                            sections: 6,
                          ),
                        ),
                        // xoay 90 do tuc la 1.5
                        Center(
                            child: Transform.rotate(
                          angle: 1.5,
                          child: Icon(Icons.local_airport_rounded,
                              color: isColor == null
                                  ? Colors.white
                                  : Color(0xFF8ACCF7)),
                        )),
                      ]),
                    ),
                    ThickContainer(isColor: true),
                    Expanded(
                      child: Container(),
                    ),
                    Text(destination,
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3)
                  ],
                ),
                const Gap(3),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(originName,
                            style: isColor == null
                                ? Styles.headLineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3)),
                    Text(
                      '',
                      style:
                          Styles.headLineStyle3.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(
                        destinationName,
                        //destinationName ?? '',
                        //textAlign can chinh van ban
                        textAlign: TextAlign.end,
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/utils/util.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';

import '../data_sources/api_name_services.dart';
import '../data_sources/api_services.dart';
import '../model/name.dart';
import '../model/post.dart';

class TicketTopTop extends StatelessWidget {
  Data? data;
  String? originName;
  String? destinationName;
  String? originCode;
  String? duration;
  //final Map<String, dynamic> ticket;
  final bool? isColor;
  TicketTopTop(
      {Key? key,
      this.isColor,
      required this.originName,
      this.destinationName,
      required this.originCode,
      this.duration,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      child: Container(
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
                        originCode ?? '',
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
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
                      Text(data!.destination,
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
                          child: Text(originName ?? '',
                              style: isColor == null
                                  ? Styles.headLineStyle3
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle3)),
                      Text(
                        duration ?? '',
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      // cách viết ngày giờ
                      /*Text(
                          Util.converDateTimeToString(
                              widget.data!.returnAt, 'dd MMM'),
                          style: widget.isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle4),
                      */
                      // Text(
                      //   duration ?? '',
                      //   style: isColor == null
                      //       ? Styles.headLineStyle3
                      //           .copyWith(color: Colors.white)
                      //       : Styles.headLineStyle3,
                      // ),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          destinationName ?? '',
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
      ),
    );
  }
}

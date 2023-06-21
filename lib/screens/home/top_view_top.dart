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

class TicketTopTop extends StatelessWidget {
  String? originName;
  String? destinationName;
  String? originCode;
  String? duration;
  // pure variable type

  String destination;
  DateTime returnAt;
  DateTime departureAt;
  String flightNumber;
  //final Map<String, dynamic> ticket;
  final bool? isColor;
  TicketTopTop(
      {Key? key,
      this.isColor,
      required this.originName,
      required this.destinationName,
      required this.originCode,
      this.duration,
      required this.destination,
      required this.returnAt,
      required this.departureAt,
      required this.flightNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      child: Container(
        child: Column(
          children: [
            Gap(AppLayout.getHeight(20)),
            // showing the blue part of the card/ticket
            Container(
              decoration: BoxDecoration(
                //nếu null thì dùng màu đó, còn không thì dùng màu trắng
                color: isColor == null ? Color(0xFF526799) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(21)),
                  topRight: Radius.circular(21),
                ),
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
            Container(
              color: isColor == null
                  ? Styles.orangeColor
                  : Colors.white, //const Color(0xFFf37b67),
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.grey.shade200
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => SizedBox(
                                width: 5,
                                height: 1,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: isColor == null
                                        ? Colors.white
                                        : Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.grey.shade200
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
            //bottom part of the orange card/ticket
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                  bottomRight: Radius.circular(isColor == null ? 21 : 0),
                ),
              ),
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                        firstText:
                            Util.converDateTimeToString(returnAt, 'dd MMM'),
                        secondText: "Date",
                        alignment: CrossAxisAlignment.start,
                        isColor: isColor,
                      ),
                      AppColumnLayout(
                        firstText: departureAt.toString().substring(11, 16),
                        secondText: "Departure time",
                        alignment: CrossAxisAlignment.center,
                        isColor: isColor,
                      ),
                      AppColumnLayout(
                        firstText: flightNumber,
                        secondText: "Number",
                        alignment: CrossAxisAlignment.end,
                        isColor: isColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

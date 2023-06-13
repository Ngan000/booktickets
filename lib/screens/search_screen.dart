import 'package:booktickets/screens/arrival_screen.dart';
import 'package:booktickets/screens/date_screen.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/icon_text_widget.dart';
import 'package:booktickets/widgets/ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/double_text_widget.dart';
import 'departure_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        //EdgeInsets.symmetric: left = right = horizontal, top = bottom = vertical
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(20),
          vertical: AppLayout.getHeight(20),
        ),
        children: [
          Gap(AppLayout.getHeight(40)), // const Gap(40),
          Text(
            "What are\nyou looking for?",
            style: Styles.headLineStyle1
                .copyWith(fontSize: AppLayout.getWidth(35)),
          ),
          Gap(AppLayout.getHeight(20)),

          //goi toi AppTicketTabs o ticket_tabs
          const AppTicketTabs(
            firstTab: "Airline Tickets",
            secondTab: "Hotels",
          ),
          Gap(AppLayout.getHeight(25)),

          // goi toi AppiconText de co the su dung lai
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepartureScreen()),
                );
                print("You are tapped");
              },
              child: const AppIconText(
                  icon: Icons.flight_takeoff_rounded, text: "Departure"),
            ),
          ),

          Gap(AppLayout.getHeight(20)),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArrivalScreen()),
                );
                print("You are tapped");
              },
              child: const AppIconText(
                  icon: Icons.flight_land_rounded, text: "Arrival"),
            ),
          ),
          Gap(AppLayout.getHeight(20)),

          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDatePicker()),
                );
                print("You are tapped");
              },
              child:
                  const AppIconText(icon: Icons.calendar_month, text: "Date"),
            ),
          ),

          Gap(AppLayout.getHeight(25)),

          //Button find
          Container(
              //mau nen
              padding: EdgeInsets.symmetric(
                vertical: AppLayout.getWidth(18),
                horizontal: AppLayout.getWidth(15),
              ),
              decoration: BoxDecoration(
                color: Color(0xD91130CE),
                borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
              ),
              child: Center(
                child: Text("find tickets",
                    style: Styles.textStyle.copyWith(color: Colors.white)),
              )),
          Gap(AppLayout.getHeight(40)),

          const AppDoubleTextWidget(
              bigText: "Upcoming flight", smallText: "View all"),
          Gap(AppLayout.getHeight(15)),

          Row(
            //can vao giua
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppLayout.getHeight(425),
                width: size.width * 0.42,

                //phan vien trang
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(15),
                  vertical: AppLayout.getWidth(15),
                ),

                //trang tri hop o ngoai
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(20)),
                    //tao bong
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(190),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(12)),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/sit.jpg"))),
                    ),
                    Gap(AppLayout.getHeight(12)),
                    //phan chữ
                    Text(
                      "20% discount on the early booking of this flight. Don't miss.",
                      style: Styles.headLineStyle2,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  //dung stack de xep chong len nhau
                  Stack(
                    children: [
                      //phan mau xanh o tren
                      Container(
                        //44% man hinh
                        width: size.width * 0.44,
                        height: AppLayout.getHeight(200),

                        decoration: BoxDecoration(
                          color: Color(0xFF3AB8B8),
                          //bo goc
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(18)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(15),
                            horizontal: AppLayout.getHeight(15)),
                        child: Column(
                          //căn chỉnh
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discount\nfor survey",
                              style: Styles.headLineStyle2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text(
                              "Take the survey about our services and get discount",
                              style: Styles.headLineStyle2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),

                      //Positioned được sử dụng để định vị cho một widget con của một Stack
                      Positioned(
                        //toạ độ
                        right: -45,
                        top: -40,

                        child:
                            // miếng hình tròn góc phải
                            Container(
                          //vien ngoai
                          padding: EdgeInsets.all(
                            AppLayout.getHeight(30),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 18, color: Color(0xFF189999)),
                            //mau o giua trong suot
                            color: Colors.transparent, //transparent: trong suot
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(15)),

                  //phan mau do
                  Container(
                      width: size.width * 0.44,
                      height: AppLayout.getHeight(210),
                      padding: EdgeInsets.symmetric(
                        vertical: AppLayout.getHeight(15),
                        horizontal: AppLayout.getHeight(15),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(18)),
                          color: const Color(0xFFEC6545)),
                      child: Column(
                        children: [
                          Text(
                            "Take love",
                            style: Styles.headLineStyle2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            //can chinh van ban o giua
                            textAlign: TextAlign.center,
                          ),
                          Gap(AppLayout.getHeight(5)),
                          RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: '😍', style: TextStyle(fontSize: 35)),
                              TextSpan(
                                  text: '😎', style: TextStyle(fontSize: 50)),
                              TextSpan(
                                  text: '😘', style: TextStyle(fontSize: 35))
                            ]),
                          ),
                        ],
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

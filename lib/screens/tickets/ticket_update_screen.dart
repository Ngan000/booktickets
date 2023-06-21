import 'dart:developer';

import 'package:booktickets/screens/tickets/ticket_update_view.dart';
import 'package:booktickets/screens/tickets/ticket_view.dart';
import 'package:booktickets/screens/tickets/upcoming_cheap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import '../../data_sources/api_name_services.dart';
import '../../data_sources/api_services.dart';
import '../../model/cheap.dart';
import '../../model/name.dart';
import '../../services/datetime.dart';
import '../../utils/app_info_list.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';

class TicketUpdateScreen extends StatefulWidget {
  TicketUpdateScreen({
    super.key,
  });

  @override
  State<TicketUpdateScreen> createState() => _TicketUpdateScreenState();
}

class _TicketUpdateScreenState extends State<TicketUpdateScreen> {
  Cheap? cheap;
  List<City> _listCity = [];
  //var isLoaded = false;
  late Cheap cheapList;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
        //thay doi mau nen
        backgroundColor: Styles.bgColor,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(20),
                        //vertical: AppLayout.getHeight(20)
                      ),
                      children: [
                        Gap(AppLayout.getHeight(40)),
                        Text(
                          "Tickets",
                          style: Styles.headLineStyle1,
                        ),
                        //Gap(AppLayout.getHeight(20)),

                        Container(
                          // co them 1 viền to hơn ở ngoài
                          padding: const EdgeInsets.all(3.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppLayout.getHeight(50),
                            ),
                            color: const Color(0xFFF4F6F0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * .44, //44% man hinh
                                padding: EdgeInsets.symmetric(
                                    vertical: AppLayout.getHeight(7)),
                                decoration: BoxDecoration(
                                  //chi co ben trai bo goc
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(
                                        AppLayout.getHeight(50)),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text('Upcoming'),
                                ),
                              ),
                              Container(
                                width: size.width * .44, //44% man hinh
                                padding: EdgeInsets.symmetric(
                                    vertical: AppLayout.getHeight(7)),
                                decoration: BoxDecoration(
                                  //chi co ben phai bo goc
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(
                                        AppLayout.getHeight(50)),
                                  ),
                                  color: Colors.transparent,
                                ),
                                child: Center(
                                  child: Text('Previous'),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //su dung lai code o ticket_tabs
                        //AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
                        //Gap(AppLayout.getHeight(20)),

                        // Container(
                        //   padding:
                        //       EdgeInsets.only(left: AppLayout.getHeight(15)),
                        //   child: TicketUpdateView(originCode: ,
                        //   originName: ,
                        //   destination: ,
                        //   destinationName: ,),
                        // ),
                      ]),
                ),
                FutureBuilder<Cheap>(
                    future: ApiServices.flightCheap(
                        startTime: TimeServices.list30Days()[0],
                        endTime: TimeServices.list30Days()[29]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: TimeServices.list30Days().length,
                              itemBuilder: (context, index) {
                                cheapList = snapshot.data!;

                                return FutureBuilder<List<City>>(
                                    future: ApiNameService.nameUserFind(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        _listCity = snapshot.data ?? [];
                                        City? city = _listCity.firstWhere(
                                          (element) =>
                                              element.code ==
                                              cheapList
                                                  .data[TimeServices
                                                      .list30Days()[index]]!
                                                  .origin,
                                        );

                                        City? city1 = _listCity.firstWhere(
                                          (element) =>
                                              element.code ==
                                              cheapList
                                                  .data[TimeServices
                                                      .list30Days()[index]]!
                                                  .destination,
                                        );
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: TicketUpdateView(
                                              originCode: cheapList
                                                  .data[TimeServices
                                                      .list30Days()[index]]!
                                                  .origin,
                                              destination: cheapList
                                                  .data[TimeServices
                                                      .list30Days()[index]]!
                                                  .destination,
                                              originName: city.name.toString(),
                                              destinationName:
                                                  city1.name.toString(),
                                              flightNumber:
                                                  cheapList.data[TimeServices.list30Days()[index]]!.flightNumber
                                                      .toString(),
                                              returnAt: cheapList
                                                  .data[TimeServices
                                                      .list30Days()[index]]!
                                                  .returnAt,
                                              departureAt: cheapList
                                                  .data[TimeServices.list30Days()[index]]!
                                                  .departureAt),
                                        );
                                      } else if (snapshot.hasError) {
                                        log('error');
                                      }
                                      return Container();
                                      // return const Center(
                                      //   child: CircularProgressIndicator(),
                                      // );
                                    });
                              }),
                        );
                      } else if (snapshot.hasError) {
                        log('error');
                      }
                      return Center(child: const CircularProgressIndicator());
                    })
              ],
            ),
          )
        ]));
  }
}

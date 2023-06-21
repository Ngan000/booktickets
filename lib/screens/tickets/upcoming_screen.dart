import 'dart:developer';

import 'package:booktickets/screens/tickets/upcoming_cheap.dart';
import 'package:booktickets/services/datetime.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:booktickets/data_sources/api_name_services.dart';
import 'package:booktickets/data_sources/api_services.dart';
import 'package:booktickets/model/cheap.dart';
import 'package:booktickets/model/name.dart';
import 'package:booktickets/utils/app_styles.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  Cheap? cheap;
  List<City> _listCity = [];
  //var isLoaded = false;
  late Cheap cheapList;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cheapest flight'),
          centerTitle: true,
        ),
        backgroundColor: Styles.bgColor,
        body: FutureBuilder<Cheap>(
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
                                          .data[
                                              TimeServices.list30Days()[index]]!
                                          .origin,
                                );

                                City? city1 = _listCity.firstWhere(
                                  (element) =>
                                      element.code ==
                                      cheapList
                                          .data[
                                              TimeServices.list30Days()[index]]!
                                          .destination,
                                );
                                return UpcomingCheap(
                                  originCode: cheapList
                                      .data[TimeServices.list30Days()[index]]!
                                      .origin,
                                  destination: cheapList
                                      .data[TimeServices.list30Days()[index]]!
                                      .destination,
                                  originName: city.name.toString(),
                                  destinationName: city1.name.toString(),
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
            }));
  }
}

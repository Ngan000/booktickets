import 'dart:convert';

import 'package:booktickets/data_sources/api_services.dart';
import 'package:booktickets/model/name.dart';
import 'package:booktickets/services/datetime.dart';
import 'package:booktickets/screens/top_view_top.dart';
import 'package:booktickets/screens/view_top_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../data_sources/api_name_services.dart';
import '../model/post.dart';
import '../utils/app_info_list.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class FlightAllScreen extends StatefulWidget {
  const FlightAllScreen({Key? key}) : super(key: key);

  @override
  State<FlightAllScreen> createState() => _FlightAllScreenState();
}

class _FlightAllScreenState extends State<FlightAllScreen> {
  Data? data;
  List<City>? _listCity;
  //var isLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(onReady);
  }

  void onReady(Duration timeStamp) {
    getName();
  }

  getName() async {
    var data = await ApiNameService.nameUser();
    print(data);

    setState(() {
      _listCity = data;
    });
  }

  Future<List<Data>> getData() {
    return ApiServices.flightUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All flights'),
          centerTitle: true,
        ),
        backgroundColor: Styles.bgColor,
        body: Container(
          child: FutureBuilder<List<Data>>(
              future: getData(),
              builder: (context, snapshot) {
                print(snapshot.connectionState);
                if ((snapshot.hasError) || (!snapshot.hasData))
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                List<Data>? dataList = snapshot.data;
                return ListView.builder(
                    itemCount: dataList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      City? city = _listCity?.firstWhere(
                        (element) => element.code == dataList[index].origin,
                      );
                      City? city1 = _listCity?.firstWhere(
                        (element) =>
                            element.code == dataList[index].destination,
                      );
                      DateTime departureTime = dataList[index].departureAt;
                      DateTime arrivalTime = dataList[index].returnAt;
                      Duration flightDuration =
                          Duration(minutes: dataList[index].durationTo);

                      return TicketTopTop(
                        data: dataList[index],
                        originName: city != null ? city.name : '',
                        destinationName: city1 != null ? city1.name : '',
                        originCode: dataList[index].origin,
                        duration:
                            '${flightDuration.inHours}H ${flightDuration.inMinutes.remainder(60)}M',
                      );
                      // Container(
                      //   child: Text('${dataList[index]}'),
                      // );
                    });
              }),
        ));
  }
}

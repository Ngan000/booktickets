import 'dart:developer';

import 'package:booktickets/screens/upcoming_cheap.dart';
import 'package:booktickets/services/datetime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

import '../data_sources/api_name_services.dart';
import '../data_sources/api_services.dart';
import '../model/cheap.dart';
import '../model/name.dart';
import '../model/post.dart';
import '../utils/app_styles.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  Cheap? cheap;
  late List<City>? _listCity;
  //var isLoaded = false;
  late Cheap cheapList;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(onReady);
  }

  // Hàm onReady được gọi sau khi widget hiển thị trên màn hình, và nó sẽ gọi hàm getName()
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
                        City? city = _listCity?.firstWhere(
                          (element) =>
                              element.code ==
                              cheapList.data[TimeServices.list30Days()[index]]!
                                  .origin,
                        );
                        City? city1 = _listCity?.firstWhere(
                          (element) =>
                              element.code ==
                              cheapList.data[TimeServices.list30Days()[index]]!
                                  .destination,
                        );
                        return UpcomingCheap(
                          originCode: cheapList
                              .data[TimeServices.list30Days()[index]]!.origin,
                          destination: cheapList
                              .data[TimeServices.list30Days()[index]]!
                              .destination,
                          originName: city!.name.toString(),
                          //city != null ? city.name : '',
                          destinationName: city1!.name.toString(),
                          //city1 != null ? city1.name : '',
                          //originCode: cheapList.data[index].origin ,
                        );
                        // Text(cheapList
                        //     .data[TimeServices.list30Days()[index]]!.origin);
                      }),
                );
              } else if (snapshot.hasError) {
                log('error');
              }
              return const CircularProgressIndicator(); // return ListView.builder(
              //     itemCount: cheapList!.data.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       // City? city = _listCity?.firstWhere(
              //       //   (element) => element.code == cheapList[index].origin,
              //       // );
              //       return Text(cheapList!.data[index]!.destination);
              //       //
              //       // return UpcomingCheap(
              //       //   cheap: cheapList[index], originCode: '',
              //       //   //originName: city != null ? city.name : '',
              //       //   // originCode: cheapList.data[index].origin ,
              //       // );
              //     });
            }));
  }
}

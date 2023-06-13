import 'package:booktickets/model/name.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import '../data_sources/api_name_services.dart';
import '../data_sources/api_services.dart';
import '../model/post.dart';
import '../widgets/layout_builder_widget.dart';

class ArrivalScreen extends StatefulWidget {
  const ArrivalScreen({super.key});

  @override
  State<ArrivalScreen> createState() => _ArrivalScreenState();
}

class _ArrivalScreenState extends State<ArrivalScreen> {
  City? _city;
  List<City>? _listCity;
  //var isLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(onReady);
  }

  void onReady(Duration timeStamp) {
    getName();
    // co the them nhieu nua
  }

  getName() async {
    var data = await ApiNameService.nameUser();
    print(data);

    setState(() {
      _listCity = data;
    });
  }

  Future<List<City>> getData() {
    return ApiNameService.nameUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arrival'),
        centerTitle: true,
      ),
      backgroundColor: Styles.bgColor,
      body: Container(
        child: FutureBuilder<List<City>>(
            future: getData(),
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              if ((snapshot.hasError) || (!snapshot.hasData))
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              List<City>? nameList = snapshot.data;
              return ListView.builder(
                  itemCount: nameList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ArrivalUI(
                      city: nameList[index],
                      name: nameList[index].name,
                      code: nameList[index].code,
                    );
                  });
            }),
      ),
    );
  }
}

class ArrivalUI extends StatelessWidget {
  City? city;
  String? name;
  String? code;
  ArrivalUI({
    super.key,
    this.city,
    this.code,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(AppLayout.getHeight(10)),
            Container(
              child: Text(
                code ?? '',
                style: Styles.headLineStyle3,
              ),
            ),
            Gap(AppLayout.getHeight(5)),
            Container(
              child: Text(name ?? ''),
            ),
            const AppLayoutBuilderWidget(
              sections: 15,
              isColor: false,
              width: 5,
            ),
          ]),
    );
  }
}

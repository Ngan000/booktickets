import 'dart:convert';

import 'package:booktickets/network/network_request.dart';
import 'package:booktickets/screens/view_top_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  late List<Data> datas;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async{
    datas = (await NetworkRequest().getData())!;
    if(datas != null){
      setState(() {
        isLoaded= true;
      });
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView.builder(
        itemCount: datas?.length,
        itemBuilder: (context,index){
          return Container(
            child: Text("hi"),
          );
        }

        /*

        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(40),
            vertical: AppLayout.getHeight(40)
        ),
        children: [
          Column(
            children: [
              Text("ALL LIGHT", style: Styles.headLineStyle1,)
            ],
          ),
          Gap(AppLayout.getHeight(20)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                child: Text(
                  "List all flight",
                  style: Styles.headLineStyle3,
                ),
              )

            ],
          ),
          Gap(AppLayout.getHeight(20)),
          Column(
            children: ticketList.map((singleTicket) => TicketTop(ticket: singleTicket,)).toList(),
          ),
          Gap(AppLayout.getHeight(20)),
          Column(
            children: ticketList.map((singleTicket) => TicketTop(ticket: singleTicket,)).toList(),
          ),
        ],

        */
      ),
    );
  }
}

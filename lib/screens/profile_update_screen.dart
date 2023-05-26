import 'package:booktickets/screens/Login_Screen.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileUpdateScreen extends StatelessWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(21)),
        children: [
          Container(
            child: Row(
              children: [

                Expanded(
                  flex:2,
                  child:Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage("assets/images/img_1.png")
                        )
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(10)),
                Expanded(
                    flex: 5,
                    child:Container(
                      child: Text("Book tickets", style: Styles.headLineStyle1,),
                    ) )
              ],
            ),

          ),

          Gap(AppLayout.getHeight(80)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(40),),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Text("Login",
                              style: Styles.textStyle
                                  .copyWith(color: Colors.black38, fontSize: 30, fontWeight: FontWeight.bold )),
                        ),
                      ),
                    ),

                    Gap(AppLayout.getHeight(30)),
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Register",
                              style: Styles.textStyle
                                  .copyWith(color: Colors.black38, fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Gap(AppLayout.getHeight(30)),
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: (
                              ) {},
                          child: Text("About",
                            style: Styles.textStyle
                                .copyWith(color: Colors.black38, fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                )],
            ),

          ),
        ],
      ),
    );
  }
}



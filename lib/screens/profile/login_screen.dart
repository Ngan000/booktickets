import 'package:booktickets/screens/home/home_screen.dart';
import 'package:booktickets/screens/profile/profile_update_screen.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/background_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:booktickets/widgets/text_input.dart';
import 'package:booktickets/widgets/password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
              padding: const EdgeInsets.only(left: 20, right: 20),
              children: [
                Gap(AppLayout.getHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileUpdateScreen()),
                        );
                        print("You are tapped");
                      },
                      child: const Icon(Icons.keyboard_return),
                      //FluentSystemIcons.ic_fluent_backspace_filled),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Gap(AppLayout.getHeight(100)),
                      Container(
                        child: Center(
                          child: Text(
                            "Flight",
                            style: Styles.headLineStyle5,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: AppLayout.getWidth(2),
                            horizontal: AppLayout.getHeight(20)),
                        decoration: BoxDecoration(
                          color: Color(0xD91130CE),
                          //borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("BOOK",
                                  style: Styles.textStyle
                                      .copyWith(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                      Gap(AppLayout.getHeight(40)),
                      Container(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                TexttInput(
                                  hint: 'Email',
                                  inputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.next,
                                ),
                                PasswordInput(
                                  hint: 'Password',
                                  inputAction: TextInputAction.next,
                                ),
                              ],
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      //color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Text('SUBMIT',
                                          style: Styles.headLineStyle3),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 80, right: 20, top: 50, bottom: 20),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Text('Already have account? ',
                                            style: Styles.textStyle.copyWith(
                                                color: Colors.white70)),
                                      ),
                                      Gap(AppLayout.getHeight(10)),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 1))),
                                        child: Text('Login',
                                            style: Styles.textStyle.copyWith(
                                                color: Colors.white70,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}

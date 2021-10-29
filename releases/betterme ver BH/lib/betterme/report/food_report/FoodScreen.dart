import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';

import 'FoodTabs.dart';

int buttonCase = 0; // 버튼 상태 확인용

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreen createState() => _FoodScreen();
}

class _FoodScreen extends State<FoodScreen> {
  Color button1Color = Color(0xff827380);
  Color button2Color = Color(0xff0B202A);
  Color button3Color = Color(0xff0B202A);
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색

    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    double graphWidth = valWidth * 0.86;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text(
            '식단 데이터',
            style: TextStyle(color: txtColor),
          ),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: valHeight * 0.015,
                ),
                DividewithObj(
                    context,
                    Container(
                      width: valWidth * 0.18,
                      child: Text(
                        '데이터',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: linetxtColor, fontSize: defaultSize * 14),
                      ),
                    ),
                    0.12,
                    0.7),
                SizedBox(
                  height: valHeight * 0.02,
                ),
                Container(
                  width: valWidth * 0.81,
                  height: valHeight * 0.04,
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(valWidth * 0.015),
                      boxShadow: [
                        BoxShadow(color: Color(0xffD2ABBA), blurRadius: 1.2),
                      ]),
                  child: Row(
                    // 여기서부터 버튼(7일/31일/12개월 구분)
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(valWidth * 0.015),
                            ),
                            primary: button1Color,
                            minimumSize:
                                Size(valWidth * 0.27, valHeight * 0.04)),
                        child: Text(
                          '7일',
                          style: TextStyle(
                            color: txtColor,
                            fontSize: defaultSize * 14,
                          ),
                        ),
                        onPressed: () {
                          buttonCase = 0;
                          setState(() {
                            button1Color = Color(0xff827380);
                            button2Color = Color(0xff0B202A);
                            button3Color = Color(0xff0B202A);
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(valWidth * 0.015),
                            ),
                            primary: button2Color,
                            minimumSize:
                                Size(valWidth * 0.27, valHeight * 0.04)),
                        child: Text(
                          '31일',
                          style: TextStyle(
                            color: txtColor,
                            fontSize: defaultSize * 14,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            buttonCase = 1;

                            setState(() {
                              button2Color = Color(0xff827380);
                              button1Color = Color(0xff0B202A);
                              button3Color = Color(0xff0B202A);
                            });
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(valWidth * 0.015),
                            ),
                            primary: button3Color,
                            minimumSize:
                                Size(valWidth * 0.27, valHeight * 0.04)),
                        child: Text(
                          '12개월',
                          style: TextStyle(
                            color: txtColor,
                            fontSize: defaultSize * 14,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            buttonCase = 2;
                          });

                          setState(() {
                            button3Color = Color(0xff827380);
                            button2Color = Color(0xff0B202A);
                            button1Color = Color(0xff0B202A);
                          });
                        },
                      )
                    ],
                  ),
                ),
                FoodTabs(buttonCase)
              ],
            ),
          ),
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

//식단 표시를 위한 위젯. 필요시 매개변수로 사진 위젯들 추가
Widget CoachingFoodBox(
    BuildContext context, String title, String content, double heightRate) {
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;
  double miniHeight = 0.04 * valHeight;
  double defaultSize = valWidth * 0.0025;
  double lineLength = valWidth * 0.7;

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final boxBorderRadius = valWidth * 0.015;

  return Container(
      height: valHeight * heightRate,
      width: valWidth * 0.86,
      decoration: BoxDecoration(
        color: Color(0xff333C47),
        borderRadius: BorderRadius.circular(valWidth * 0.015),
      ),
      child: Column(children: [
        SizedBox(height: valHeight * 0.008),
        Container(
          height: miniHeight,
          width: valWidth * 0.2,
          decoration: BoxDecoration(
            color: Color(0xff53525E),
            borderRadius: BorderRadius.circular(valWidth * 0.015),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10 * defaultSize, color: txtColor)),
          ),
        ),
        Container(
          width: lineLength,
          child: Divider(
            color: Color(0xff94999E),
            thickness: 0.6,
          ),
        ),
        SizedBox(height: valHeight * 0.008),
        Container(
          width: lineLength,
          child: Text(
            content,
            style: TextStyle(fontSize: 10 * defaultSize, color: txtColor),
          ),
        ),
        Container(
            color: Colors.grey,
            width: lineLength,
            height: valHeight * 0.1,
            child: Text('여기다 사진 추가'))
      ]));
}

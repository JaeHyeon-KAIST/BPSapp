import 'dart:io';

import 'package:betterself_trainer/functions/Controllers/server_connection.dart';
import 'package:betterself_trainer/functions/Firestore/AuthMethods.dart';
import 'package:betterself_trainer/functions/Firestore/DatabaseMethods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';

import 'ConfirmScreen/ConfirmScreen.dart';
import 'chatroom/ChatroomScreen.dart';
import 'functions/Widgets.dart';

class CommunicationScreen extends StatefulWidget {
  const CommunicationScreen({Key? key}) : super(key: key);

  @override
  _CommunicationScreen createState() => _CommunicationScreen();
}

class _CommunicationScreen extends State<CommunicationScreen> {
  // ignore: non_constant_identifier_names
  var TrainerName = [];
  // ignore: non_constant_identifier_names
  var TrainerImg = [];

  var TrainerUserName = [];

  bool isSearching = false;

  TextEditingController searching = TextEditingController();

  var user = AuthMethods().auth.currentUser!.email.toString().split('@')[0];

  getchatroomid(String a, String b) {
    if (a.compareTo(b) < 0) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  Widget TrainersList(BuildContext context, stream) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD);
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final blockColor = Color(0xff333C47); // 여러 블럭들 색
    double defaultSize = valWidth * 0.0025;

    TrainerName = [];
    TrainerImg = [];
    TrainerUserName = [];

    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Padding(
                      ////여기 수정하면 됨.
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 20.0),
                      child: Card(
                        color: bgColor,
                        child: GestureDetector(
                          onTap: () async {
                            var chatroomId =
                                getchatroomid(user, data['username']);
                            Map<String, dynamic> chatroomInfo = {
                              "users": [user, data['name']]
                            };
                            DatabaseMethos()
                                .createChatroom(chatroomId, chatroomInfo);
                            var trainer_uid =
                                await ServerConnection.get_uid_by_email(
                                    email: data['email']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatroomScreen(
                                        data['name'],
                                        data['username'],
                                        data['imgUrl'],
                                        trainer_uid)));
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10)), //테두리 둥글게
                            tileColor: blockColor,
                            leading: SizedBox(
                              height: 60,
                              width: 45,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: bgColor,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(data['imgUrl']),
                                  ),
                                ),
                              ),
                            ), // 사용자 이미지 불러오는 코드
                            title: Container(
                              height: 60,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  data['name'],
                                  style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색

    double defaultSize = valWidth * 0.0025;

    var currentuser = AuthMethods().auth.currentUser!.uid;

    print("\n currentuser : ${currentuser}\n");

    var usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(currentuser)
        .collection('trainers')
        .snapshots();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0.0,
          title: Align(
            alignment: Alignment(-0.38, 0),
            child: Container(
              height: valHeight * 0.08,
              padding: EdgeInsets.only(top: 30),
              child: Text("메시지",
                  style: TextStyle(fontSize: defaultSize * 17, color: txtColor),
                  textAlign: TextAlign.center),
            ),
          ),
          // leading: Container(
          //   height: valHeight * 0.08,
          //   padding: EdgeInsets.only(top: 14),
          //   child: IconButton(
          //     icon: SvgPicture.asset('images/arrow towards left_icon.svg'),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
          actions: [
            Padding(
                padding: EdgeInsets.only(top: 14, right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmScreen()));
                  },
                  child: Icon(Icons.add),
                )),
          ]),
      body: Container(
          margin: const EdgeInsets.only(top: 14),
          child: TrainersList(context, usersStream)),
    );
  }
}

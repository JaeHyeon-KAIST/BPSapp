import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:betterme/functions/Firestore/AuthMethods.dart';
import 'package:betterme/functions/Firestore/DatabaseMethods.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'chatroom/Chatroom.dart';
import 'functions/Widgets.dart';

class CommunicationScreen extends StatefulWidget {
  const CommunicationScreen({Key? key}) : super(key: key);

  @override
  _CommunicationScreen createState() => _CommunicationScreen();
}

class _CommunicationScreen extends State<CommunicationScreen> {
  bool isSearching = false;

  // ignore: non_constant_identifier_names
  var SearchedUserName = [];
  // ignore: non_constant_identifier_names
  var SearchedUserImg = [];

  TextEditingController searching = TextEditingController();

  var user = AuthMethods()
      .auth
      .currentUser!
      .email
      .toString()
      .replaceAll("@gmail.com", "");

  onSearchBtnClick() async {
    SearchedUserName = [];
    SearchedUserImg = [];

    var usersStream = FirebaseFirestore.instance.collection('users').get();

    var currentuser = AuthMethods().auth.currentUser!.email.toString();

    print('\ncurrentuser : ${currentuser.replaceAll("@gmail.com", "")}\n');
    print('\nquey : ${searching.text}\n\n');

    usersStream.then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["username"].toString().contains(searching.text)) {
          setState(() {});
          SearchedUserName.add(doc["username"]);
          SearchedUserImg.add(doc["imgUrl"]);
          print('\nname : ${doc["username"]!.toString()}');
          print('\nimg  : ${doc["imgUrl"]!.toString()}\n\n');
        }
      });
    });

    return FirebaseFirestore.instance.collection('users').get();
  }

  getchatroomid(String a, String b) {
    if (a.compareTo(b) < 0) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  // Widget searchUsersList(){
  //   return StreamBuilder<QuerySnapshot>(
  //       stream: onSearchBtnClick()!,
  //       builder: (context, snapshot){
  //         if (snapshot.hasData) {
  //           return ListView.builder(
  //             itemCount: snapshot.data!.docs.length,
  //             shrinkWrap: true,
  //             itemBuilder: (context, index){
  //               DocumentSnapshot ds = snapshot.data!.docs[index];
  //               return (ds.data().toString().contains("imgUrl") ? Image.network(ds.get("imgUrl")) : Text("None"));
  //             },);
  //         } else {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       });
  // }

  Widget SearchUsersList() {
    return ListView.builder(
        itemCount: SearchedUserName.length,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
              child: Card(
                color: Colors.black12,
                child: InkWell(
                    onTap: () {
                      var chatroomId =
                          getchatroomid(user, SearchedUserName[index]);
                      Map<String, dynamic> chatroomInfo = {
                        "users": [user, SearchedUserName[index]]
                      };

                      DatabaseMethos().createChatroom(chatroomId, chatroomInfo);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChatroomScreen(SearchedUserName[index])));
                    },
                    child: ListTile(
                      leading: Image.network(SearchedUserImg[index]),
                      title: Text(
                        SearchedUserName[index],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )),
              ));
        });
  }

  Widget ChatRoomList() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'Chatroom',
          style: TextStyle(color: txtColor),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(children: [
                isSearching
                    ? GestureDetector(
                        onTap: () {
                          isSearching = false;
                          SearchedUserName = [];
                          SearchedUserImg = [];
                          searching.text = "";
                          setState(() {});
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(Icons.arrow_back, color: Colors.black)))
                    : Container(),
                Expanded(
                    child: TextField(
                        controller: searching,
                        style: const TextStyle(color: Colors.black),
                        decoration: textFieldInput("username"))),
                GestureDetector(
                  onTap: () {
                    if (searching.text != "") {
                      setState(() {
                        SearchedUserName.clear();
                        SearchedUserImg.clear();
                      });
                      isSearching = true;
                      onSearchBtnClick();
                    }
                  },
                  child: const Icon(Icons.search, color: Colors.black),
                )
              ]),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
              ),
              isSearching
                  ? SizedBox(height: 300, child: SearchUsersList())
                  : Container(),
              // isSearching ? SizedBox(
              //   height : 500,
              //   child : searchUsersList(),
              // ) : chatRoomList()
            ],
          )),
    );
  }
}

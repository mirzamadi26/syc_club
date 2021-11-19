import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/chat/chat.dart';
import 'package:project/chat/chatScreen.dart';
import 'package:project/database/databasemanager.dart';

class RecentChat extends StatefulWidget {
  RecentChat({Key? key}) : super(key: key);

  @override
  _RecentChatState createState() => _RecentChatState();
}

class _RecentChatState extends State<RecentChat> {
  String? user;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<dynamic> syc = [];
  List chatNames = [];
  List savechat = [];
  List chatSaved = [];
  List chatEmails = [];
  Map<String, dynamic>? userMap;
  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  getChat() async {
    final result = await SYC.getchatemails(user!);
    setState(() {
      chatSaved = result;
    });
  }

  List listUserMap = [];

  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      user = auth.currentUser!.email;
    });
  }

  getemails() async {
    final result = await SYC.getchatemails(user!);
    setState(() {
      chatEmails = result;
    });
    print(chatEmails.length);
  }

  getchatEmail() async {
    final result = await SYC.getchatName(user!);
    setState(() {
      chatNames = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
    getChat();
    getemails();
    getchatEmail();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "Chats",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Chat()),
                      (route) => false);
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 18,
                ),
                label: Text(
                  "Search",
                  style: GoogleFonts.montserratAlternates(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ))
          ],
        ),
        drawer: DrawerNavigation(),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: height / 7,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    "Chats",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: text * 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              SizedBox(height: height / 35),
              Expanded(
                  child: SizedBox(
                height: height,
                child: ListView.builder(
                    itemCount: chatNames.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Container(
                          width: width / 1.4,
                          height: height / 10,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.5, color: Colors.black),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  offset: Offset(3, 4),
                                )
                              ]),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: width / 21,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage("assets/profile.png"),
                                      ),
                                      Container(
                                          margin:
                                              EdgeInsets.only(left: width / 15),
                                          child: Text(
                                            "${chatNames[index]['firstname']} ${chatNames[index]['lastname']}",
                                            // chatNames[index]['firstname'],
                                            style: GoogleFonts
                                                .montserratAlternates(
                                              color: Colors.black,
                                              fontSize: text * 13,
                                            ),
                                          )),
                                      IconButton(
                                          onPressed: () async {
                                            setState(() {
                                              userMap = chatNames[index];
                                            });
                                            String roomId = chatRoomId(
                                                _auth.currentUser!.email!,
                                                userMap!['email']);
                                            print(userMap![index]);

                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatScreen(
                                                            userMap: userMap!,
                                                            chatRoomId:
                                                                roomId)),
                                                (route) => false);
                                          },
                                          icon: Icon(Icons.chat))
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(height: height / 40),
                      ]);
                    }),
              ))
            ]),
          ]),
        ));
  }
}

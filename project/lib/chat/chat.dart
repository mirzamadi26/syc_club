import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/chat/chatScreen.dart';

import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/chat/recentchat.dart';
import 'package:project/database/databasemanager.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with WidgetsBindingObserver {
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, dynamic>? userMap;
  List chatSaved = [];
  List result = [];
  List syc = [];
  String? user;
  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      user = auth.currentUser!.email;
    });
  }

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

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("firstname", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();

    getChat();
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
            "Search",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecentChat()));
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
          actions: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 18,
                ),
                label: Text(
                  "Back",
                  style: GoogleFonts.montserratAlternates(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ))
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 17,
                      ),
                      Text(
                        "Chats",
                        style: GoogleFonts.montserratAlternates(
                            color: Colors.black,
                            fontSize: text * 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Stack(children: [
                        Container(
                          width: double.infinity,
                          height: height / 13,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: height / 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(40),
                                  width: width / 1.3,
                                  child: TextField(
                                    controller: _search,
                                    style: TextStyle(color: Colors.black),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      prefixIcon: IconButton(
                                        onPressed: onSearch,
                                        icon: Icon(Icons.search),
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      hintText: "Search",
                                      hintStyle:
                                          GoogleFonts.montserratAlternates(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 190, left: 30),
                            child: Text(
                              "Chats",
                              style: GoogleFonts.montserratAlternates(
                                color: Colors.black,
                                fontSize: text * 16,
                              ),
                            ))
                      ]),
                      SizedBox(
                        height: height / 35,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: height / 30,
                          ),
                          Expanded(
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.56,
                                child: userMap != null
                                    ? ListView.builder(
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          return Column(children: [
                                            InkWell(
                                              onTap: () async {
                                                String roomId = chatRoomId(
                                                    _auth.currentUser!.email!,
                                                    userMap!['email']);
                                                print(userMap![index]);
                                                chatSaved
                                                    .add(userMap!['email']);
                                                await SYC.addtochat(
                                                    chatSaved, user!);
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatScreen(
                                                                userMap:
                                                                    userMap!,
                                                                chatRoomId:
                                                                    roomId)),
                                                    (route) => false);
                                              },
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.67,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.1,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 2.5,
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          alignment:
                                                              Alignment.center,
                                                          //margin: EdgeInsets.only(left: 90),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Text(
                                                                  userMap![
                                                                      'firstname'],
                                                                  style: GoogleFonts
                                                                      .montserratAlternates(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                ),
                                                              ])),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(height: 20)
                                          ]);
                                        })
                                    : Container()),
                          )
                        ],
                      )
                    ]),
              ));
  }
}

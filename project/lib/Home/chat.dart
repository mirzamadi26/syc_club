import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/chatScreen.dart';

import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

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
  List result = [];
  List syc = [];
  String? user;
  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      user = auth.currentUser!.email;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
    getEmail();
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.email).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  snapshot.data!.docs.forEach((element) {
                    if (element['email'] == user) {
                      syc.add(element.data());
                    }
                  });
                  return Text("Hi, ${syc[0]['firstname']}",
                      style: GoogleFonts.montserratAlternates(
                          color: Colors.black87, fontSize: 16));
                }
                return CircularProgressIndicator(
                  color: Colors.black,
                );
              }),
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
        drawer: DrawerNavigation(),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Chats",
                        style: GoogleFonts.montserratAlternates(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Stack(children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 50),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
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
                                fontSize: 20,
                              ),
                            ))
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.56,
                                child: userMap != null
                                    ? ListView.builder(
                                        itemCount: userMap!.length,
                                        itemBuilder: (context, index) {
                                          return Column(children: [
                                            InkWell(
                                              onTap: () {
                                                String roomId = chatRoomId(
                                                    _auth.currentUser!.email!,
                                                    userMap!['firstname']);
                                                print(userMap![index]);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatScreen(
                                                                userMap:
                                                                    userMap!,
                                                                chatRoomId:
                                                                    roomId)));
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

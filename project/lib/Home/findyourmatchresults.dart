import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/favourite.dart';
import 'package:project/Home/findyourmatch.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/Home/view.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:project/chat/chatScreen.dart';
import 'package:project/database/databasemanager.dart';

class FindMatchResult extends StatefulWidget {
  FindMatchResult({Key? key, required this.result}) : super(key: key);
  final List result;

  @override
  _FindMatchResultState createState() => _FindMatchResultState();
}

class _FindMatchResultState extends State<FindMatchResult> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List favouritelist = [];
  Map<String, dynamic>? userMap;

  List<String> income = [];
  List<String> age = [];
  List<String> religious = [];
  List<String> firstname = [];
  List<String> lastname = [];

  List<String> city = [];
  List<String> country = [];
  List<String> height = [];
  List<String> gender = [];
  List<String> status = [];
  List<String> email = [];

  List chatSaved = [];
  List syc = [];
  String? user;

  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final result = auth.currentUser!.email;
    setState(() {
      user = result;
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

  List listUserMap = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
    getChat();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightt = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
          title: Text(
            "Matching Result",
            style: GoogleFonts.montserratAlternates(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: widget.result.length,
            itemBuilder: (context, index) {
              print(widget.result[index]['firstname']);
              return Column(children: [
                SizedBox(
                  height: heightt / 20,
                ),
                SizedBox(
                  height: heightt / 20,
                ),
                Container(
                    width: width / 1.5,
                    height: heightt / 5,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.5, color: Colors.black),
                        borderRadius: BorderRadius.circular(40),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: heightt / 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.result[index]['firstname'],
                                style: GoogleFonts.montserratAlternates(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: text * 13)),
                            Text(" ${widget.result[index]['lastname']}",
                                style: GoogleFonts.montserratAlternates(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: text * 13))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: heightt / 40,
                            ),
                            Column(
                              children: [
                                Text(
                                    "${widget.result[index]['age']}, ${widget.result[index]['city']}, ${widget.result[index]['country']}",
                                    style: GoogleFonts.montserratAlternates(
                                        color: Colors.black87,
                                        fontSize: text * 12)),
                                Text("${widget.result[index]['height']} inches",
                                    style: GoogleFonts.montserratAlternates(
                                        color: Colors.black87,
                                        fontSize: text * 12)),
                                Text(
                                    "${widget.result[index]['gender']}, ${widget.result[index]['status']}",
                                    style: GoogleFonts.montserratAlternates(
                                        color: Colors.black87,
                                        fontSize: text * 12))
                              ],
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      setState(() {
                                        userMap = widget.result[index];
                                      });
                                      String roomId = chatRoomId(
                                          _auth.currentUser!.email!,
                                          userMap!['email']);
                                      print(userMap![index]);
                                      chatSaved
                                          .add(widget.result[index]['email']);
                                      await SYC.addtochat(chatSaved, user!);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ChatScreen(
                                                  userMap: userMap!,
                                                  chatRoomId: roomId)));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: heightt / 28,
                                      width: width / 7.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: Colors.black),
                                      child: Text("Chat",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  SizedBox(height: heightt / 35),
                                  SizedBox(height: 10),
                                ])
                          ],
                        )
                      ],
                    )),
              ]);
            }));
  }
}

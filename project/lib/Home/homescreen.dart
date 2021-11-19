import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/favourite.dart';
import 'package:project/Home/findyourmatch.dart';
import 'package:project/Home/view.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:project/authentication/login.dart';
import 'package:project/chat/chatScreen.dart';

import 'package:project/database/authservice.dart';

import 'package:project/database/databasemanager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List favouritelist = [];
  List<String> income = [];
  List<String> age = [];
  List<String> religious = [];
  List<String> firstname = [];
  List<String> lastname = [];
  FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> city = [];
  List<String> country = [];
  List<String> height = [];
  List<String> gender = [];
  List<String> status = [];
  List<String> email = [];
  List syc = [];
  List chatSaved = [];
  List listUserMap = [];
  Map<String, dynamic>? userMap;
  String? user;
  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final result = auth.currentUser!.email;
    setState(() {
      user = result;
    });
  }

  getChat() async {
    final result = await SYC.getchatemails(user!);
    setState(() {
      chatSaved = result;
    });
  }

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
    double mheight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                snapshot.data!.docs.forEach((element) {
                  if (element['email'] == user) {
                    syc.add(element.data());
                  }

                  favouritelist = syc[0]['fav'];
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
            onPressed: () async {
              await AuthService().logOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthHome()),
                  (route) => false);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 18,
            ),
            label: Text("Logout",
                style: GoogleFonts.montserratAlternates(
                    color: Colors.black, fontSize: 14)),
          )
        ],
      ),
      drawer: DrawerNavigation(),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // List<String> lastname = [];
                  // List<String> gender = [];
                  // List<String> livein = [];
                  // List<String> status = [];
                  snapshot.data!.docs.forEach((element) {
                    if (element['email'] == user) {
                      syc.add(element.data());
                      // lastname.add(element['lastname']);
                      // gender.add(element['gender']);
                      // livein.add(element['live']);
                      // status.add(element['status']);
                    }
                  });
                  return Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: width / 16),
                          width: width / 1.3,
                          height: mheight / 4.3,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.5, color: Colors.black),
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
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${syc[0]['firstname']}",
                                                  style: GoogleFonts
                                                      .montserratAlternates(
                                                          color: Colors.black87,
                                                          fontSize: text * 14,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              Text(" ${syc[0]['lastname']}",
                                                  style: GoogleFonts
                                                      .montserratAlternates(
                                                          color: Colors.black87,
                                                          fontSize: text * 14,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: mheight / 40),
                                          Text(
                                            syc[0]['gender'],
                                            style: GoogleFonts
                                                .montserratAlternates(
                                              color: Colors.black87,
                                              fontSize: text * 14,
                                            ),
                                          ),
                                          Text(
                                            syc[0]['country'],
                                            style: GoogleFonts
                                                .montserratAlternates(
                                              color: Colors.black87,
                                              fontSize: text * 14,
                                            ),
                                          ),
                                          Text(
                                            syc[0]['status'],
                                            style: GoogleFonts
                                                .montserratAlternates(
                                              color: Colors.black87,
                                              fontSize: text * 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundColor: Colors.white,
                                          backgroundImage:
                                              AssetImage("assets/profile.png"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: mheight / 35,
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                  top: mheight / 3.7,
                                ),
                                child: Text(
                                  "Latest Profiles",
                                  style: GoogleFonts.montserratAlternates(
                                      color: Colors.black87,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return CircularProgressIndicator(
                  color: Colors.black,
                );
              }),
          SizedBox(
            height: mheight / 35,
          ),
          Row(
            children: [
              SizedBox(height: mheight / 35),
              Expanded(
                child: SizedBox(
                    height: mheight / 2.5,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          snapshot.data!.docs.forEach((element) {
                            if (element['email'] != user) {
                              firstname.add(element['firstname']);
                              lastname.add(element['lastname']);
                              email.add(element['email']);
                              age.add(element['age']);
                              city.add(element['city']);
                              listUserMap.add(element.data());
                              country.add(element['country']);
                              height.add(element['height']);
                              gender.add(element['gender']);
                              status.add(element['status']);
                              religious.add(element['religious']);
                            }
                          });
                          if (firstname.isNotEmpty) {
                            return ListView.builder(
                                itemCount: age.length,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    Container(
                                        width: width / 1.3,
                                        height: mheight / 4.5,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2.5,
                                                color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(40),
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
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(height: mheight / 45),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  firstname[index],
                                                  style: GoogleFonts
                                                      .montserratAlternates(
                                                          color: Colors.black87,
                                                          fontSize: text * 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                Text(
                                                  " ${lastname[index]}",
                                                  style: GoogleFonts
                                                      .montserratAlternates(
                                                          color: Colors.black87,
                                                          fontSize: text * 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  height: mheight / 40,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "${age[index]}, ${city[index]}, ${country[index]}",
                                                      style: GoogleFonts
                                                          .montserratAlternates(
                                                        color: Colors.black87,
                                                        fontSize: text * 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${height[index]} inches",
                                                      style: GoogleFonts
                                                          .montserratAlternates(
                                                        color: Colors.black87,
                                                        fontSize: text * 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${gender[index]}, ${status[index]}",
                                                      style: GoogleFonts
                                                          .montserratAlternates(
                                                        color: Colors.black87,
                                                        fontSize: text * 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          setState(() {
                                                            userMap =
                                                                listUserMap[
                                                                    index];
                                                          });
                                                          print(userMap![
                                                              'email']);
                                                          String roomId =
                                                              chatRoomId(
                                                                  _auth
                                                                      .currentUser!
                                                                      .email!,
                                                                  email[index]);
                                                          chatSaved.add(
                                                              userMap![
                                                                  'email']);
                                                          await SYC.addtochat(
                                                              chatSaved, user!);
                                                          Navigator.pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => ChatScreen(
                                                                      userMap:
                                                                          userMap!,
                                                                      chatRoomId:
                                                                          roomId)),
                                                              (route) => false);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: mheight / 28,
                                                          width: width / 7.5,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              color:
                                                                  Colors.black),
                                                          child: Text("Chat",
                                                              style: GoogleFonts
                                                                  .montserratAlternates(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    text * 10,
                                                              )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: mheight / 60),
                                                      InkWell(
                                                        onTap: () {
                                                          if (favouritelist
                                                              .contains(email[
                                                                  index])) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                  "Already added in Favourites"),
                                                              backgroundColor:
                                                                  Colors.red,
                                                            ));
                                                          } else {
                                                            favouritelist.add(
                                                                email[index]);
                                                            SYC.addtofav(
                                                                favouritelist,
                                                                user!);
                                                            print(
                                                                favouritelist);
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Favourite()));
                                                          }
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: mheight / 28,
                                                          width: width / 6,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              color:
                                                                  Colors.black),
                                                          child: Text(
                                                            "Add to Fav",
                                                            style: GoogleFonts
                                                                .montserratAlternates(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  text * 9,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: mheight / 60),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                              builder: (context) => View(
                                                                  firstname:
                                                                      firstname[
                                                                          index],
                                                                  lastname:
                                                                      lastname[
                                                                          index],
                                                                  age: age[
                                                                      index],
                                                                  city: city[
                                                                      index],
                                                                  country:
                                                                      country[
                                                                          index],
                                                                  status: status[
                                                                      index],
                                                                  gender: gender[
                                                                      index])));
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: mheight / 28,
                                                          width: width / 7.5,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              color:
                                                                  Colors.black),
                                                          child: Text(
                                                            "View",
                                                            style: GoogleFonts
                                                                .montserratAlternates(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  text * 10,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ])
                                              ],
                                            )
                                          ],
                                        )),
                                    SizedBox(
                                      height: mheight / 35,
                                    ),
                                  ]);
                                });
                          }
                        }
                        return Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        );
                      },
                    )),
              )
            ],
          ),
          Center(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: SizedBox(
                      width: width / 2.5,
                      height: mheight / 15,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.black,
                                  Colors.grey,
                                  Colors.black
                                ])),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FindYourMatch(
                                            agee: age,
                                            genderr: gender,
                                            emaill: email,
                                            statuss: status,
                                            heightt: height,
                                            religiouss: religious,
                                            cityy: city,
                                          )),
                                  (route) => false);
                            },
                            child: Text(
                              "Find Your Match",
                              style: GoogleFonts.montserratAlternates(
                                fontSize: text * 13,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                      )),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

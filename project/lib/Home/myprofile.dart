import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? user;
  List syc = [];

  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      user = auth.currentUser!.email;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
        backgroundColor: Colors.white,
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
                  Navigator.of(context).pushReplacement(
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
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              snapshot.data!.docs.forEach((element) {
                if (element['email'] == user) {
                  syc.add(element.data());
                }
              });
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 25,
                    ),
                    Text(
                      "Your Profile",
                      style: GoogleFonts.montserratAlternates(
                          color: Colors.black,
                          fontSize: text * 17,
                          fontWeight: FontWeight.w600),
                    ),
                    Stack(children: [
                      Container(
                        width: double.infinity,
                        height: height / 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          width: width / 1.5,
                          height: height / 4.3,
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
                                      Column(children: [
                                        Row(
                                          children: [
                                            Text(
                                              syc[0]['firstname'],
                                              style: GoogleFonts
                                                  .montserratAlternates(
                                                color: Colors.black,
                                                fontSize: text * 12,
                                              ),
                                            ),
                                            Text(
                                              " ${syc[0]['lastname']}",
                                              style: GoogleFonts
                                                  .montserratAlternates(
                                                color: Colors.black,
                                                fontSize: text * 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 35,
                                        ),
                                        Text(
                                          syc[0]['mobileno'],
                                          style:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black,
                                            fontSize: text * 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height / 35,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: width / 3.5,
                                              child: Text(
                                                syc[0]['email'],
                                                style: GoogleFonts
                                                    .montserratAlternates(
                                                  color: Colors.black,
                                                  fontSize: text * 11,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
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
                    ]),
                    SizedBox(height: height / 35),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 4.5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Height",
                                      style: GoogleFonts.montserratAlternates(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: width / 3.5),
                                    Text(
                                      syc[0]['height'],
                                      style: GoogleFonts.montserratAlternates(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(height: height / 35),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 4.5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Gender",
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: width / 3.5),
                                  Text(
                                    syc[0]['gender'],
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(height: height / 35),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 4.5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "City",
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: width / 3.5),
                                  Text(
                                    syc[0]['city'],
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(height: height / 35),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 4.5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Status",
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: width / 3.5),
                                  Text(
                                    syc[0]['status'],
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(height: height / 35),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 4.5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Religious",
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: width / 3.5),
                                  Text(
                                    syc[0]['religious'],
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(height: height / 35),
                          Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 4.5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Income",
                                          style:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        )),
                                    SizedBox(width: width / 3.5),
                                    Text(
                                      syc[0]['income'],
                                      style: GoogleFonts.montserratAlternates(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(height: height / 35),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 4.5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Children",
                                        style: GoogleFonts.montserratAlternates(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      )),
                                  SizedBox(width: width / 4),
                                  Text(
                                    syc[0]['doyouhavechildren'],
                                    style: GoogleFonts.montserratAlternates(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    )
                  ]);
            }
            return CircularProgressIndicator();
          },
        ));
  }
}

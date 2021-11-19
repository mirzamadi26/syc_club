import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

class View extends StatefulWidget {
  View(
      {Key? key,
      required this.firstname,
      required this.lastname,
      required this.age,
      required this.city,
      required this.country,
      required this.gender,
      required this.status})
      : super(key: key);
  String firstname, lastname, age, city, country, gender, status;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  String? user;
  List<dynamic> syc = [];

  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      user = auth.currentUser!.email;
    });
  }

  @override
  void initState() {
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false);
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
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: height / 20,
          ),
          Text(
            "View",
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
            SizedBox(
              height: height / 10,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: width / 1.5,
                height: height / 4.5,
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
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.firstname,
                                      style: GoogleFonts.montserratAlternates(
                                        color: Colors.black,
                                        fontSize: text * 13,
                                      ),
                                    ),
                                    Text(
                                      " ${widget.lastname}",
                                      style: GoogleFonts.montserratAlternates(
                                        color: Colors.black,
                                        fontSize: text * 13,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: height / 35),
                                Text(
                                  "${widget.age}, ${widget.city}, ${widget.country}",
                                  style: GoogleFonts.montserratAlternates(
                                    color: Colors.black,
                                    fontSize: text * 13,
                                  ),
                                ),
                                Text(
                                  widget.gender,
                                  style: GoogleFonts.montserratAlternates(
                                    color: Colors.black,
                                    fontSize: text * 13,
                                  ),
                                ),
                                Text(
                                  widget.status,
                                  style: GoogleFonts.montserratAlternates(
                                    color: Colors.black,
                                    fontSize: text * 13,
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
          ])
        ]));
  }
}

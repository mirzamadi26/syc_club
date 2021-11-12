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
import 'package:project/database/authservice.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  List<String> city = [];
  List<String> country = [];
  List<String> height = [];
  List<String> gender = [];
  List<String> status = [];
  List<String> email = [];
  List syc = [];
  String? user;
  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final result = auth.currentUser!.email;
    setState(() {
      user = result;
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
                          margin: EdgeInsets.only(top: 30),
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.height * 0.20,
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
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              Text(" ${syc[0]['lastname']}",
                                                  style: GoogleFonts
                                                      .montserratAlternates(
                                                          color: Colors.black87,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            syc[0]['gender'],
                                            style: GoogleFonts
                                                .montserratAlternates(
                                              color: Colors.black87,
                                              fontSize: 17,
                                            ),
                                          ),
                                          Text(
                                            syc[0]['country'],
                                            style: GoogleFonts
                                                .montserratAlternates(
                                              color: Colors.black87,
                                              fontSize: 17,
                                            ),
                                          ),
                                          Text(
                                            syc[0]['status'],
                                            style: GoogleFonts
                                                .montserratAlternates(
                                              color: Colors.black87,
                                              fontSize: 17,
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
                              height: 20,
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                  top: 200,
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
                return CircularProgressIndicator();
              }),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.44,
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.20,
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
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  firstname[index],
                                                  style: GoogleFonts
                                                      .montserratAlternates(
                                                          color: Colors.black87,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                Text(
                                                  " ${lastname[index]}",
                                                  style: GoogleFonts
                                                      .montserratAlternates(
                                                          color: Colors.black87,
                                                          fontSize: 17,
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
                                                  height: 90,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "${age[index]}, ${city[index]}, ${country[index]}",
                                                      style: GoogleFonts
                                                          .montserratAlternates(
                                                        color: Colors.black87,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${height[index]} inches",
                                                      style: GoogleFonts
                                                          .montserratAlternates(
                                                        color: Colors.black87,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${gender[index]}, ${status[index]}",
                                                      style: GoogleFonts
                                                          .montserratAlternates(
                                                        color: Colors.black87,
                                                        fontSize: 14,
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
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 30,
                                                          width: 60,
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
                                                                fontSize: 13,
                                                              )),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      InkWell(
                                                        onTap: () {
                                                          if (favouritelist
                                                              .contains(email[
                                                                  index])) {
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
                                                          height: 30,
                                                          width: 80,
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
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
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
                                                          height: 30,
                                                          width: 60,
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
                                                              fontSize: 13,
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
                                      height: 20,
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
              child: Container(
                margin: EdgeInsets.only(top: 35),
                child: SizedBox(
                    width: 200,
                    height: 50,
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
                              fontSize: 17,
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
        ]),
      ),
    );
  }
}

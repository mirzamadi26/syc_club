import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/aboutus.dart';
import 'package:project/Home/chat.dart';

import 'package:project/Home/favourite.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/Home/myprofile.dart';
import 'package:project/Home/registrationform.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerNavigation extends StatefulWidget {
  DrawerNavigation({Key? key}) : super(key: key);

  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
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
    // TODO: implement initState
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    label: Text(
                      "Back",
                      style: GoogleFonts.montserratAlternates(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ))
              ]),
              Column(children: [
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        snapshot.data!.docs.forEach((element) {
                          if (element['email'] == user) {
                            syc.add(element.data());
                          }
                        });
                        return Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  syc[0]['firstname'],
                                  style: GoogleFonts.montserratAlternates(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  " ${syc[0]['lastname']}",
                                  style: GoogleFonts.montserratAlternates(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ));
                      }
                      return CircularProgressIndicator();
                    }),
                SizedBox(height: 20),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  title: Text(
                    "Home",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.home,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Favourite()));
                  },
                  title: Text(
                    "Favourite",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.star,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Chat()));
                  },
                  title: Text(
                    "Chat",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.chat,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyProfile()));
                  },
                  title: Text(
                    "My Profile",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.person_outline_rounded,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("You are Already Registered"),
                      backgroundColor: Colors.green,
                    ));
                  },
                  title: Text(
                    "Registration Form",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.description,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => AboutUs()));
                          },
                          child: Text(
                            "About Us",
                            style: GoogleFonts.montserratAlternates(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          )),
                      TextButton.icon(
                          onPressed: () async {
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.remove('email');
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthHome()),
                                (route) => false);
                          },
                          icon: Icon(
                            Icons.exit_to_app,
                            color: Colors.black,
                            size: 28,
                          ),
                          label: Text(
                            "Log Out",
                            style: GoogleFonts.montserratAlternates(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          )),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Divider(height: 5),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

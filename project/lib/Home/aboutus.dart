import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
              return CircularProgressIndicator(color: Colors.black);
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "About Us",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontSize: text * 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "What exactly is SYC?",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontSize: text * 17,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "SYC is syrian Social Club. We are a group of matchmakers that to help singles meet naturally and organically in a fun, un-intimidating setting. Our objective is for singles to get together more often without having to be set up on blind dates, which is not everyone's cup of tea. Our events are geard towards singles of all different ages and all different religious levels. We want to reach everyone, or as many people as we possibly can",
                  style: GoogleFonts.montserratAlternates(
                    color: Colors.black,
                    fontSize: text * 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

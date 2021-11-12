import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/database/databasemanager.dart';

// ignore: must_be_immutable
class Favourite extends StatefulWidget {
  Favourite({
    Key? key,
  }) : super(key: key);
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  String? user;
  List<dynamic> syc = [];
  List favNames = [];
  List savefav = [];
  List favEmails = [];

  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      user = auth.currentUser!.email;
    });
  }

  getemails() async {
    final result = await SYC.getfavemails(user!);
    setState(() {
      favEmails = result;
    });
    print(favEmails.length);
  }

  getfavEmail() async {
    final result = await SYC.getfavName(user!);
    setState(() {
      favNames = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
    getfavEmail();
    getemails();
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    "Favourite",
                    style: GoogleFonts.montserratAlternates(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              SizedBox(height: 20),
              Expanded(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    itemCount: favNames.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 80,
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 36,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 90),
                                          child: Text(
                                            favNames[index],
                                            style: GoogleFonts
                                                .montserratAlternates(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          )),
                                      IconButton(
                                          onPressed: () async {
                                            favEmails.remove(favEmails[index]);
                                            await SYC.addtofav(
                                                favEmails, user!);
                                            print(favEmails);
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Favourite()),
                                                (route) => false);
                                          },
                                          icon: Icon(Icons.remove))
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(height: 20),
                      ]);
                    }),
              ))
            ]),
          ]),
        ));
  }
}

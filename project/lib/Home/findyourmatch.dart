import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/findyourmatchresults.dart';

import 'package:project/Home/homescreen.dart';
import 'package:project/database/databasemanager.dart';

class FindYourMatch extends StatefulWidget {
  const FindYourMatch(
      {Key? key,
      required this.agee,
      required this.religiouss,
      required this.heightt,
      required this.statuss,
      required this.genderr,
      required this.emaill,
      required this.cityy})
      : super(key: key);
  final List agee, religiouss, heightt, statuss, genderr, emaill, cityy;

  @override
  _FindYourMatchState createState() => _FindYourMatchState();
}

class _FindYourMatchState extends State<FindYourMatch> {
  bool matchFound = true;

  List mailFound = [];
  TextEditingController ageController = TextEditingController();
  TextEditingController religiousController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  TextEditingController heightController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController livinController = TextEditingController();
  bool isLoading = false;

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
                return CircularProgressIndicator(color: Colors.black);
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
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        drawer: DrawerNavigation(),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    SizedBox(
                      height: height / 40,
                    ),
                    Text(
                      "Find Your Match",
                      style: TextStyle(
                        fontSize: text * 15,
                      ),
                    ),
                    SizedBox(height: height / 40),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: width / 3,
                                child: TextField(
                                  controller: ageController,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "Age",
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 3,
                                child: TextField(
                                  controller: religiousController,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "Religious",
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: width / 3,
                                child: TextField(
                                  controller: genderController,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "Gender",
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 3,
                                child: TextField(
                                  controller: heightController,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "Height",
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: width / 3,
                                child: TextField(
                                  controller: statusController,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "Status",
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                              // Container(
                              //   width: MediaQuery.of(context).size.width * 0.35,
                              //   child: TextField(
                              //     keyboardType: TextInputType.number,
                              //     style: TextStyle(color: Colors.black),
                              //     cursorColor: Colors.black,
                              //     decoration: InputDecoration(
                              //       enabledBorder: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(10),
                              //           borderSide: BorderSide(color: Colors.black)),
                              //       hintText: "Income",
                              //       hintStyle: TextStyle(
                              //         color: Colors.black54,
                              //       ),
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(10),
                              //         borderSide: BorderSide(color: Colors.black),
                              //       ),
                              //       focusedBorder: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(10),
                              //           borderSide: BorderSide(color: Colors.black)),
                              //     ),
                              //   ),
                              // ),
                              Container(
                                width: width / 3,
                                child: TextField(
                                  controller: livinController,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "City",
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: SizedBox(
                          width: width / 3,
                          height: height / 15,
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
                                onPressed: () async {
                                  print(widget.agee.length);
                                  if (ageController.text.isNotEmpty &&
                                      religiousController.text.isNotEmpty &&
                                      genderController.text.isNotEmpty &&
                                      heightController.text.isNotEmpty &&
                                      statusController.text.isNotEmpty &&
                                      livinController.text.isNotEmpty) {
                                    int i = 0;
                                    mailFound = [];
                                    for (int i = 0;
                                        i < widget.agee.length;
                                        i++) {
                                      if (ageController.text.toLowerCase() ==
                                              widget.agee[i]
                                                  .toString()
                                                  .toLowerCase() &&
                                          religiousController.text
                                                  .toLowerCase() ==
                                              widget.religiouss[i]
                                                  .toString()
                                                  .toLowerCase() &&
                                          genderController.text.toLowerCase() ==
                                              widget.genderr[i]
                                                  .toString()
                                                  .toLowerCase() &&
                                          heightController.text.toLowerCase() ==
                                              widget.heightt[i]
                                                  .toString()
                                                  .toLowerCase() &&
                                          statusController.text.toLowerCase() ==
                                              widget.statuss[i]
                                                  .toString()
                                                  .toLowerCase() &&
                                          livinController.text.toLowerCase() ==
                                              widget.cityy[i]
                                                  .toString()
                                                  .toLowerCase()) {
                                        setState(() {
                                          matchFound = false;
                                        });
                                        if (mailFound
                                            .contains(widget.emaill[i])) {
                                        } else {
                                          mailFound.add(widget.emaill[i]);
                                        }
                                        // } else {
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(SnackBar(
                                        //     content: Text("There is no match found"),
                                        //     backgroundColor: Colors.red,
                                        //   ));
                                      }
                                    }
                                    print(mailFound);
                                    if (matchFound) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text("There is no match found"),
                                        backgroundColor: Colors.red,
                                      ));
                                    } else {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final result =
                                          await SYC.getMatchData(mailFound);

                                      print(result[0]['firstname']);

                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FindMatchResult(
                                                    result: result,
                                                  )),
                                          (route) => false);
                                    }
                                  }
                                },
                                child: Text("Find",
                                    style: TextStyle(
                                      fontSize: text * 14,
                                    )),
                                style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    primary: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                          )),
                    )
                  ])));
  }
}

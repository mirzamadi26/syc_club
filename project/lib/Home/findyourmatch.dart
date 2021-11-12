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
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Find Your Match",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Age",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextField(
                        controller: religiousController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Religious",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextField(
                        controller: genderController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Gender",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextField(
                        controller: heightController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Height",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextField(
                        controller: statusController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Status",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
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
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextField(
                        controller: livinController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Live in",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
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
                width: 200,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.black, Colors.grey, Colors.black])),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (ageController.text.isNotEmpty &&
                            religiousController.text.isNotEmpty &&
                            genderController.text.isNotEmpty &&
                            heightController.text.isNotEmpty &&
                            statusController.text.isNotEmpty &&
                            livinController.text.isNotEmpty) {
                          int i = 0;
                          for (int i = 0; i < widget.agee.length; i++) {
                            if (ageController.text.toLowerCase() ==
                                    widget.agee[i].toString().toLowerCase() &&
                                religiousController.text.toLowerCase() ==
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
                                    widget.cityy[i].toString().toLowerCase()) {
                              setState(() {
                                matchFound = false;
                              });
                              mailFound.add(widget.emaill[i]);
                              // } else {
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(SnackBar(
                              //     content: Text("There is no match found"),
                              //     backgroundColor: Colors.red,
                              //   ));
                            }
                          }
                          if (matchFound) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("There is no match found"),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            final result = await SYC.getMatchData(mailFound);
                            // bottomSheet() {
                            //   return GestureDetector(onTap: () {
                            //     showBottomSheet(
                            //         context: context,
                            //         builder: (context) {
                            //           return ListView.builder(
                            //               itemCount: 1,
                            //               itemBuilder: (context, index) {
                            //                 return Column(children: [
                            //                   Container(
                            //                       width: MediaQuery.of(context)
                            //                               .size
                            //                               .width *
                            //                           0.75,
                            //                       height: MediaQuery.of(context)
                            //                               .size
                            //                               .height *
                            //                           0.20,
                            //                       decoration: BoxDecoration(
                            //                           border: Border.all(
                            //                               width: 2.5,
                            //                               color: Colors.black),
                            //                           borderRadius:
                            //                               BorderRadius.circular(
                            //                                   40),
                            //                           color: Colors.white,
                            //                           boxShadow: [
                            //                             BoxShadow(
                            //                               color: Colors.grey,
                            //                               blurRadius: 2,
                            //                               spreadRadius: 2,
                            //                               offset: Offset(3, 4),
                            //                             )
                            //                           ]),
                            //                       child: Column(
                            //                         mainAxisAlignment:
                            //                             MainAxisAlignment.start,
                            //                         children: [
                            //                           SizedBox(height: 10),
                            //                           Row(
                            //                             mainAxisAlignment:
                            //                                 MainAxisAlignment
                            //                                     .center,
                            //                             children: [
                            //                               Text(result[index]
                            //                                   ['firstname']),
                            //                               Text(
                            //                                   " ${result[index]['lastname']}")
                            //                             ],
                            //                           ),
                            //                           Row(
                            //                             mainAxisAlignment:
                            //                                 MainAxisAlignment
                            //                                     .spaceAround,
                            //                             children: [
                            //                               SizedBox(
                            //                                 height: 90,
                            //                               ),
                            //                               Column(
                            //                                 children: [
                            //                                   Text(
                            //                                       "${result[index]['age']}, ${result[index]['city']}, ${result[index]['country']}"),
                            //                                   Text(
                            //                                       "${result[index]['height']} inches"),
                            //                                   Text(
                            //                                       "${result[index]['gender']}, ${result[index]['status']}")
                            //                                 ],
                            //                               ),
                            //                               Column(
                            //                                   mainAxisAlignment:
                            //                                       MainAxisAlignment
                            //                                           .spaceBetween,
                            //                                   children: [
                            //                                     Container(
                            //                                       alignment:
                            //                                           Alignment
                            //                                               .center,
                            //                                       height: 30,
                            //                                       width: 60,
                            //                                       decoration: BoxDecoration(
                            //                                           borderRadius:
                            //                                               BorderRadius.circular(
                            //                                                   40),
                            //                                           color: Colors
                            //                                               .black),
                            //                                       child: Text(
                            //                                           "Chat",
                            //                                           style: TextStyle(
                            //                                               color:
                            //                                                   Colors.white)),
                            //                                     ),
                            //                                     SizedBox(
                            //                                         height: 10),
                            //                                     InkWell(
                            //                                       onTap: () {
                            //                                         if (favouritelist
                            //                                             .contains(email[
                            //                                                 index])) {
                            //                                         } else {
                            //                                           favouritelist.add(
                            //                                               email[index]);
                            //                                           SYC.addtofav(
                            //                                               favouritelist,
                            //                                               user!);
                            //                                           print(
                            //                                               favouritelist);
                            //                                           Navigator.pushReplacement(
                            //                                               context,
                            //                                               MaterialPageRoute(
                            //                                                   builder:
                            //                                                       (context) =>
                            //                                                           Favourite()));
                            //                                         }
                            //                                       },
                            //                                       child: Container(
                            //                                         alignment:
                            //                                             Alignment.center,
                            //                                         height: 30,
                            //                                         width: 60,
                            //                                         decoration: BoxDecoration(
                            //                                             borderRadius:
                            //                                                 BorderRadius
                            //                                                     .circular(
                            //                                                         40),
                            //                                             color:
                            //                                                 Colors.black),
                            //                                         child: Text(
                            //                                             "Add to Fav",
                            //                                             style: TextStyle(
                            //                                                 fontSize: 10,
                            //                                                 color: Colors
                            //                                                     .white)),
                            //                                       ),
                            //                                     ),
                            //                                     SizedBox(
                            //                                         height: 10),
                            //                                     InkWell(
                            //                                       onTap: () {
                            //                                         Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //                                             builder: (context) => View(
                            //                                                 firstname:
                            //                                                     firstname[
                            //                                                         index],
                            //                                                 lastname:
                            //                                                     lastname[
                            //                                                         index],
                            //                                                 age: age[
                            //                                                     index],
                            //                                                 city: city[
                            //                                                     index],
                            //                                                 country:
                            //                                                     country[
                            //                                                         index],
                            //                                                 status: status[
                            //                                                     index],
                            //                                                 gender: gender[
                            //                                                     index])));
                            //                                       },
                            //                                       child: Container(
                            //                                         alignment:
                            //                                             Alignment.center,
                            //                                         height: 30,
                            //                                         width: 60,
                            //                                         decoration: BoxDecoration(
                            //                                             borderRadius:
                            //                                                 BorderRadius
                            //                                                     .circular(
                            //                                                         40),
                            //                                             color:
                            //                                                 Colors.black),
                            //                                         child: Text("View",
                            //                                             style: TextStyle(
                            //                                                 color: Colors
                            //                                                     .white)),
                            //                                       ),
                            //                                     )
                            //                                   ])
                            //                             ],
                            //                           )
                            //                         ],
                            //                       )),
                            //                   SizedBox(
                            //                     height: 20,
                            //                   ),
                            //                 ]);
                            //               });

                            //           return CircularProgressIndicator();
                            //         });
                            //   });
                            // }

                            print(result[0]['firstname']);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FindMatchResult(
                                          result: result,
                                        )),
                                (route) => false);
                          }
                        }
                      },
                      child: Text("Find",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                )),
          )
        ])));
  }
}

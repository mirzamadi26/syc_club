import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/authentication/auth_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FindMatchResult extends StatefulWidget {
  FindMatchResult({Key? key, required this.result}) : super(key: key);
  final List result;

  @override
  _FindMatchResultState createState() => _FindMatchResultState();
}

class _FindMatchResultState extends State<FindMatchResult> {
  String? user;
  List syc = [];
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

                  //   favouritelist = syc[0]['fav'];
                });

                return Text("Hi, ${syc[0]['firstname']}",
                    style: TextStyle(color: Colors.black87, fontSize: 16));
              }
              return CircularProgressIndicator();
            }),
        actions: [
          TextButton.icon(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AuthHome()),
                    (route) => false);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 18,
              ),
              label: Text(
                "Exit",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: widget.result.length,
          itemBuilder: (context, index) {
            print(widget.result[index]['firstname']);
            return Column(children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.20,
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
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.result[index]['firstname']),
                          Text(" ${widget.result[index]['lastname']}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          Column(
                            children: [
                              Text(
                                  "${widget.result[index]['age']}, ${widget.result[index]['city']}, ${widget.result[index]['country']}"),
                              Text("${widget.result[index]['height']} inches"),
                              Text(
                                  "${widget.result[index]['gender']}, ${widget.result[index]['status']}")
                            ],
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Colors.black),
                                  child: Text("Chat",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                SizedBox(height: 10),
                                // InkWell(
                                //   onTap: () {
                                //     if (favouritelist
                                //         .contains(email[
                                //             index])) {
                                //     } else {
                                //       favouritelist.add(
                                //           email[index]);
                                //       SYC.addtofav(
                                //           favouritelist,
                                //           user!);
                                //       print(
                                //           favouritelist);
                                //       Navigator.pushReplacement(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder:
                                //                   (context) =>
                                //                       Favourite()));
                                //     }
                                //   },
                                //   child: Container(
                                //     alignment:
                                //         Alignment.center,
                                //     height: 30,
                                //     width: 60,
                                //     decoration: BoxDecoration(
                                //         borderRadius:
                                //             BorderRadius
                                //                 .circular(
                                //                     40),
                                //         color:
                                //             Colors.black),
                                //     child: Text(
                                //         "Add to Fav",
                                //         style: TextStyle(
                                //             fontSize: 10,
                                //             color: Colors
                                //                 .white)),
                                //   ),
                                // ),
                                SizedBox(height: 10),
                                // InkWell(
                                //   onTap: () {
                                //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                                //         builder: (context) => View(
                                //             firstname:
                                //                 firstname[
                                //                     index],
                                //             lastname:
                                //                 lastname[
                                //                     index],
                                //             age: age[
                                //                 index],
                                //             city: city[
                                //                 index],
                                //             country:
                                //                 country[
                                //                     index],
                                //             status: status[
                                //                 index],
                                //             gender: gender[
                                //                 index])));
                                //   },
                                //   child: Container(
                                //     alignment:
                                //         Alignment.center,
                                //     height: 30,
                                //     width: 60,
                                //     decoration: BoxDecoration(
                                //         borderRadius:
                                //             BorderRadius
                                //                 .circular(
                                //                     40),
                                //         color:
                                //             Colors.black),
                                //     child: Text("View",
                                //         style: TextStyle(
                                //             color: Colors
                                //                 .white)),
                                //   ),
                                // )
                              ])
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
            ]);
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/findyourmatch.dart';
import 'package:project/Home/view.dart';
import 'package:project/authentication/login.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Hi, Hassan Yousuf",
            style: TextStyle(color: Colors.black87, fontSize: 16)),
        actions: [
          TextButton.icon(
              onPressed: () {},
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
      drawer: DrawerNavigation(),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: 320,
                height: 160,
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
                                Text("Hassan Yousuf"),
                                SizedBox(height: 10),
                                Text("Male"),
                                Text("Lahore"),
                                Text("Single"),
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
              child: Container(
                  margin: EdgeInsets.only(
                    top: 200,
                  ),
                  child: Text("Latest Profiles")),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: SizedBox(
                height: 380,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Container(
                            width: 320,
                            height: 170,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text("Syed M Hamza"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 90,
                                    ),
                                    Column(
                                      children: [
                                        Text("26, Karachi, Pakistan"),
                                        Text("6.7 inches"),
                                        Text("Male, Single")
                                      ],
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                color: Colors.black),
                                            child: Text("Chat",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                color: Colors.black),
                                            child: Text("Add to Fav",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                          ),
                                          SizedBox(height: 10),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              View()));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color: Colors.black),
                                              child: Text("View",
                                                  style: TextStyle(
                                                      color: Colors.white)),
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
                    }),
              ),
            )
          ],
        ),
        Center(
          child: Center(
            child: Container(
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
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FindYourMatch()),
                              (route) => false);
                        },
                        child: Text("Find Your Match",
                            style: TextStyle(
                              fontSize: 16,
                            )),
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
    );
  }
}

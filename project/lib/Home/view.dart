import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:project/Home/drawernavigation.dart';

class View extends StatefulWidget {
  View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                  "Back",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        drawer: DrawerNavigation(),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "View",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Stack(children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
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
                                Text("26, Karachi, Pakistan"),
                                Text("Male,Single"),
                                Text("Lahore"),
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

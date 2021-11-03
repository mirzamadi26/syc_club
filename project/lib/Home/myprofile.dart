import 'package:flutter/material.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

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
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        drawer: DrawerNavigation(),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Text("Your Profile"),
          Stack(children: [
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
                                SizedBox(
                                  height: 20,
                                ),
                                Text("0336XXXXXX"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("example@gmail.com"),
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
          ]),
          SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Height"),
                        SizedBox(width: 80),
                        Text("5.5")
                      ]),
                ),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("   Gender"),
                  SizedBox(width: 80),
                  Text("Male")
                ]),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("      Live in"),
                  SizedBox(width: 80),
                  Text("Lahore")
                ]),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("    Status"),
                  SizedBox(width: 80),
                  Text("Single")
                ]),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("    Religious"),
                  SizedBox(width: 80),
                  Text("Islam")
                ]),
                SizedBox(height: 20),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("          Income"),
                        SizedBox(width: 80),
                        Text("Rs 50000")
                      ]),
                ),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(" Children"),
                  SizedBox(width: 80),
                  Text("No")
                ]),
              ],
            ),
          )
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

class FindYourMatch extends StatefulWidget {
  FindYourMatch({Key? key}) : super(key: key);

  @override
  _FindYourMatchState createState() => _FindYourMatchState();
}

class _FindYourMatchState extends State<FindYourMatch> {
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        width: 160,
                        child: TextField(
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
                        width: 160,
                        child: TextField(
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
                        width: 160,
                        child: TextField(
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
                        width: 160,
                        child: TextField(
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
                        width: 160,
                        child: TextField(
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
                      Container(
                        width: 160,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: "Income",
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
                  Container(
                    width: 380,
                    child: TextField(
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
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FindYourMatch()),
                              (route) => false);
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
            ),
          ]),
        ));
  }
}

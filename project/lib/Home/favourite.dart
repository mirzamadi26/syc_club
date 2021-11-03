import 'package:flutter/material.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

class Favourite extends StatefulWidget {
  Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(color: Colors.white),
                child: Text("Favourite"),
              ),
            ],
          ),
          Row(children: [
            SizedBox(height: 20),
            Expanded(
                child: SizedBox(
                    height: 678,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Container(
                              width: 350,
                              height: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.5, color: Colors.black),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Icon(
                                            Icons.star,
                                            size: 36,
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 90),
                                            child: Text("Syed M Hamza"))
                                      ],
                                    )
                                  ]),
                            ),
                            SizedBox(height: 20)
                          ]);
                        })))
          ]),
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "About Us",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "What exactly is SYC?",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "SYC is syrian Social Club. We are a group of matchmakers that to help singles meet naturally and organically in a fun, un-intimidating setting. Our objective is for singles to get together more often without having to be set up on blind dates, which is not everyone's cup of tea. Our events are geard towards singles of all different ages and all different religious levels. We want to reach everyone, or as many people as we possibly can",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}

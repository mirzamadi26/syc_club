import 'package:flutter/material.dart';
import 'package:project/Home/drawernavigation.dart';

class HomeController extends StatefulWidget {
  HomeController({Key? key}) : super(key: key);

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project/Home/aboutus.dart';
import 'package:project/Home/chat.dart';
import 'package:project/Home/favourite.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/Home/myprofile.dart';
import 'package:project/Home/registrationform.dart';
import 'package:project/authentication/auth_home.dart';

class DrawerNavigation extends StatefulWidget {
  DrawerNavigation({Key? key}) : super(key: key);

  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  label: Text("Back", style: TextStyle(color: Colors.black)))
            ]),
            Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Text("Hassan Yousuf",
                      style: TextStyle(color: Colors.white))),
              SizedBox(height: 20),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                title: Text("Home",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                leading: Icon(
                  Icons.home,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Favourite()));
                },
                title: Text("Favourite",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                leading: Icon(
                  Icons.star,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Chat()));
                },
                title: Text("Chat",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                leading: Icon(
                  Icons.chat,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
                title: Text("My Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                leading: Icon(
                  Icons.person_outline_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationForm()));
                },
                title: Text("Registration Form",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                leading: Icon(
                  Icons.description,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 230,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: Text("About Us",
                        style: TextStyle(color: Colors.black, fontSize: 18))),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => AuthHome()));
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                      size: 28,
                    ),
                    label: Text("Log Out",
                        style: TextStyle(color: Colors.black, fontSize: 18)))
              ])
            ])
          ],
        ),
      ),
    );
  }
}

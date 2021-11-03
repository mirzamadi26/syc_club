import 'package:flutter/material.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/homescreen.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController searchController = TextEditingController();
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
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Chats",
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      width: 330,
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.black,
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
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 190, left: 30),
                child: Text("Chats"))
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 450,
                  child: ListView.builder(
                      itemCount: 6,
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
                                  Container(
                                      alignment: Alignment.center,
                                      //margin: EdgeInsets.only(left: 90),
                                      child: Text("Syed M Hamza"))
                                ],
                              )),
                          SizedBox(height: 20)
                        ]);
                      }),
                ),
              )
            ],
          )
        ]));
  }
}

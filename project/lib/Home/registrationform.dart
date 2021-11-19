import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Home/drawernavigation.dart';
import 'package:project/Home/findyourmatch.dart';
import 'package:project/Home/homescreen.dart';
import 'package:project/database/authservice.dart';
import 'package:project/database/databasemanager.dart';

class RegistrationForm extends StatefulWidget {
  RegistrationForm({Key? key, required this.email, required this.password})
      : super(key: key);
  final String email, password;
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController religiousController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController childrenController = TextEditingController();
  TextEditingController hobbiesController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "Registraion Form",
            style: GoogleFonts.montserratAlternates(
              color: Colors.black,
              fontSize: text * 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height / 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: firstnameController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "First Name",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: lastnameController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Last Name",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Container(
                                  width: width / 1.25,
                                  child: TextField(
                                    enabled: false,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    style: TextStyle(color: Colors.black),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      hintText: "Email",
                                      hintStyle:
                                          GoogleFonts.montserratAlternates(
                                        color: Colors.black54,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height / 50),
                                Container(
                                  width: width / 1.25,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: mobilenoController,
                                    style: TextStyle(color: Colors.black),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      hintText: "Mobile No",
                                      hintStyle:
                                          GoogleFonts.montserratAlternates(
                                        color: Colors.black54,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height / 50),
                                Container(
                                  width: width / 1.25,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: ageController,
                                    style: TextStyle(color: Colors.black),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      hintText: "Age",
                                      hintStyle:
                                          GoogleFonts.montserratAlternates(
                                        color: Colors.black54,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: genderController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Gender",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: religiousController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Religious",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: statusController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Status",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: heightController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Height: 5.6 ",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: cityController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "City",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: childrenController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Children?",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 50),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: hobbiesController,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Hobbies",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width / 3,
                                      child: TextField(
                                        controller: incomeController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: "Income",
                                          hintStyle:
                                              GoogleFonts.montserratAlternates(
                                            color: Colors.black54,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 50),
                                Container(
                                  width: width / 1.25,
                                  child: TextField(
                                    controller: countryController,
                                    style: TextStyle(color: Colors.black),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      hintText: "Country",
                                      hintStyle:
                                          GoogleFonts.montserratAlternates(
                                        color: Colors.black54,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10, bottom: 20),
                              child: SizedBox(
                                  width: width / 3,
                                  height: height / 15,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.black,
                                              Colors.grey,
                                              Colors.black
                                            ])),
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (firstnameController.text.isEmpty &&
                                              lastnameController.text.isEmpty &&
                                              mobilenoController.text.isEmpty &&
                                              ageController.text.isEmpty &&
                                              genderController.text.isEmpty &&
                                              religiousController
                                                  .text.isEmpty &&
                                              statusController.text.isEmpty &&
                                              heightController.text.isEmpty &&
                                              cityController.text.isEmpty &&
                                              childrenController.text.isEmpty &&
                                              hobbiesController.text.isEmpty &&
                                              incomeController.text.isEmpty &&
                                              countryController.text.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "There are Empty Fields"),
                                              backgroundColor: Colors.red,
                                            ));
                                          } else {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            var result = await AuthService()
                                                .register(widget.email,
                                                    widget.password);

                                            if (result != null) {
                                              registringuser();
                                              setState(() {
                                                isLoading = false;
                                              });
                                            } else {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Email is already Registered"),
                                                backgroundColor: Colors.red,
                                              ));
                                            }
                                          }
                                        },
                                        child: Text(
                                          "Register",
                                          style:
                                              GoogleFonts.montserratAlternates(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            elevation: 10,
                                            primary: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30)))),
                                  )),
                            ),
                          ),
                        ]),
                  ),
                ),
              ));
  }

  void registringuser() async {
    await SYC.adduser(
      firstnameController.text,
      lastnameController.text,
      mobilenoController.text,
      widget.email,
      ageController.text,
      genderController.text,
      religiousController.text,
      statusController.text,
      heightController.text,
      cityController.text,
      childrenController.text,
      hobbiesController.text,
      incomeController.text,
      countryController.text,
      [],
      [],
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}

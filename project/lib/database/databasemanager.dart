import 'package:cloud_firestore/cloud_firestore.dart';

class SYC {
  //Get data
  static Future<List?> shownotes() async {
    final savednotes = FirebaseFirestore.instance.collection("users");
    List<dynamic> notesdata = [];
    await savednotes.get().then((QuerySnapshot) {
      QuerySnapshot.docs.forEach((element) {
        notesdata.add(element.data());
        print(element.id);
      });
    });
    return notesdata;
  }

// Add data
  static Future adduser(
      String firstname,
      String lastname,
      String mobileno,
      String email,
      String age,
      String gender,
      String religious,
      String status,
      String height,
      String city,
      String children,
      String hobbies,
      String income,
      String country,
      List fav) async {
    final addnotes = FirebaseFirestore.instance.collection('users');

    await addnotes.doc(email).set({
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      'mobileno': mobileno,
      "age": age,
      "gender": gender,
      "religious": religious,
      "status": status,
      "height": height,
      "city": city,
      "doyouhavechildren": children,
      "hobbies": hobbies,
      "income": income,
      "country": country,
      "fav": fav,
    });
  }

  static Future addtofav(List fav, String email) async {
    final favsaved = FirebaseFirestore.instance.collection("users");
    await favsaved.doc(email).update({"fav": fav});
  }

  static Future getfavName(String email) async {
    List nameResult = [];
    final favname = FirebaseFirestore.instance.collection("users");
    final data = await favname.doc(email).get();
    final result = data.data();
    //print(result['firstname']);
    List favEmail = result!['fav'];
    int i = 0;
    for (i = 0; i < favEmail.length; i++) {
      final emailData = await favname.doc(favEmail[i]).get();
      final result = emailData.data();
      nameResult.add(result!['firstname'] + ' ' + result['lastname']);
    }
    return nameResult;
  }

  static Future getfavemails(String email) async {
    final favname = FirebaseFirestore.instance.collection("users");
    final data = await favname.doc(email).get();
    final result = data.data();
    List emailResult = result!['fav'];
    print(emailResult);
    return emailResult;
  }

  static Future getMatchData(List email) async {
    final user = FirebaseFirestore.instance.collection("users");
    List matchData = [];
    int i = 0;
    for (i = 0; i < email.length; i++) {
      final emailData = await user.doc(email[i]).get();
      final result = emailData.data();
      matchData.add(result);
    }

    return matchData;
  }
}

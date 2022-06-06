import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

showdialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[Text("Loding ..."), CircularProgressIndicator()],
          ),
        );
      });
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  List data;
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/jsonfile/client.json');
    setState(() => data = json.decode(jsonText));
    while (email.text != "" && password.text != "") {
      for (var i = 0; i < data.length; i++) {
        if (data[i]["robotId"] == email.text) {
          if (data[i]["password"] == password.text) {
            Fluttertoast.showToast(
                msg: 'Welcome ' + data[i]["name"],
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.black26);
            Navigator.of(context).pushNamed('home');
            return "success";
          } else {
            Fluttertoast.showToast(
                msg: 'Votre mot de passe est incorrect',
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.black26);
            return "failed";
          }
        }
      }
    }
    Fluttertoast.showToast(
        msg: 'Remplir les balises',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black26);

    print("email or password are not true");
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  GlobalKey<FormState> formstatemail = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatepass = new GlobalKey<FormState>();

  String validmail(String val) {
    if (val.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Le remplissage obligatoire ",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black26);
      return "can't be empty";
    }
  }

  String validpass(String val) {
    if (val.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Le remplissage est obligatoire ",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black26);
      return "can't be empty";
    } else if (val.length < 8) {
      return "Shoud be not less than 8 caracters";
    }
  }

//input for email
  Widget _buildEmailTF(TextEditingController myController, myvalidmail) {
    return Form(
      key: formstatemail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'ID',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 20.0),
                    blurRadius: 50.0,
                    color: Colors.black12,
                  ),
                ],
                border: Border.all(width: 0.2, color: Colors.black54),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0)),
            height: 60.0,
            child: TextFormField(
              autovalidate: false,
              validator: myvalidmail,
              controller: myController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.perm_identity_outlined,
                  color: Colors.white,
                ),
                hintText: 'Robot ID',
                hintStyle: TextStyle(color: Colors.white70, fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  } //end email input

// input for password
  Widget _buildPasswordTf(TextEditingController myController, myvalidpass) {
    return Form(
      key: formstatepass,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 20.0),
                    blurRadius: 50.0,
                    color: Colors.black12,
                  ),
                ],
                border: Border.all(width: 0.2, color: Colors.black54),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0)),
            height: 60.0,
            child: TextFormField(
              autovalidate: false,
              validator: myvalidpass,
              controller: myController,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: TextStyle(color: Colors.white70, fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
    );
  } //end password input

//click button
  Widget _buildSinInbtn(BuildContext context) {
    /* signin() async {
      var formdatam = formstatemail.currentState;
      var formdatap = formstatepass.currentState;

      if (formdatam.validate() && formdatap.validate()) {
        //showdialog(context);
        var data = {"email": email.text, "password": password.text};
        var url = "http://localhost:3000/programming-languages";
        var response = await http.post(url, body: data);
        log(response.body);
        log("hello");
        print("hello");
        var responsebody = jsonDecode(response.body);

        if (responsebody['status'] == "success") {
          Fluttertoast.showToast(
              msg: "Welcome back " + responsebody['fullname'],
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.black26);
          Navigator.of(context).pushNamed('home');
        }

        if (responsebody['status'] == "failed") {
          Fluttertoast.showToast(
              msg: "No acount with this email",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.black26);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Tap your email and password",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black26);
      }
    }*/

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          child: InkWell(
            child: Container(
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                ),
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 20.0),
                      blurRadius: 50.0,
                      color: Colors.black12,
                    ),
                  ],
                  border: Border.all(width: 0.2, color: Colors.black54),
                  color: Colors.deepOrange[700],
                  borderRadius: BorderRadius.circular(50.0)),
              height: 60.0,
            ),
            onTap: () {
              loadJsonData();
            },
          ),
        ),
      ],
    );
  } //end button login

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Rouchka',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 100.0),
                  _buildEmailTF(email, validmail),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildPasswordTf(password, validpass),
                  SizedBox(height: 30.0),
                  _buildSinInbtn(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

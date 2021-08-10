import 'package:flutter/material.dart';
import 'package:project/spinkit.dart';
import 'dart:async';
import './Student/studentInfo.dart';
import 'dart:convert';
import 'image_banner.dart';
import 'package:email_validator/email_validator.dart';

import 'package:http/http.dart' as http;


//Map  body = {};
Future<Notice> fetchNotice() async {
  //final response = await http.get(Uri.https('http://192.168.254.6:9000','/api/notice/8'));

  final response = await http.get(Uri.parse(
    'http://192.168.254.4:9000/api/student/1',
  ));
  if (response.statusCode == 200) {
    print(response.body.runtimeType);

    StudentInfo.body = json.decode(response.body);

    //body.add(response.body);
    print(StudentInfo.body);
    print(StudentInfo.body['email']);
    print(StudentInfo.body['password']);
    return Notice.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Notice {
  final String email;
  final String password;

  Notice({
    this.email,
    this.password,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      email: json['email'],
      password: json['password'],
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController, passwordController;
  bool _obscureText = true;
  Future<Notice> futureNotice;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  void initState() {
    super.initState();
    futureNotice = fetchNotice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          
        ),
        body: Form(
          key: _formkey,
          // ignore: deprecated_member_use
                        autovalidate: true,
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),

              //crossAxisAlignment: CrossAxisAlignment.stretch,
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageBanner("img/gg.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          "Nec Notify",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      //TEXTFIELD EMAIL
                      TextFormField(
                        
                       
                        onChanged: (String value) {
                          setState(() {
                            email = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "email",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
                          ),
                        ),
                        validator: (value) =>EmailValidator.validate(value)
                            ? null
                            : "Please enter a valid email",
                      ),
                      const SizedBox(height: 20.0),
                      const SizedBox(height: 20.0),

                      //TEXTFIELD PASSWORD
                      TextFormField(
                        
                          
                        onChanged: (String value) {
                          setState(() {
                            password = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          
                          if (value.isEmpty) {
                            return "Password Required";
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "password",
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 60, 120, 60),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          elevation: 0,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            
                            print(StudentInfo.body['email']);
                            print(StudentInfo.body['password']);
                            print(email);
                            print(password);
                            
                            if (email == StudentInfo.body['email'] &&
                                password == StudentInfo.body['password']) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Spinkit()));
                            } else {
                              
                                
                                  showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Email and password does not matched"),
                                      actions: [
                                        TextButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                                
                              
                              
                            }
                          },
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}

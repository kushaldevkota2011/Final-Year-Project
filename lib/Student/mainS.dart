import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/Student/spinkitlogout.dart';
import 'package:project/location.dart';
import '../calendar.dart';
import '../contacts.dart';
import '../notice.dart';
import '../gallery.dart';
import '../busroute.dart';
import 'package:http/http.dart' as http;

import 'teacherS.dart';

class Students {
  final int id;
  // ignore: non_constant_identifier_names
  final String student_first_name;
  // ignore: non_constant_identifier_names
  final String student_last_name;
  // ignore: non_constant_identifier_names
  final int roll_num;
  final String group;
  final String email;
  final String gender;
  final String phone;
  

  // ignore: non_constant_identifier_names
  Students({this.id, this.student_first_name, this.student_last_name,this.roll_num, this.group, this.email, this.gender, this.phone});

  factory Students.fromJson(Map<String, dynamic> json) {
    return Students(
      id: json['id'],
      student_first_name: json['student_first_name'],
      student_last_name: json['student_last_name'],
      roll_num: json['roll_num'],
      group: json['group'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
    );
  }
}

class StudentMain extends StatefulWidget {
  @override
  _StudentMainState createState() => _StudentMainState();
}

class _StudentMainState extends State<StudentMain> {
  Future<Students> futureStudents;

  @override
  void initState() {
    super.initState();
    futureStudents = fetchStudents();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Do you want to exit the app?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text('Yes')),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('NO'),
                  )
                ],
              );
            });
      },
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title:  
               
                  Text(
                        'Student Homepage',
                      
                      ),
                      centerTitle: true,
                      // SizedBox(width:100),
                      // Text("Logout",style:TextStyle(color: Colors.red,fontSize:12))
                
              
                  // leading:  IconButton(icon: Icon(Icons.menu,),onPressed: null),
                  leading: Builder(builder: (BuildContext context) {
      return new GestureDetector(
        onTap: (){
          Scaffold.of(context).openDrawer();
        },
        child: new Container(
          child: Icon(Icons.menu),
          padding: new EdgeInsets.all(7.0),
        ),
      );
    }),
                   actions:<Widget>[
                  
                     TextButton(
                onPressed: () => {
                  Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => SpinkitLogout()))
                },
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.logout),
                    Text("Logout",style:TextStyle(color:Colors.red))
                  ],
                ),)

                   ],
             
              ),
             
          drawer: Drawer(
              child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Colors.green,
                    Colors.greenAccent,
                  ])),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset("img/logo.png",
                                width: 80, height: 80),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8.01),
                            child: Text('Sujit Dahal',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)))
                      ],
                    ),
                  )),
              List(
                  title: "Notices",
                  icon: Icons.announcement,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new NoticePage()));
                  }),

                  List(
                  title: "Calendar",
                  icon: Icons.calendar_today,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new CalendarPage()));
                  }),

                  List(
                  title: "Bus Routes",
                  icon: Icons.bus_alert,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new BusRoutePage()));
                  }),
                  List(
                  title: "Gallery",
                  icon: Icons.photo_album,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new GalleryPage()));
                  }),
                  List(
                  title: "Location",
                  icon: Icons.my_location,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new LocationPage()));
                  }),
                   List(
                  title: "Contact",
                  icon: Icons.contact_mail_outlined,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new ContactPage()));
                  }),
                   List(
                  title: "Teacher's Info",
                  icon: Icons.info,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new TeacherSpage()));
                  }),
            ],
          )),
              body: Center(
        child: FutureBuilder<Students>(
          future: futureStudents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Name:"),
                      Text(snapshot.data.student_first_name),
                      SizedBox(width:5),
                      Text(snapshot.data.student_last_name),
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Roll_Num:'),
                      Text(snapshot.data.roll_num.toString()),
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Group:'),
                      Text(snapshot.data.group),
                    ],
                  ),
                  SizedBox(height:10),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Email:'),
                      Text(snapshot.data.email),
                    ],
                  ),
                  SizedBox(height:10),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Gender:'),
                      Text(snapshot.data.gender),
                    ],
                  ),
                  SizedBox(height:10),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Phone No:'),
                      Text(snapshot.data.phone),
                    ],
                  ),
                ],
              );
            } 
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
          ),
    );
  }
}

class List extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData icon;

  const List({Key key, this.title, this.onTap, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
Future<Students> fetchStudents() async {
 
  final response = await http.get(Uri.parse(
    'http://127.0.0.1:8000/api/student/1',
  ));
  if (response.statusCode == 200) {
    

    return Students.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
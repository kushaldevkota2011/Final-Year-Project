
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Students {
  final int id;
  // ignore: non_constant_identifier_names
  final String gender;
   // ignore: non_constant_identifier_names
   final String teacher_first_name;
  // ignore: non_constant_identifier_names
  final String teacher_last_name;
  // ignore: non_constant_identifier_names
  final int roll_num;
  final String group;
  final String email;
  // final String gender;
  // final String phone;
  

  // ignore: non_constant_identifier_names
  Students({this.id, this.roll_num, this.teacher_first_name, this.teacher_last_name, this.group, this.email, this.gender});

  factory Students.fromJson(Map<String, dynamic> json) {
    return Students(
      id: json['id'],
      teacher_first_name: json['teacher_first_name'],
      teacher_last_name: json['teacher_last_name'],
      roll_num: json['roll_num'],
      group: json['group'],
      email: json['email'],
      gender: json['gender'],
      // phone: json['phone'],
    );
  }
}
class TeacherSpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teachers Info"),
      ),
      body: FutureBuilder<List<Students>>(
      future: _fetchStudents(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Students> data = snapshot.data;
          return _studentsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    ));
  }

  Future<List<Students>> _fetchStudents() async {
 final response = await http.get(Uri.parse(
    'http://127.0.0.1:8000/api/teacher',
  ));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Students.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
  ListView _studentsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].gender,data[index].teacher_first_name);
        });
  }
  
  // ignore: non_constant_identifier_names
  ListTile _tile(String gender,String teacher_first_name) => ListTile(
        title:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(gender,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
            Text(teacher_first_name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
                 
                ],
              ), 
        // Column(
          
        // )
        
      );
}
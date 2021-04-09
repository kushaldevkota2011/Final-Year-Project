import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
// import './developer.dart';
import 'package:http/http.dart' as http;


class Notices {
  final int id;
  final String title;
  final String description;
  

  Notices({this.id, this.title, this.description});

  factory Notices.fromJson(Map<String, dynamic> json) {
    return Notices(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      // created_at: json['created_at'],
    );
  }
}

class DeveloperPage extends StatefulWidget {

   final int value;

  DeveloperPage({Key key,this.value}):super(key:key);

  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notice Description"),
       
      ),
      //  body:Text('${widget.value}'),
      body: FutureBuilder<List<Notices>>(
        future: _fetchNoticess(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Notices> data = snapshot.data;
            return Text('${data[widget.value].description}');
            
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
           return CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<List<Notices>> _fetchNoticess() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/notice/'));

    //print(response.statusCode);

    if (response.statusCode == 200) {
      
      List jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      return jsonResponse
          .map((notices) => new Notices.fromJson(notices))
          .toList();
      
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
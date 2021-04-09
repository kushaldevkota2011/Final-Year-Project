import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoticePage(),
    ));

class Notices {
  final int id;
  final String title;

  Notices({this.id, this.title});

  factory Notices.fromJson(Map<String, dynamic> json) {
    return Notices(
      id: json['id'],
      title: json['title'],
    );
  }
}

class NoticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notices"),
      ),
      body: FutureBuilder<List<Notices>>(
        future: _fetchNoticess(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Notices> data = snapshot.data;
            return _NoticePage(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<List<Notices>> _fetchNoticess() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/notice/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((notices) => new Notices.fromJson(notices)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  // ignore: non_constant_identifier_names
  ListView _NoticePage(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].title, Icons.announcement_outlined);
        });
  }

  ListTile _tile(String title, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}

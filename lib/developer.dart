import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
// import './developer.dart';
import 'package:http/http.dart' as http;

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class Notices {
  final int id;
  final String title;
  final String description;
  // ignore: non_constant_identifier_names
  final String created_at;

  // ignore: non_constant_identifier_names
  Notices({this.id, this.title, this.description, this.created_at});

  factory Notices.fromJson(Map<String, dynamic> json) {
    return Notices(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      created_at: json['created_at'],
      // created_at: json['created_at'],
    );
  }
}

class DeveloperPage extends StatefulWidget {
  final int value;

  DeveloperPage({Key key, this.value}) : super(key: key);

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
            return Column(
              //Text('${data[widget.value].description}')

              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  '${data[widget.value].title}',
                  style: new TextStyle(
                      fontSize: 25.0,
                    
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                ),
                SizedBox(height: 30),
                Text('${data[widget.value].created_at}',
                    style: TextStyle(color: Colors.blue)),
                SizedBox(height: 20, width: 20),
                Card(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('${data[widget.value].description}',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.black.withOpacity(1),
                                fontSize: 15))))
              ],
            );
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
      await http.get(Uri.parse('http://192.168.254.6:9000/api/notice/'));

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

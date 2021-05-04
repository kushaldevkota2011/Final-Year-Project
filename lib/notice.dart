import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import './developer.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoticePage(),
    ));

class Notices {
  final int id;
  final String title;
  // ignore: non_constant_identifier_names
  final String created_at;

  // ignore: non_constant_identifier_names
  Notices({this.id, this.title, this.created_at});

  factory Notices.fromJson(Map<String, dynamic> json) {
    return Notices(
      id: json['id'],
      title: json['title'],
      created_at: json['created_at'],
    );
  }
}

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
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
            return _NoticePage(data, context);
            
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
      return jsonResponse
          .map((notices) => new Notices.fromJson(notices))
          .toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  // ignore: non_constant_identifier_names
  ListView _NoticePage(data, BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          // return _tile(data[index].title, Icons.announcement_outlined);
          // return Text('${data[index].title}');
          // var d = data;
          return getCard(index, data, context);
        });
  }

  Widget getCard(int index, List data, BuildContext context) {
    return GestureDetector(
      onTap: () {
        var   route = MaterialPageRoute(builder:(BuildContext context)=> new DeveloperPage(value: index) );
        Navigator.of(context).push(route);
      },
      child: Container(
        height: 130,
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //  Container(child:Text('${data[0].created_at}')),

              SizedBox(width: 20),

              Image.asset(
                "img/logo.png",
                width: 80,
                height: 80,
              ),

              SizedBox(width: 20),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${data[index].title}'),
                  Text('${data[index].created_at}')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

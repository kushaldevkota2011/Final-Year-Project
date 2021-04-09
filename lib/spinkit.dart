import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Student/mainS.dart';
import 'image_banner.dart';


String finalEmail;

class Spinkit extends StatefulWidget {
  @override
  _SpinkitState createState() => _SpinkitState();
}

class _SpinkitState extends State<Spinkit> {
  @override
  void initState() {
    super.initState();
    //getValidationData();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentMain(),
        ),
      );
    });
  }

 

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            ImageBanner("img/gg.jpg"),
          Center(
            child:
                SpinKitChasingDots(size: 80.0, color: Colors.orangeAccent[700]),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "Logging in...",
            style: TextStyle(
                 fontSize: 16.0, color: Colors.white),
          )
        ],
      ),
    );
  }
}
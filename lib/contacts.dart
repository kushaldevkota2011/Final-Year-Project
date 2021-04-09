import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@nec.edu.np',
      queryParameters: {'subject': 'SUBJECT'});

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              CarouselSlider(
                  items: [
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('img/gg.jpg'),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('img/contact_image.jpg'),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('img/ii.jpg'),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('img/jj.jpg'),
                              fit: BoxFit.cover,
                            ))),
                  ],
                  options: CarouselOptions(
                    height: 300.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Nepal Engineering College',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              Container(
                child: Text(
                  '(An ISO Certified Engineering College)',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                child: Text(
                  'Changunarayan, Bhaktapur, Nepal.',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                child: Text(
                  'G.P.O. Box: 10210, Kathmandu, Nepal',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              TextButton(
                // style: TextStyle(color:Colors.black),

                //padding: EdgeInsets.all(10),
                onPressed: () => setState(() {
                  _launched = _makePhoneCall('tel:01-5221006');
                }),

                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'img/phone.png',
                      height: 40.0,
                      width: 40.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Text(
                          "Call Now",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              TextButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser('http://nec.edu.np/');
                }),
                //padding: EdgeInsets.all(10),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Image.asset(
                      'img/website.png',
                      height: 40.0,
                      width: 40.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Text(
                          "Visit Website",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => setState(() {
                  launch(_emailLaunchUri.toString());
                }),
                //padding: EdgeInsets.all(10),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Image.asset(
                      'img/email.png',
                      height: 40.0,
                      width: 40.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Text(
                          "Email:info@nec.edu.np",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),
            ],
          ),
        ],
      ),
    );
  }
}

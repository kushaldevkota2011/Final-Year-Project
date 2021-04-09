import 'package:flutter/material.dart';
import 'text_section.dart';
import 'busroute.dart';
import 'notice.dart';
import 'developer.dart';

import 'package:carousel_slider/carousel_slider.dart';
import './location.dart';
import './gallery.dart';
import './login.dart';
import './contacts.dart';
import 'calendar.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NecNotify(),
    ));

class NecNotify extends StatefulWidget {
  @override
  _NecNotifyState createState() => _NecNotifyState();
}

class _NecNotifyState extends State<NecNotify> {
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
                        Navigator.pop(context, true);
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
          title: Text('Nec Notify'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.lightBlue,
                  Colors.blueAccent,
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
                          child: Text('Nepal Engineering College',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)))
                    ],
                  ),
                ),
              ),
              new ListTile(
                title: new Text('Notices'),
                leading: Icon(Icons.announcement),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new NoticePage()));
                },
              ),
              new ListTile(
                title: new Text('Calendar/Events'),
                leading: Icon(Icons.calendar_today),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new CalendarPage()));
                },
              ),
              new ListTile(
                title: new Text('Bus Routes'),
                leading: Icon(Icons.directions_bus),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new BusRoutePage()));
                },
              ),
              new ListTile(
                title: new Text('Gallery'),
                leading: Icon(Icons.photo_library),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new GalleryPage()));
                },
              ),
              new ListTile(
                title: new Text('Location'),
                leading: Icon(Icons.my_location),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new LocationPage()));
                },
              ),
              List(
                  title: "Contact us",
                  icon: Icons.contacts,
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new ContactPage()));
                  }),
              new ListTile(
                title: new Text('Login'),
                leading: Icon(Icons.input),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new LoginPage()));
                },
              ),
              new ListTile(
                title: new Text("Developer's Profile"),
                leading: Icon(Icons.people_rounded),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new DeveloperPage()));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/1.jpg'),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/2.jpg'),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/3.jpg'),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/4.jpg'),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/5.jpg'),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/6.jpg'),
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
              Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Text("Vision and Mission of nec ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent)),
                  ),
                ),
              ),
              TextSection('',
                  'The vision of nec is to evolve as the center of higher learning, excelling in academics, through continued engagements in education, research and outreach as three integrated functions of the college.'),
              TextSection('',
                  'In approaching the stated vision, the mission of nec include:'),
              TextSection('',
                  'i.  Providing the youth with the best opportunities and environment of learning to help them attain high level of academic standard, scientific temper, technical and professional competence and life-skills.'),
              TextSection('',
                  'ii.  Train and develop youth as total person, ready to serve the society and people to alleviate their sufferings and improve their quality of life.'),
              TextSection('',
                  'iii.  Inculcate the values to appreciate the need for ethical standards in personal, social and public life, to become leaders, to be a voice to influence the society and the nation, and to uphold just social order.'),
            ],
          )),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/Student/spinkitlogout.dart';
import 'package:project/location.dart';
import '../calendar.dart';
import '../contacts.dart';
import '../notice.dart';
import '../gallery.dart';
import '../busroute.dart';


class StudentMain extends StatefulWidget {
  @override
  _StudentMainState createState() => _StudentMainState();
}

class _StudentMainState extends State<StudentMain> {
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
                            child: Text('Sulak Mool',
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
            ],
          )),
          body: Center(
            child: Text('Hello main page of student'),
          )),
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

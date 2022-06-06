import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/mydrawer.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget _component(Widget icon, int color, String text, String textExplication,
      String navigate) {
    return Form(
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                child: Ink(
                  decoration: ShapeDecoration(
                    color: Color(color),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: icon,
                    color: Color(0xFFFFF9EC),
                    onPressed: () {
                      Navigator.of(context).pushNamed(navigate);
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Color(0xFF0D253F)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Text(
                  textExplication,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13.0,
                      color: Color(0xFF0D253F)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _boxElement(int color, String text, Widget icon, String pers) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          height: 180.0,
          width: 130.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Color(
              color,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pers,
                style: TextStyle(
                    color: Color(0xFFFFF9EC),
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
              IconButton(icon: icon, onPressed: () {}),
              Text(
                text,
                style: TextStyle(
                    color: Color(0xFFFFF9EC),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(220.0),
        child: AppBar(
          backgroundColor: Color(0xFFFFF9EC),
          shadowColor: Colors.black,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              color: Color(0xFFF9BE7C),
            ),
            child: Container(
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/icon.jpg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Text(
                              'R45123741',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Sadek mkaddem',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      /*Text(
                        'developer.aymenmissaoui@gmail.com',
                        style: TextStyle(fontSize: 20.0),
                      ),*/
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFFFF9EC),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Contoller',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF0D253F),
                  ),
                ),
              ),
              _component(
                  Icon(Icons.alarm_add),
                  0xFFE46472,
                  'select who you want',
                  '0 Persons you selected',
                  'selectList'),
              _component(Icon(Icons.list_outlined), 0xFFF9BE7C, 'view list',
                  '20 Worker are presont', 'json'),
              _component(Icon(Icons.play_arrow_outlined), 0xFF6488E4,
                  'Play Video', 'Streaming Live', 'videoStream'),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Performance of Batterys',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF0D253F),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  _boxElement(
                    0xFF309397,
                    'engine',
                    Icon(
                      Icons.battery_charging_full_outlined,
                      size: 40,
                    ),
                    '38%',
                  ),
                  _boxElement(
                    0xFFE46472,
                    'intelligence',
                    Icon(
                      Icons.battery_alert_outlined,
                      size: 40,
                    ),
                    '70%',
                  ),
                  _boxElement(
                      0xFF6488E4,
                      ' modules',
                      Icon(
                        Icons.battery_unknown_outlined,
                        size: 40,
                      ),
                      '50%'),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

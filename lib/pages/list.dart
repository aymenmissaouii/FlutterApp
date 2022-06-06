import 'package:flutter/material.dart';

class List extends StatefulWidget {
  State<StatefulWidget> createState() {
    return SelectList();
  }
}

class SelectList extends State<List> {
  var date = [
    '8:01h',
    '8:05h',
    '8:04h',
    '8:10h',
    '8:00h',
    '8:09h',
    '8:15h',
    '8:30h',
    '8:01h',
    '8:20h',
    '8:16h',
    '8:00h',
    '8:18h',
    '8:12h',
    '8:13h',
    '8:00h',
    '8:01h',
    '8:03h',
    '8:02h',
    '8:04h'
  ];

  var names = [
    'Aymen missaoui',
    'islem fersi',
    'malek jlidi',
    'amine jrad',
    'hamza barkallah',
    'amine tobji',
    'oussema melliti',
    'farouk sghaier',
    'eya bellagha',
    'oumaima mabrouk',
    'farah ben dhiab',
    'nawras khdhir',
    'eya kaabi',
    'hbib belghaith',
    'amir triqui',
    'islem jlidi',
    'sabrine abdeljawad',
    'zied bachwel',
    'moataz jemni',
    'rabi boughariou'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () {
                      Navigator.of(context).pushNamed('home');
                    },
                  ),
                ),
                Text(
                  ' List',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFFFF9EC),
      body: ListView(
        children: [
          for (var i = 0; i < names.length; i++)
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      names[i],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    Text(
                      date[i],
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15.0),
                    ),
                  ],
                )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:ui';

class Select extends StatefulWidget {
  State<StatefulWidget> createState() {
    return SelectList();
  }
}

class SelectList extends State<Select> {
  TimeOfDay _time = TimeOfDay(hour: 2, minute: 00);
  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

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
  Widget _checkBox(String text) {
    bool _isChecked = false;
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: Colors.green,
          onChanged: (bool newValue) {
            setState(() {
              _isChecked = !_isChecked;
              print(_isChecked);
            });
          },
        ),
        Text(text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
      ],
    );
  }

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
                  'Select List',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Container(
                  padding: EdgeInsets.only(left: 90.0),
                  child: ElevatedButton(
                    onPressed: _selectTime,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text('SELECT TIME'),
                  ),
                ),
                /* Container(
                  padding: const EdgeInsets.only(left: 150.0),
                  child: FlatButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2021, 6, 11),
                            maxTime: DateTime(2021, 12, 30), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.fr);
                      },
                      child: Text(
                        'Stop after ..h',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ),*/
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFFFF9EC),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.0),
                for (var i = 0; i < names.length; i++) _checkBox(names[i]),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Text(
          "OK",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        onPressed: () {
          Fluttertoast.showToast(
              msg: 'Your order are saved',
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.black26);
          Navigator.of(context).pushNamed('home');
          print('clicked');
        },
      ),
    );
  }
}

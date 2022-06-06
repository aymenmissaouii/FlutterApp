import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rouchka_controll/components/mydrawer.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatelessWidget {
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'material',
      'label': 'Material',
      'icon': Icon(
        Icons.build_outlined,
      ),
    },
    {
      'value': 'battery',
      'label': 'Battery',
      'icon': Icon(Icons.battery_full_outlined),
    },
    {
      'value': 'software',
      'label': 'Software',
      'icon': Icon(
        Icons.wysiwyg_outlined,
      ),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9EC),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 0,
              ),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    Navigator.of(context).pushNamed('home');
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/icon.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text('R45123741 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Type of problem :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ),
              SelectFormField(
                initialValue: 'None',
                items: _items,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 30.0),
                child: Text(
                  'Explain the problem :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ),
              SizedBox(height: 35.0),
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 5, // when user presses enter it will adapt to it
                decoration: InputDecoration(hintText: 'Write here'),
              ),
              SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                    child: InkWell(
                      child: Container(
                        child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            child: Text(
                              'Send',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 20.0),
                                blurRadius: 50.0,
                                color: Colors.black12,
                              ),
                            ],
                            border:
                                Border.all(width: 0.2, color: Colors.black54),
                            color: Color(0xFFE46472),
                            borderRadius: BorderRadius.circular(50.0)),
                        height: 60.0,
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: 'Your message error are send',
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.black26);
                        Navigator.of(context).pushNamed('home');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  List data;
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/jsonfile/client.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9EC),
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
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            var name = data[index]['name'];
            var email = data[index]['email'];

            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.account_box),
                  ),
                  title: Text(name),
                  subtitle: Text(email),
                ),
                Divider(),
              ],
            );
          }),
    );
  }
}

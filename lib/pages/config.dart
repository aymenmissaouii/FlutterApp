import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  State<StatefulWidget> createState() {
    return ConfigPage();
  }
}

class ConfigPage extends State<Config> {
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
                  ' Configuration',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

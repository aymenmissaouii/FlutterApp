import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var nom = 'Aymen Missaoui';
    var email = 'Developer.aymenmissaoui@gmail.com';
    return Drawer(
        child: ListView(
      children: [
        Container(
          alignment: Alignment.center,
          height: 180.0,
          decoration: BoxDecoration(
            color: Color(0xFF309397),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/aymen.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                nom,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              SizedBox(height: 5),
              Text(email,
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0))
            ],
          ),
        ),
        /* UserAccountsDrawerHeader(
          accountEmail: Text("$email"),
          accountName: Text("$nom"),
          currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
        ),*/
        ListTile(
            title: Text("Profile"),
            leading: Icon(
              Icons.person_outline_rounded,
              color: Color(0xFF309397),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('profile');
            }),
        ListTile(
            title: Text("Liste de visiteur"),
            leading: Icon(
              Icons.view_list_outlined,
              color: Color(0xFF309397),
            ),
            onTap: () {}),
        ListTile(
            title: Text("Controller"),
            leading: Icon(
              Icons.speed_outlined,
              color: Color(0xFF309397),
            ),
            onTap: () {}),
        ListTile(
            title: Text("Help"),
            leading: Icon(Icons.help, color: Color(0xFF309397)),
            onTap: () {
              Navigator.of(context).pushNamed('help');
            }),
        ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings, color: Color(0xFF309397)),
            onTap: () {
              Navigator.of(context).pushNamed('config');
            }),
        Divider(
          thickness: 2,
        ),
        ListTile(
          title: Text("Version          1.0.0"),
        ),
      ],
    ));
  }
}

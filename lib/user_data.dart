import 'package:curly_brackets/curly.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final Curly user;

  UserData(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(user.username),
      ),
      body: Container(
        child: Column(
                      children: <Widget>[
                        ListTile(title: Text("User information"),),
                        Divider(),
                        ListTile(
                          title: Text("Name"),
                          subtitle: Text(user.name),
                          leading: Icon(Icons.mood),
                        ),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text(user.email),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("Phone"),
                          subtitle: Text(user.phone),
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text("Website"),
                          subtitle: Text(user.website),
                          leading: Icon(Icons.web),
                        ),
                        ListTile(
                          title: Text("Company"),
                          subtitle: Text(user.company.name),
                          leading: Icon(Icons.business),
                        ),
                        ListTile(
                          title: Text("City"),
                          subtitle: Text(user.address.city),
                          leading: Icon(Icons.location_city),
                        ),
                      ],
                    ),
      ),
    );
  }
}
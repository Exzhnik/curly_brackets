import 'package:curly_brackets/curly.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
   Curly user;

  UserData({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(user.username),
      ),
      body: Container(
        child: SingleChildScrollView(
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
                        ],
                      ),
        ),
      ),
    );
  }
}
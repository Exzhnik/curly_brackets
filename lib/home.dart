import 'package:curly_brackets/user_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'curly.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = true;
  final String url = 'https://jsonplaceholder.typicode.com/users';
  var client = http.Client();
  List<Curly> users = List<Curly>();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      responseJson.map((m) => users.add(new Curly.fromJson(m))).toList();
      setState(() {
        loading = false;
      });
    } else {
      throw ('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Curly'),
      ),
      body: Container(
          child: loading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(users[index].username),
                      subtitle: Text(users[index].email),
                                            onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserData(users[index])));
                      },

                    );
                    // return InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => UserData()));
                    //   },
                    //   child: Card(
                    //     color: Colors.black38,
                    //     child: ListTile(
                    //       title: Text(users[index].username),
                    //     ),
                    //   ),
                    // );
                  },
                )),
    );
  }
  // List<Curly> curly = List<Curly>();

  // @override
  // void initState() {

  //   super.initState();
  //   loadUser();
  // }

  // Future<void> loadUser() async {
  //   var response =
  //       await http.get('https://jsonplaceholder.typicode.com/users');

  //   if (response.statusCode == 200) {

  //     var jsonresponse = json.decode(response.body);
  //     print(response.statusCode);
  //     setState(() {
  //     curly.add(Curly.fromJson(jsonresponse));
  //   });
  //   return Curly.fromJson(jsonresponse);
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Data User"),
  //     ),
  //     body: Center(
  //       child: ListView.builder(
  //         itemCount: curly.length,
  //         itemBuilder: (context, index){
  //           return Text(curly[index].id.toString());
  //         },
  //       ),
  //     ),
  //   );
  // }
}

import 'package:curly_brackets/curly.dart';
import 'package:curly_brackets/res/url.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import '../curly.dart';

abstract class Repository {
  Future<List<Curly>> getCurly();
}

class RepositoryImpl implements Repository {
  var client = http.Client();
  String ret ='';
  List<Curly> users = List<Curly>();

  @override
  Future<List<Curly>> getCurly() async {
   final response = await client.get(Url.url);
   if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;

     return data.map((f){
       return Curly(
        name: f['name'],
        username: f['username'],
        email: f['email'],
        phone: f['phone'],
        website: f['website'],
       );
     }).toList();
    } else {
      throw Exception();
    }
  }

}
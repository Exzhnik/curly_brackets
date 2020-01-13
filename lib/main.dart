import 'package:curly_brackets/curly_bloc.dart';
import 'package:curly_brackets/rep/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      title: 'Curly',
      home: BlocProvider(
        create: (context) => CurlyBloc(repository: RepositoryImpl()),
        child: Home(),
      ),
    );
  }
}


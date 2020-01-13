import 'package:curly_brackets/curly_bloc.dart';
import 'package:curly_brackets/event.dart';
import 'package:curly_brackets/state.dart';
import 'package:curly_brackets/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'curly.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CurlyBloc curlyBloc;

  @override
  void initState() {
    super.initState();
    curlyBloc = BlocProvider.of<CurlyBloc>(context);
    curlyBloc.add(FetchArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Curly'),
        actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      curlyBloc.add(FetchArticlesEvent());
                    },
                  )
                ],
      ),
              body: Container(
                child: BlocListener<CurlyBloc, CurlyState>(
                  listener: (context, state) {
                    if (state is CurlyErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<CurlyBloc, CurlyState>(
                    builder: (context, state) {
                      if (state is CurlyInitialState) {
                        return buildLoading();
                      } else if (state is CurlyLoadingState) {
                        return buildLoading();
                      } else if (state is CurlyLoadedState) {
                        return buildArticleList(state.curly);
                      } else if (state is CurlyErrorState) {
                        return buildErrorUi(state.message);
                      }
                    },
                  ),
                ),
              ),
    );
  }
  
   Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

   Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

    Widget buildArticleList(List<Curly> curly) {
    return ListView.builder(
      itemCount: curly.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              title: Text(curly[pos].username, style: TextStyle(color:  Colors.white),),
            ),
            onTap: () {
              navigateToDetail(context, curly[pos]);
            },
          ),
        );
      },
    );
  }

  void navigateToDetail(BuildContext context, Curly curly) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return UserData(
        user: curly,
      );
    }));
  }
}

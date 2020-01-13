import 'dart:async';
import 'package:curly_brackets/curly.dart';
import 'package:curly_brackets/event.dart';
import 'package:curly_brackets/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

import 'rep/repository.dart';

class CurlyBloc extends Bloc<CurlyEvent, CurlyState> {
  
  Repository repository;

  CurlyBloc({this.repository});

  @override
  CurlyState get initialState => CurlyInitialState();

  @override
   Stream<CurlyState> mapEventToState(CurlyEvent event) async* {
    if (event is FetchArticlesEvent) {
      yield CurlyLoadingState();
      try {
        List<Curly> curly = await repository.getCurly();
        yield CurlyLoadedState(curly: curly);
      } catch (e) {
        yield CurlyErrorState(message: e.toString());
      }
    }
}
}
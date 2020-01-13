import 'package:curly_brackets/curly.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CurlyState extends Equatable {}

class CurlyInitialState extends CurlyState {
  @override
  List<Object> get props => [];
}

class CurlyLoadingState extends CurlyState {
  @override
  List<Object> get props => [];
}

class CurlyLoadedState extends CurlyState {

  List<Curly> curly;

  CurlyLoadedState({@required this.curly});

  @override
  List<Object> get props => [curly];
}

class CurlyErrorState extends CurlyState {

  String message;

  CurlyErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}


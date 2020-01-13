import 'package:equatable/equatable.dart';

abstract class CurlyEvent extends Equatable{}

class FetchArticlesEvent extends CurlyEvent {
  @override
  List<Object> get props => null;
}
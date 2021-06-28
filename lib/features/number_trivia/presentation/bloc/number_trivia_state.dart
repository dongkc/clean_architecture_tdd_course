import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({@required this.trivia});

  @override
  List<Object> get props => [trivia];
}

class Error extends NumberTriviaState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}

// 收到数据需要更新的状态定义
class DataUpdateState extends NumberTriviaState {
  final String alarm;
  final String id;
  final String fw_version;
  final String hw_version;

  DataUpdateState({this.alarm, this.id, this.fw_version, this.hw_version});

  List<Object> get props => [alarm, id, fw_version, hw_version];
}

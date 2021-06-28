import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../global.dart';

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
  // 终端ID
  final String id;

  List<ParamTest> paramList;

  void add(String key, String val) {
    paramList.add(ParamTest(key, val));
  }

  DataUpdateState(List<ParamTest> this.paramList, String this.id);

  @override
  List<Object> get props => [paramList, id];
}

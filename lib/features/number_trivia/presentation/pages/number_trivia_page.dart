import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    print('pixel ratio: $devicePixelRatio');
    print('pixel ratio: $queryData');
    var size = queryData.size;
    print('pixel width: ${size.width}');
    print('pixel height: ${size.height}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: buildBody(context),
      // body: SingleChildScrollView(
      //   child: buildBody(context),
      // ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Row(
        children: [
          Placeholder(
            fallbackWidth: 80,
            color: Colors.blue,
          ),
          Container(
            width: 320,
            child: Card(
              child: Column(
                children: [
                  Text(
                    "HW123456788765432",
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  Table(
                    columnWidths: {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(children: [
                        Text(
                          "报警等级:",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "正常",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          "固件版本:",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "1.0.0",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          "硬件版本:",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "1.0.0",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          "压力(KN):",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "120.0",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          "压力AD值:",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "12222",
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ),
                      ])
                    ],
                  ),
                  Placeholder(
                    color: Colors.red,
                    fallbackWidth: 200,
                  ),
                ],
              ),
            ),
          ),
          Placeholder(
            color: Colors.green,
            fallbackWidth: 400,
          ),
        ],
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody2(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: 'Start searching!',
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay(numberTrivia: state.trivia);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}

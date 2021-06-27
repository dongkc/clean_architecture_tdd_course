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
            child: buildCard1(),
          ),
          Container(width: 400, child: buildColumn()),
          Expanded(
            child: Placeholder(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        Form(
            child: Column(
          children: [
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: '生产年月'),
            ),
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: '归零值'),
            ),
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: '标定值'),
            ),
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: '微松动阈值'),
            ),
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: '松动阈值'),
            ),
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: '过压阈值'),
            ),
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: '唤醒时间'),
            ),
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: 'IP地址(域名)'),
            ),
            TextFormField(
              initialValue: '0',
              decoration: InputDecoration(labelText: '端口号'),
            ),
          ],
        )),
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: null, child: Text('读取参数')))),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: null, child: Text('写入参数')))),
            ],
          ),
        )
      ],
    );
  }

  Card buildCard1() {
    return Card(
      child: Column(
        children: [
          Text(
            "HW123456788765432",
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
            },
            children: [
              TableRow(children: [
                Text(
                  "报警等级:",
                  // style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.end,
                ),
                Text(
                  "正常",
                  // style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ]),
              TableRow(children: [
                Container(
                  // height: 80,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "固件版本:",
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.end,
                  ),
                ),
                Text(
                  "1.0.0",
                  // style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ]),
              TableRow(children: [
                Text(
                  "硬件版本:",
                  // style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.end,
                ),
                Text(
                  "1.0.0",
                  // style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ]),
              TableRow(children: [
                Text(
                  "压力(KN):",
                  // style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.end,
                ),
                Text(
                  "120.0",
                  // style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ]),
              TableRow(children: [
                Text(
                  "压力AD值:",
                  // style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.end,
                ),
                Text(
                  "255.255.255.255",
                  // style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ])
            ],
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

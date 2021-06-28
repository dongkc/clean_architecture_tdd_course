import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class ParamTest {
  String key;
  String value;

  // ParamTest({this.key, this.value});
  ParamTest(this.key, this.value);
}

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
        title: Text(''),
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
            width: 400,
            // child: buildCard1(),
            child: buildCard2(context),
          ),
          Container(width: 300, child: buildColumn()),
          Expanded(
            child: buildContainer(context),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Builder(
              builder: (BuildContext context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<NumberTriviaBloc>(context)
                                      .add(IAE203UpdateParamsEvent("test"));
                                },
                                child: Text('读取参数')))),
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('写入参数')))),
                  ],
                );
              },
            ),
          ),
          Placeholder(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget buildColumn() {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '生产年月'),
                ),
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '归零值'),
                ),
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '标定值'),
                ),
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '微松动阈值'),
                ),
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '松动阈值'),
                ),
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '过压阈值'),
                ),
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '唤醒时间'),
                ),
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: 'IP地址(域名)'),
                ),
                TextFormField(
                  initialValue: '0',
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(
                    labelText: '端口号',
                    // labelStyle: TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget getWidget(List<ParamTest> para) {
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
        },
        children: para.map((item) {
          return TableRow(
            children: [
              Text(
                item.key,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                item.value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          );
        }).toList());
  }

  Widget buildCard2(BuildContext context) {
    // Card buildCard2() {
    List<ParamTest> test = [
      ParamTest('报警等级:', '正常'),
      ParamTest('固件版本:', '1.0.0'),
      ParamTest('硬件版本:', '1.0.0'),
      ParamTest('压力(KN):', '120.0'),
      ParamTest('压力AD值:', '123456'),
      ParamTest('生产年月:', '2021/01'),
      ParamTest('归零值:', ''),
      ParamTest('标定值:', ''),
      ParamTest('微松动阈值:', ''),
      ParamTest('松动阈值:', ''),
      ParamTest('过压阈值:', ''),
      ParamTest('唤醒时间:', ''),
      ParamTest('IP地址(域名):', '255.255.255.255'),
      ParamTest('端口号:', ''),
    ];
    var id = "test";
    return Card(
      child: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
        builder: (context, state) {
          if (state is DataUpdateState) {
            print('state ---------------- ${state}');
            id = state.alarm;
          }
          return Column(
            children: [
              Text(
                id,
                // 'HW123456788765432',
                style: TextStyle(fontSize: 38.0),
                textAlign: TextAlign.center,
              ),
              getWidget(test),
            ],
          );
        },
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildCard1(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Card(
        child: Column(
          children: [
            Text(
              'HW123456788765432',
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
                    '报警等级:',
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    '正常',
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                ]),
                TableRow(children: [
                  Container(
                    // height: 80,
                    alignment: Alignment.centerRight,
                    child: Text(
                      '固件版本:',
                      // style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Text(
                    '1.0.0',
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                ]),
                TableRow(children: [
                  Text(
                    '硬件版本:',
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    '1.0.0',
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                ]),
                TableRow(children: [
                  Text(
                    '压力(KN):',
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    '120.0',
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                ]),
                TableRow(children: [
                  Text(
                    '压力AD值:',
                    // style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    '255.255.255.255',
                    // style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ])
              ],
            ),
          ],
        ),
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

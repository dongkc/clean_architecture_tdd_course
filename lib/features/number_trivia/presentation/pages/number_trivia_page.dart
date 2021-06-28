import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/widgets/IAE203_controls.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../global.dart';

class NumberTriviaPage extends StatefulWidget {
  @override
  _NumberTriviaPageState createState() => _NumberTriviaPageState();
}

class _NumberTriviaPageState extends State<NumberTriviaPage> {
  int _selectedIndex = 0;

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
        title: Text('demo'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                print('-----------------------------');
                print(_selectedIndex);
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Container(
            width: 400,
            // child: buildCard1(),
            child: buildCard2(context),
          ),
          // Row(
          //   children: [
          //     Placeholder(fallbackWidth: 300),
          //     // Expanded(
          //       // child: Placeholder(),
          //     // ),
          //   ],
          // ),
          IAE203Controls(),
          // Container(width: 300, child: buildColumn()),
          // Expanded(
          //   child: buildContainer(context),
          // ),
        ],
      ),
    );
  }

  Widget getWidget(List<ParamEntry> para) {
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
    List<ParamEntry> test = [
      ParamEntry('报警等级:', ''),
      ParamEntry('固件版本:', ''),
      ParamEntry('硬件版本:', ''),
      ParamEntry('压力(KN):', ''),
      ParamEntry('压力AD值:', ''),
      ParamEntry('生产年月:', ''),
      ParamEntry('归零值:', ''),
      ParamEntry('标定值:', ''),
      ParamEntry('微松动阈值:', ''),
      ParamEntry('松动阈值:', ''),
      ParamEntry('过压阈值:', ''),
      ParamEntry('唤醒时间:', ''),
      ParamEntry('IP地址(域名):', ''),
      ParamEntry('端口号:', ''),
    ];
    var id = "";
    return Card(
      child: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
        builder: (context, state) {
          if (state is DataUpdateState) {
            print('state ---------------- ${state}');
            test = state.paramList;
            id = state.id;
          }
          return Column(
            children: [
              Text(
                id,
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

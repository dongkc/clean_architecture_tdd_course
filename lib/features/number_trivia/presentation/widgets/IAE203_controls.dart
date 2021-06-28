import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IAE203Controls extends StatefulWidget {
  const IAE203Controls({
    Key key,
  }) : super(key: key);

  @override
  _IAE203ControlsState createState() => _IAE203ControlsState();
}

class _IAE203ControlsState extends State<IAE203Controls> {
  final _product_year_ctl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 300, child: buildColumn()),
        // Expanded(
          buildContainer(context),
        // ),
      ],
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

  Widget buildContainer(BuildContext context) {
    return Container(
      width: 480,
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

}

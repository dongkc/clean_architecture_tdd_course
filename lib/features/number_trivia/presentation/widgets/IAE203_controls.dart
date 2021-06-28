import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class IAE203Controls extends StatefulWidget {
  const IAE203Controls({
    Key key,
  }) : super(key: key);

  @override
  _IAE203ControlsState createState() => _IAE203ControlsState();
}

class _IAE203ControlsState extends State<IAE203Controls> {
  final TextEditingController _product_year_ctl = TextEditingController();
  final TextEditingController _gui_ling_ctl = TextEditingController();
  final TextEditingController _biao_ding_ctl = TextEditingController();
  final TextEditingController _song_dong1_ctl = TextEditingController();
  final TextEditingController _song_dong2_ctl = TextEditingController();
  final TextEditingController _guo_ya_ctl = TextEditingController();
  final TextEditingController _wake_time_ctl = TextEditingController();
  final TextEditingController _server_addr_ctl = TextEditingController();
  final TextEditingController _server_port_ctl = TextEditingController();

  final format = DateFormat("yyyy/MM/dd");
  final time_format = DateFormat("HH:mm");

  @override
  void initState() {
    _product_year_ctl.text = "2021/6/12";
    _gui_ling_ctl.text = "0";
    _biao_ding_ctl.text = "0";
    _song_dong1_ctl.text = '0';
    _song_dong2_ctl.text = '0';
    _guo_ya_ctl.text = '0';
    _wake_time_ctl.text = '00:00';
    _server_addr_ctl.text = '0';
    _server_port_ctl.text = '0';
  }

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
                DateTimeField(
                  controller: _product_year_ctl,
                  format: format,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '制造日期'),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
                TextFormField(
                  controller: _gui_ling_ctl,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '归零值'),
                ),
                TextFormField(
                  controller: _biao_ding_ctl,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '标定值'),
                ),
                TextFormField(
                  controller: _song_dong1_ctl,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '微松动阈值'),
                ),
                TextFormField(
                  controller: _song_dong2_ctl,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '松动阈值'),
                ),
                TextFormField(
                  controller: _guo_ya_ctl,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '过压阈值'),
                ),
                DateTimeField(
                  controller: _wake_time_ctl,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: '唤醒时间'),
                  format: time_format,
                  onShowPicker: (context, currentValue) async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                    if (time != null) {
                      return DateTimeField.combine(DateTime.now(), time);
                    } else {
                      return currentValue;
                    }
                  },
                  // onShowPicker: (context, currentValue) {
                  //   return showTimePicker(
                  //     context: context,
                  //     initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                  //   );
                  // },
                ),

                // TextFormField(
                //   controller: _wake_time_ctl,
                //   style: TextStyle(fontSize: 25.0),
                //   decoration: InputDecoration(labelText: '唤醒时间'),
                // ),
                TextFormField(
                  controller: _server_addr_ctl,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(labelText: 'IP地址(域名)'),
                ),
                TextFormField(
                  controller: _server_port_ctl,
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
                                onPressed: sendReadcmd, child: Text('读取参数')))),
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

  void sendReadcmd() {
    print(_product_year_ctl.text);
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(IAE203UpdateParamsEvent(_product_year_ctl.text));
  }
}

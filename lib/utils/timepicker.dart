import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/changethem_cubit.dart';

class timepicker extends StatefulWidget {
  const timepicker({super.key});

  @override
  State<timepicker> createState() => _timepickerState();
}

class _timepickerState extends State<timepicker> {
  TextEditingController _timecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TimeOfDay _timedaty = TimeOfDay(hour: 13, minute: 12);
    ChangethemCubit _theme =
        BlocProvider.of<ChangethemCubit>(context, listen: true);
    return TextField(
      controller: _timecontroller,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              Icons.access_time_outlined,
              color: _theme.dark ? Colors.white : Colors.grey,
            ),
            onPressed: () async {
              var _time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (_time != null && _time != TimeOfDay.now()) {
                setState(() {
                  _timedaty = _time;
                  _timecontroller.text = _timedaty.format(context);
                });
              }
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
    );
  }
}

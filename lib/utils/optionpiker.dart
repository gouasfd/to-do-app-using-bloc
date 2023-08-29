import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/changethem_cubit.dart';

class optionpicker extends StatefulWidget {
  const optionpicker({super.key});

  @override
  State<optionpicker> createState() => _optionpickerState();
}

class _optionpickerState extends State<optionpicker> {
  @override
  List<String> repeat = ['none', 'daily', 'weekly', 'monthly'];
  var _selected = 'none';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: repeat
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      value: _selected,
      onChanged: (value) {
        setState(() {
          _selected = value!;
        });
      },
    );
  }
}

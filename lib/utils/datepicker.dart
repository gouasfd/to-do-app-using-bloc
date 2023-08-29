import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../logic/cubit/changethem_cubit.dart';

class textfield extends StatefulWidget {
  const textfield({super.key});

  @override
  State<textfield> createState() => _textfieldState();
}

TextEditingController _datecontroller = TextEditingController();

class _textfieldState extends State<textfield> {
  List<DateTime?> _date = [];
  DateTime? pikeddat = DateTime.now();
  DateTime? _selectdate;
  @override
  Widget build(BuildContext context) {
    ChangethemCubit _theme =
        BlocProvider.of<ChangethemCubit>(context, listen: true);
    return TextField(
      controller: _datecontroller,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () async {
              DateTime? pikeddat = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2027));
              if (pikeddat != null && pikeddat != DateTime.now()) {
                setState(() {
                  _datecontroller.text = DateFormat.yMMMMd().format(pikeddat);
                });
              }
            },
            icon: Icon(Icons.calendar_month),
            color: _theme.dark ? Colors.white : Colors.grey,
          ),
          hintText: 'enter the date here',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
    );
  }
}

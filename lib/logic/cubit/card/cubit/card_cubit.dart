import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());
  Color colors = Colors.black;
  List<Map<String, dynamic>> taskslist = [];
  void information(
    String title,
    String note,
  ) {
    Map<String, dynamic> minitasks = {
      'title': title,
      'note': note,
      'color': colors
    };
    taskslist.add(minitasks);

    emit(CardInformation(tasks: taskslist));
  }

  void delete(int index) {
    taskslist.removeAt(index);
    emit(Removecard());
  }
}

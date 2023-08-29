import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:to_go_app2/logic/cubit/card/cubit/card_cubit.dart';
import 'package:to_go_app2/logic/cubit/changethem_cubit.dart';
import 'package:to_go_app2/ui/listoftasks.dart';
import 'package:to_go_app2/utils/text_editor.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ChangethemCubit _theme =
        BlocProvider.of<ChangethemCubit>(context, listen: true);
    CardCubit _card = BlocProvider.of<CardCubit>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.maxFinite,
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<ChangethemCubit>(context)
                              .changetheme();
                        },
                        icon: _theme.dark
                            ? Icon(Icons.sunny)
                            : Icon(Icons.nightlight)),
                    CircleAvatar(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    textedit(
                      texte: DateFormat.yMMMMd().format(DateTime.now()),
                      big: false,
                      colore: Colors.grey,
                    ),
                    textedit(
                      texte: "today",
                      big: true,
                      colore: _theme.dark ? Colors.white : Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.purple),
                      onPressed: () {
                        Navigator.pushNamed(context, 'taskpage');
                      },
                      child: textedit(texte: 'add task +')),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              deactivatedColor: _theme.dark ? Colors.black : Colors.white,
              selectionColor: Colors.purple,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected

                var _selectedValue = date;
              },
            ),
            SizedBox(
              height: 20,
            ),
            list(),
          ],
        ),
      ),
    );
  }
}

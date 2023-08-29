import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_go_app2/logic/cubit/card/cubit/card_cubit.dart';

import 'package:to_go_app2/utils/optionpiker.dart';
import 'package:to_go_app2/utils/text_editor.dart';
import 'package:to_go_app2/utils/datepicker.dart';
import 'package:to_go_app2/utils/timepicker.dart';

import '../logic/cubit/changethem_cubit.dart';

class taskpage extends StatelessWidget {
  taskpage({super.key});
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _notecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool submit() {
    if (_formkey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ChangethemCubit _theme =
        BlocProvider.of<ChangethemCubit>(context, listen: true);
    return Form(
      key: _formkey,
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                CircleAvatar(),
              ],
            ),
            textedit(
              texte: 'add task',
              big: true,
              colore: _theme.dark ? Colors.white : Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            textedit(
              texte: 'title',
              middle: true,
              colore: _theme.dark ? Colors.white : Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter somthing';
                }
                return null;
              },
              controller: _titlecontroller,
              decoration: InputDecoration(
                  hintText: 'enter the title here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7))),
            ),
            SizedBox(
              height: 10,
            ),
            textedit(
              texte: 'note',
              middle: true,
              colore: _theme.dark ? Colors.white : Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter somthing';
                }
                return null;
              },
              controller: _notecontroller,
              decoration: InputDecoration(
                  hintText: 'enter the note here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7))),
            ),
            SizedBox(
              height: 10,
            ),
            textedit(
              texte: 'date',
              middle: true,
              colore: _theme.dark ? Colors.white : Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            textfield(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textedit(
                      texte: 'start time',
                      middle: true,
                      colore: _theme.dark ? Colors.white : Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: timepicker()),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textedit(
                      texte: 'end time',
                      middle: true,
                      colore: _theme.dark ? Colors.white : Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: timepicker()),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            textedit(
              middle: true,
              texte: 'repeat',
              colore: _theme.dark ? Colors.white : Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            optionpicker(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    if (submit() == true) {
                      Navigator.pop(context);
                      BlocProvider.of<CardCubit>(context).information(
                          _titlecontroller.text, _notecontroller.text);
                    } else {
                      SizedBox();
                    }
                    // Navigator.pop(context);
                  },
                  child: textedit(
                    texte: 'generate',
                  )),
            )
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_go_app2/utils/text_editor.dart';

import '../logic/cubit/card/cubit/card_cubit.dart';

class submit extends StatefulWidget {
  submit(
      {super.key,
      required this.note,
      required this.title,
      required this.submite});
  String title;
  String note;
  bool submite;
  @override
  State<submit> createState() => _submitState();
}

class _submitState extends State<submit> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
          ),
          onPressed: () {
            if (widget.submite == true) {
              Navigator.pop(context);
              BlocProvider.of<CardCubit>(context).information(
                widget.title,
                widget.note,
              );
            } else {
              SizedBox();
            }
            // Navigator.pop(context);
          },
          child: textedit(
            texte: 'generate',
          )),
    );
  }
}

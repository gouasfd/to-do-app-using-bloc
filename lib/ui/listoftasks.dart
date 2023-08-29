import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:to_go_app2/utils/text_editor.dart';

import '../logic/cubit/card/cubit/card_cubit.dart';

class list extends StatefulWidget {
  list({
    super.key,
  });

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.green,
      Colors.purple,
      Colors.blue,
      Colors.indigo,
      Colors.pink,
    ];
    return BlocBuilder<CardCubit, CardState>(
      builder: (context, state) {
        if (state is CardInitial) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child:
                Center(child: Lottie.asset('assets/animation_lktusw8y.json')),
          );
        } else if (state is CardInformation) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors[index],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textedit(
                                texte: state.tasks[index]['title'],
                                middle: true,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              textedit(
                                texte: state.tasks[index]['note'],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<CardCubit>(context).delete(index);
                            },
                            icon: Icon(Icons.clear_sharp),
                            color: colors[index] == Colors.red
                                ? Colors.black
                                : Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is Removecard) {
          CardCubit cards = BlocProvider.of<CardCubit>(context);
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: cards.taskslist.length,
            itemBuilder: (context, index) {
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors[index],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textedit(
                                texte: cards.taskslist[index]['title'],
                                middle: true,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              textedit(
                                texte: cards.taskslist[index]['note'],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<CardCubit>(context).delete(index);
                            },
                            icon: Icon(Icons.clear_sharp),
                            color: colors[index] == Colors.red
                                ? Colors.black
                                : Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

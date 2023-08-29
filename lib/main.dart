import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_go_app2/logic/cubit/card/cubit/card_cubit.dart';
import 'package:to_go_app2/ui/home_page.dart';
import 'package:to_go_app2/ui/task_page.dart';
import 'package:to_go_app2/utils/theme.dart';

import 'logic/cubit/changethem_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ChangethemCubit(),
      ),
      BlocProvider(
        create: (context) => CardCubit(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangethemCubit _theme =
        BlocProvider.of<ChangethemCubit>(context, listen: true);
    return MaterialApp(
      routes: {
        'homepage': (context) => MyHomePage(),
        'taskpage': (context) => taskpage(),
      },
      title: 'Flutter Demo',
      theme: _theme.dark ? themes.dark : themes.light,
      home: MyHomePage(),
    );
  }
}

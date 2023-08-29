part of 'card_cubit.dart';

@immutable
abstract class CardState {}

class CardInitial extends CardState {}

class CardInformation extends CardState {
  List<Map<String, dynamic>> tasks;

  CardInformation({required this.tasks});
}

class Removecard extends CardState {}

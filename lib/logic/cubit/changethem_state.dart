part of 'changethem_cubit.dart';

@immutable
abstract class ChangethemState {}

class ChangethemInitial extends ChangethemState {}

class Changetheme extends ChangethemState {}

class tappedst extends ChangethemState {
  int index;
  tappedst(this.index);
}

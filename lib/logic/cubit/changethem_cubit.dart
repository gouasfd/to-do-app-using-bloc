import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changethem_state.dart';

class ChangethemCubit extends Cubit<ChangethemState> {
  ChangethemCubit() : super(ChangethemInitial());
  bool dark = true;
  void changetheme() {
    dark = !dark;

    emit(Changetheme());
  }

  void tapped(index) {
    emit(tappedst(index));
  }
}

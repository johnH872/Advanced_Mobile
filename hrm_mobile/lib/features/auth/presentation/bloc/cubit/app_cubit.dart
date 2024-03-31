import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const ChangePageIndex(index: 0));

  void changePageIndex({required int index}) => emit(ChangePageIndex(index: index));
}

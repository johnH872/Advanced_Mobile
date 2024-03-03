part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  final int pageIndex;
  const AppState({required this.pageIndex}); 

  @override
  List<Object> get props => [pageIndex];
}

final class ChangePageIndex extends AppState{
  const ChangePageIndex({required index}) : super(pageIndex: index);
}

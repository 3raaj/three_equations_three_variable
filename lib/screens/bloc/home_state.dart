part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class WatingForComlete extends HomeState {}

class HomeSuccess extends HomeState {
 final ResultMatrixToShow resultMatrixToShow ;

  HomeSuccess({required this.resultMatrixToShow});
}
class HomeSuccess2 extends HomeState {
 final ResultMatrixToShow resultMatrixToShow ;

  HomeSuccess2({required this.resultMatrixToShow});
}
class HomeSuccess3 extends HomeState {
 final ResultMatrixToShow resultMatrixToShow ;

  HomeSuccess3({required this.resultMatrixToShow});
}

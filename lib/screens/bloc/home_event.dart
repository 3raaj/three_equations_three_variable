part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeStarted extends HomeEvent {}

class CalculateBottonClicked extends HomeEvent {
  final TextEditingController x11;
  final TextEditingController x12;
  final TextEditingController x13;
  final TextEditingController x21;
  final TextEditingController x22;
  final TextEditingController x23;
  final TextEditingController x31;
  final TextEditingController x32;
  final TextEditingController x33;
  final TextEditingController e1Result;
  final TextEditingController e2Result;
  final TextEditingController e3Result;
  CalculateBottonClicked(
      {required this.x11,
      required this.x12,
      required this.x13,
      required this.x21,
      required this.x22,
      required this.x23,
      required this.x31,
      required this.x32,
      required this.x33,
      required this.e1Result,
      required this.e2Result,
      required this.e3Result});
}

class Calculate2BottonClicked extends HomeEvent {
  final double x11;
  final double x12;
  final double x13;
  final double x21;
  final double x22;
  final double x23;
  final double x31;
  final double x32;
  final double x33;
  final double e1Result;
  final double e2Result;
  final double e3Result;
  Calculate2BottonClicked(
      {required this.x11,
      required this.x12,
      required this.x13,
      required this.x21,
      required this.x22,
      required this.x23,
      required this.x31,
      required this.x32,
      required this.x33,
      required this.e1Result,
      required this.e2Result,
      required this.e3Result});
}
class Calculate3BottonClicked extends HomeEvent {
  final double x11;
  final double x12;
  final double x13;
  final double x21;
  final double x22;
  final double x23;
  final double x31;
  final double x32;
  final double x33;
  final double e1Result;
  final double e2Result;
  final double e3Result;
  Calculate3BottonClicked(
      {required this.x11,
      required this.x12,
      required this.x13,
      required this.x21,
      required this.x22,
      required this.x23,
      required this.x31,
      required this.x32,
      required this.x33,
      required this.e1Result,
      required this.e2Result,
      required this.e3Result});
}

class RefreshBottonClicked extends HomeEvent {}

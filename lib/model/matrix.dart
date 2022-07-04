class FirstRow {
  double x11;
  double x12;
  double x13;
  double e1;
  FirstRow(
      {required this.x11,
      required this.x12,
      required this.x13,
      required this.e1});
}

class SecoundRow {
  double x21;
  double x22;
  double x23;
  double e2;

  SecoundRow(
      {required this.x21,
      required this.x22,
      required this.x23,
      required this.e2});
}

class ThirdRow {
  double x31;
  double x32;
  double x33;
  double e3;

  ThirdRow(
      {required this.x31,
      required this.x32,
      required this.x33,
      required this.e3});
}

class MatrixRows {
  final FirstRow firstRow;

  final SecoundRow secoundRow;

  final ThirdRow thirdRow;

  MatrixRows(
      {required this.firstRow,
      required this.secoundRow,
      required this.thirdRow});
}

class ResultMatrixToShow {
  final MatrixRows delta1;


  ResultMatrixToShow({
      required this.delta1,});
}

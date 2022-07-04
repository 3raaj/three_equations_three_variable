import 'package:flutter/foundation.dart';
import 'package:my_application_2/model/matrix.dart';

List<MatrixRows> doGawsJordan({
  required dynamic targetRowElement,
  required int levelNumber,
  required List matrixRows,
  required MatrixRows firstDeltaResult,
  required MatrixRows secoundDeltaResult,
  required MatrixRows thirdDeltaResult,
}) {
  final List<MatrixRows> matrisRows = [];
  final firstRow = matrixRows[0];
  final secoundRow = matrixRows[1];
  final thirdRow = matrixRows[2];

  if (levelNumber == 1) {
    if (targetRowElement.x11 != 1.toDouble()) {
      final double firstValueOfx11 = targetRowElement.x11;
      targetRowElement.x11 = 1.toDouble();
      targetRowElement.x12 = targetRowElement.x12 / firstValueOfx11;
      targetRowElement.x13 = targetRowElement.x13 / firstValueOfx11;
      targetRowElement.e1 = targetRowElement.e1 / firstValueOfx11;
    }
    secoundRow as SecoundRow;
    final secoundToFirstRatio = secoundRow.x21 / targetRowElement.x11;
    secoundRow.x21 =
        secoundRow.x21 - (secoundToFirstRatio) * targetRowElement.x11;
    secoundRow.x22 =
        secoundRow.x22 - (secoundToFirstRatio) * targetRowElement.x12;
    secoundRow.x23 =
        secoundRow.x23 - (secoundToFirstRatio) * targetRowElement.x13;
    secoundRow.e2 = secoundRow.e2 - (secoundToFirstRatio) * targetRowElement.e1;
    thirdRow as ThirdRow;
    final thirdToFirstRatio = thirdRow.x31 / targetRowElement.x11;
    thirdRow.x31 = 0.toDouble();
    thirdRow.x32 = thirdRow.x32 - (thirdToFirstRatio) * targetRowElement.x12;
    thirdRow.x33 = thirdRow.x33 - (thirdToFirstRatio) * targetRowElement.x13;
    thirdRow.e3 = thirdRow.e3 - (thirdToFirstRatio) * targetRowElement.e1;
    firstDeltaResult.firstRow.e1 = targetRowElement.e1;
    firstDeltaResult.firstRow.x11 = targetRowElement.x11;
    firstDeltaResult.firstRow.x12 = targetRowElement.x12;
    firstDeltaResult.firstRow.x13 = targetRowElement.x13;
    firstDeltaResult.secoundRow.e2 = secoundRow.e2;
    firstDeltaResult.secoundRow.x21 = secoundRow.x21;
    firstDeltaResult.secoundRow.x22 = secoundRow.x22;
    firstDeltaResult.secoundRow.x23 = secoundRow.x23;
    firstDeltaResult.thirdRow.e3 = thirdRow.e3;
    firstDeltaResult.thirdRow.x31 = thirdRow.x31;
    firstDeltaResult.thirdRow.x32 = thirdRow.x32;
    firstDeltaResult.thirdRow.x33 = thirdRow.x33;
    matrisRows.add(firstDeltaResult);
  } else if (levelNumber == 2) {
    if (targetRowElement.x22 != 1.toDouble()) {
      final double firstValueOfx22 = targetRowElement.x22;

      targetRowElement.x22 = targetRowElement.x22 / targetRowElement.x22;
      targetRowElement.x21 = targetRowElement.x21 / firstValueOfx22;
      targetRowElement.x23 = targetRowElement.x23 / firstValueOfx22;
      targetRowElement.e2 = targetRowElement.e2 / firstValueOfx22;
    }
    firstRow as FirstRow;
    final firstToSecoundRatio = firstRow.x12 / targetRowElement.x22;

    firstRow.x12 = firstRow.x12 - (firstToSecoundRatio) * targetRowElement.x22;
    firstRow.x13 = firstRow.x13 - (firstToSecoundRatio) * targetRowElement.x23;
    firstRow.e1 = firstRow.e1 - (firstToSecoundRatio) * targetRowElement.e2;
    thirdRow as ThirdRow;
    final thirdToSecoundRatio = thirdRow.x32 / targetRowElement.x22;

    thirdRow.x32 = thirdRow.x32 - (thirdToSecoundRatio) * targetRowElement.x22;
    thirdRow.x33 = thirdRow.x33 - (thirdToSecoundRatio) * targetRowElement.x23;
    thirdRow.e3 = thirdRow.e3 - (thirdToSecoundRatio) * targetRowElement.e2;
    secoundDeltaResult.secoundRow.e2 = targetRowElement.e2;
    secoundDeltaResult.secoundRow.x21 = targetRowElement.x21;
    secoundDeltaResult.secoundRow.x22 = targetRowElement.x22;
    secoundDeltaResult.secoundRow.x23 = targetRowElement.x23;
    secoundDeltaResult.firstRow.e1 = firstRow.e1;
    secoundDeltaResult.firstRow.x11 = firstRow.x11;
    secoundDeltaResult.firstRow.x12 = firstRow.x12;
    secoundDeltaResult.firstRow.x13 = firstRow.x13;
    secoundDeltaResult.thirdRow.e3 = thirdRow.e3;
    secoundDeltaResult.thirdRow.x31 = thirdRow.x31;
    secoundDeltaResult.thirdRow.x32 = thirdRow.x32;
    secoundDeltaResult.thirdRow.x33 = thirdRow.x33;
    matrisRows.add(secoundDeltaResult);
  } else if (levelNumber == 3) {
    targetRowElement as ThirdRow;
    if (targetRowElement.x33 > 1.0 || targetRowElement.x33 < 1.0) {
      final double firstValueOfx33 = targetRowElement.x33;

      targetRowElement.x33 = 1.toDouble();
      targetRowElement.x32 = targetRowElement.x32 / firstValueOfx33;
      targetRowElement.x31 = targetRowElement.x31 / firstValueOfx33;
      targetRowElement.e3 = targetRowElement.e3 / firstValueOfx33;
      debugPrint(targetRowElement.x33.toString());
    }
    debugPrint(targetRowElement.x33.toString());
    firstRow as FirstRow;
    final firstToThirdRatio = firstRow.x13 / targetRowElement.x33;

    firstRow.x13 = firstRow.x13 - (firstToThirdRatio) * targetRowElement.x33;
    firstRow.x12 = firstRow.x12 - (firstToThirdRatio) * targetRowElement.x32;
    firstRow.x11 = firstRow.x11 - (firstToThirdRatio) * targetRowElement.x31;
    firstRow.e1 = firstRow.e1 - (firstToThirdRatio) * targetRowElement.e3;
    secoundRow as SecoundRow;
    final secoundToThirdRatio = secoundRow.x23 / targetRowElement.x33;

    secoundRow.x21 =
        secoundRow.x21 - (secoundToThirdRatio) * targetRowElement.x31;
    secoundRow.x22 =
        secoundRow.x22 - (secoundToThirdRatio) * targetRowElement.x32;
    secoundRow.x23 =
        secoundRow.x23 - (secoundToThirdRatio) * targetRowElement.x33;
    thirdDeltaResult.firstRow.e1 = firstRow.e1;
    thirdDeltaResult.firstRow.x11 = firstRow.x11;
    thirdDeltaResult.firstRow.x12 = firstRow.x12;
    thirdDeltaResult.firstRow.x13 = firstRow.x13;
    thirdDeltaResult.secoundRow.e2 = secoundRow.e2;
    thirdDeltaResult.secoundRow.x21 = secoundRow.x21;
    thirdDeltaResult.secoundRow.x23 = secoundRow.x23;
    thirdDeltaResult.thirdRow.e3 = targetRowElement.e3;
    thirdDeltaResult.thirdRow.x31 = targetRowElement.x31;
    thirdDeltaResult.thirdRow.x32 = targetRowElement.x32;
    thirdDeltaResult.thirdRow.x33 = targetRowElement.x33;
    matrisRows.add(thirdDeltaResult);
  } else {
    return [];
  }
  return matrisRows;
}

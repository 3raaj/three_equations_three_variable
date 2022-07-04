import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application_2/model/matrix.dart';

import '../../model/calculate.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is RefreshBottonClicked) {
        emit(WatingForComlete());
      } else if (event is CalculateBottonClicked) {
        //start new codes
        final FirstRow firstRow = FirstRow(
          x11: double.parse(event.x11.text),
          x12: double.parse(event.x12.text),
          x13: double.parse(event.x13.text),
          e1: double.parse(event.e1Result.text),
        );
        final SecoundRow secoundRow = SecoundRow(
          x21: double.parse(event.x21.text),
          x22: double.parse(event.x22.text),
          x23: double.parse(event.x23.text),
          e2: double.parse(event.e2Result.text),
        );

        final ThirdRow thirdRow = ThirdRow(
          x31: double.parse(event.x31.text),
          x32: double.parse(event.x32.text),
          x33: double.parse(event.x33.text),
          e3: double.parse(event.e3Result.text),
        );

        bool isFirstElementIs1 = true;
        double? x11ValueSecound;
        double? x12ValueSecound;
        double? x13ValueSecound;
        double? x21ValueSecound;
        double? x22ValueSecound;
        double? x23ValueSecound;
        double? x31ValueSecound;
        double? x32ValueSecound;
        double? x33ValueSecound;
        double? e1ResultValueSecound;
        double? e2ResultValueSecound;
        double? e3ResultValueSecound;
        double? x11ValueThird;
        double? x12ValueThird;
        double? x13ValueThird;
        double? x21ValueThird;
        double? x22ValueThird;
        double? x23ValueThird;
        double? x31ValueThird;
        double? x32ValueThird;
        double? x33ValueThird;
        double? e1ResultValueThird;
        double? e2ResultValueThird;
        double? e3ResultValueThird;
        final MatrixRows firstDeltaResult = MatrixRows(
            firstRow: firstRow, secoundRow: secoundRow, thirdRow: thirdRow);
        final MatrixRows secoundDeltaResult = MatrixRows(
            firstRow: firstRow, secoundRow: secoundRow, thirdRow: thirdRow);
        final MatrixRows thirdDeltaResult = MatrixRows(
            firstRow: firstRow, secoundRow: secoundRow, thirdRow: thirdRow);

        final List<MatrixRows> delta1Result = doGawsJordan(
            levelNumber: 1,
            secoundDeltaResult: secoundDeltaResult,
            thirdDeltaResult: thirdDeltaResult,
            firstDeltaResult: firstDeltaResult,
            targetRowElement: firstRow,
            matrixRows: [firstRow, secoundRow, thirdRow]);

        // final MatrixRows delta2Result = doGawsJordan(

        //     targetRowElement: delta1Result.secoundRow,
        //     matrixRows: [delta1Result.firstRow, secoundRow, thirdRow]);
        // final MatrixRows delta3Result = doGawsJordan(
        //     targetRowElement: thirdRow,
        //     matrixRows: [firstRow, secoundRow, thirdRow]);

        final ResultMatrixToShow resultMatrixToShow = ResultMatrixToShow(
          delta1: delta1Result[0],
          // delta3: delta3Reslt,,
        );
        emit(HomeSuccess(resultMatrixToShow: resultMatrixToShow));
      } else if (event is Calculate2BottonClicked) {
        final FirstRow firstRow1 = FirstRow(
          x11: event.x11,
          x12: event.x12,
          x13: event.x13,
          e1: event.e1Result,
        );
        final SecoundRow secoundRow1 = SecoundRow(
          x21: event.x21,
          x22: event.x22,
          x23: event.x23,
          e2: event.e2Result,
        );

        final ThirdRow thirdRow1 = ThirdRow(
          x31: event.x31,
          x32: event.x32,
          x33: event.x33,
          e3: event.e3Result,
        );

        bool isFirstElementIs1 = true;
        double? x11ValueSecound;
        double? x12ValueSecound;
        double? x13ValueSecound;
        double? x21ValueSecound;
        double? x22ValueSecound;
        double? x23ValueSecound;
        double? x31ValueSecound;
        double? x32ValueSecound;
        double? x33ValueSecound;
        double? e1ResultValueSecound;
        double? e2ResultValueSecound;
        double? e3ResultValueSecound;
        double? x11ValueThird;
        double? x12ValueThird;
        double? x13ValueThird;
        double? x21ValueThird;
        double? x22ValueThird;
        double? x23ValueThird;
        double? x31ValueThird;
        double? x32ValueThird;
        double? x33ValueThird;
        double? e1ResultValueThird;
        double? e2ResultValueThird;
        double? e3ResultValueThird;
        final MatrixRows firstDeltaResult = MatrixRows(
            firstRow: firstRow1, secoundRow: secoundRow1, thirdRow: thirdRow1);
        final MatrixRows secoundDeltaResult = MatrixRows(
            firstRow: firstRow1, secoundRow: secoundRow1, thirdRow: thirdRow1);
        final MatrixRows thirdDeltaResult = MatrixRows(
            firstRow: firstRow1, secoundRow: secoundRow1, thirdRow: thirdRow1);

        final List<MatrixRows> delta1Result = doGawsJordan(
            levelNumber: 2,
            secoundDeltaResult: secoundDeltaResult,
            thirdDeltaResult: thirdDeltaResult,
            firstDeltaResult: firstDeltaResult,
            targetRowElement: secoundRow1,
            matrixRows: [firstRow1, secoundRow1, thirdRow1]);

        // final MatrixRows delta2Result = doGawsJordan(

        //     targetRowElement: delta1Result.secoundRow,
        //     matrixRows: [delta1Result.firstRow, secoundRow, thirdRow]);
        // final MatrixRows delta3Result = doGawsJordan(
        //     targetRowElement: thirdRow,
        //     matrixRows: [firstRow, secoundRow, thirdRow]);

        final ResultMatrixToShow resultMatrixToShow = ResultMatrixToShow(
          delta1: delta1Result[0],
          // delta3: delta3Reslt,,
        );
        emit(HomeSuccess2(resultMatrixToShow: resultMatrixToShow));
      } else if (event is Calculate3BottonClicked) {
        final FirstRow firstRow1 = FirstRow(
          x11: event.x11,
          x12: event.x12,
          x13: event.x13,
          e1: event.e1Result,
        );
        final SecoundRow secoundRow1 = SecoundRow(
          x21: event.x21,
          x22: event.x22,
          x23: event.x23,
          e2: event.e2Result,
        );

        final ThirdRow thirdRow1 = ThirdRow(
          x31: event.x31,
          x32: event.x32,
          x33: event.x33,
          e3: event.e3Result,
        );

        bool isFirstElementIs1 = true;
        double? x11ValueSecound;
        double? x12ValueSecound;
        double? x13ValueSecound;
        double? x21ValueSecound;
        double? x22ValueSecound;
        double? x23ValueSecound;
        double? x31ValueSecound;
        double? x32ValueSecound;
        double? x33ValueSecound;
        double? e1ResultValueSecound;
        double? e2ResultValueSecound;
        double? e3ResultValueSecound;
        double? x11ValueThird;
        double? x12ValueThird;
        double? x13ValueThird;
        double? x21ValueThird;
        double? x22ValueThird;
        double? x23ValueThird;
        double? x31ValueThird;
        double? x32ValueThird;
        double? x33ValueThird;
        double? e1ResultValueThird;
        double? e2ResultValueThird;
        double? e3ResultValueThird;
        final MatrixRows firstDeltaResult = MatrixRows(
            firstRow: firstRow1, secoundRow: secoundRow1, thirdRow: thirdRow1);
        final MatrixRows secoundDeltaResult = MatrixRows(
            firstRow: firstRow1, secoundRow: secoundRow1, thirdRow: thirdRow1);
        final MatrixRows thirdDeltaResult = MatrixRows(
            firstRow: firstRow1, secoundRow: secoundRow1, thirdRow: thirdRow1);

        final List<MatrixRows> delta1Result = doGawsJordan(
            levelNumber: 3,
            secoundDeltaResult: secoundDeltaResult,
            thirdDeltaResult: thirdDeltaResult,
            firstDeltaResult: firstDeltaResult,
            targetRowElement: thirdRow1,
            matrixRows: [firstRow1, secoundRow1, thirdRow1]);

        // final MatrixRows delta2Result = doGawsJordan(

        //     targetRowElement: delta1Result.secoundRow,
        //     matrixRows: [delta1Result.firstRow, secoundRow, thirdRow]);
        // final MatrixRows delta3Result = doGawsJordan(
        //     targetRowElement: thirdRow,
        //     matrixRows: [firstRow, secoundRow, thirdRow]);

        final ResultMatrixToShow resultMatrixToShow = ResultMatrixToShow(
          delta1: delta1Result[0],
          // delta3: delta3Reslt,,
        );
        emit(HomeSuccess3(resultMatrixToShow: resultMatrixToShow));
      }
    });
  }
}

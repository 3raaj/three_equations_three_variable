import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraction/fraction.dart';

import 'bloc/home_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController x11 = TextEditingController(text: '1');

  final TextEditingController x12 = TextEditingController(text: '1');
  final TextEditingController x13 = TextEditingController(text: '1');
  final TextEditingController x21 = TextEditingController(text: '2');
  final TextEditingController x22 = TextEditingController(text: '3');
  final TextEditingController x23 = TextEditingController(text: '1');
  final TextEditingController x31 = TextEditingController(text: '1');
  final TextEditingController x32 = TextEditingController(text: '-1');
  final TextEditingController x33 = TextEditingController(text: '-2');
  final TextEditingController e1Result = TextEditingController(text: '2');
  final TextEditingController e2Result = TextEditingController(text: '3');
  final TextEditingController e3Result = TextEditingController(text: '-6');
  bool isFirstPage = true;
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        homeBloc.add(HomeStarted());

        return homeBloc;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('روش گاوس جردن '),
              actions: [
                GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              ' استاد ، حالت هایی که قطر صفر شود را تعریف نکرده ام  ولی آپدیت خواهم کردومحاسبه پارامتری را هم اضافه می کنم',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                      ),
                            ),
                          ),
                        ],
                      )));
                    },
                    child: Icon(Icons.info_rounded)),
                SizedBox(
                  width: 12,
                ),
              ],
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  lineElement(
                      state: state,
                      e1Result: e1Result,
                      e2Result: e2Result,
                      e3Result: e3Result,
                      x11: x11,
                      x12: x12,
                      x13: x13,
                      x21: x21,
                      x22: x22,
                      x23: x23,
                      x31: x31,
                      x32: x32,
                      x33: x33),
                ],
              ),
            ),
            floatingActionButton: state is WatingForComlete
                ? FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'محاسبه دلتا 1 ',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Icon(
                              Icons.calculate,
                              size: 20,
                            )),
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      if (x11.text == '0' ||
                          x22.text == '0' ||
                          x33.text == '0') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                ' استاد ، حالت هایی که قطر صفر شود را تعریف نکرده ام  ولی آپدیت خواهم کردومحاسبه پارامتری را هم اضافه می کنم',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        )));
                      } else {
                        homeBloc.add(
                          CalculateBottonClicked(
                            x11: x11,
                            x12: x12,
                            x13: x13,
                            x21: x21,
                            x22: x22,
                            x23: x23,
                            x31: x31,
                            x32: x32,
                            x33: x33,
                            e1Result: e1Result,
                            e2Result: e2Result,
                            e3Result: e3Result,
                          ),
                        );
                      }
                    },
                    tooltip: 'محاسبه ',
                  )
                : FloatingActionButton(
                    child: Center(
                      child: Icon(Icons.refresh),
                    ),
                    onPressed: () {
                      homeBloc.add(RefreshBottonClicked());
                    }), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }

  Widget lineElement({
    required TextEditingController x11,
    required TextEditingController x12,
    required TextEditingController x13,
    required TextEditingController x21,
    required TextEditingController x22,
    required TextEditingController x23,
    required TextEditingController x31,
    required TextEditingController x32,
    required TextEditingController x33,
    required TextEditingController e1Result,
    required TextEditingController e2Result,
    required TextEditingController e3Result,
    required HomeState state,
  }) {
    if (state is WatingForComlete) {
      return Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Text('استاد ابراهیم اکبربگلو (جبرخطی)  '),
          SizedBox(
            height: 12,
          ),
          Text(
            'دانشجو : علی خیری | 9921812086',
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  controller: x11,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('X +'),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  controller: x12,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('Y +'),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: x13,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('Z '),
              SizedBox(
                width: 4,
              ),
              Text(' = '),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: e1Result,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  controller: x21,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('X +'),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  controller: x22,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('Y +'),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: x23,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('Z '),
              SizedBox(
                width: 4,
              ),
              Text(' = '),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: e2Result,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  controller: x31,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('X +'),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  controller: x32,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('Y +'),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: x33,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text('Z '),
              SizedBox(
                width: 4,
              ),
              Text(' = '),
              Container(
                width: 40,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: e3Result,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          // TextButton.icon(
          //   clipBehavior: Clip.antiAlias,
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          //     fixedSize: MaterialStateProperty.all(Size.fromWidth(MediaQuery.of(context).size.width*0.7),),
          //   ),
          //     onPressed: () {

          //     },
          //     icon: Icon(Icons.check),
          //     label: Text('محاسبه'))
        ],
      );
    } else if (state is HomeSuccess ||
        state is HomeSuccess2 ||
        state is HomeSuccess3) {
      final bool isErrorinHomeSuccess3 = state is HomeSuccess3 &&
              state.resultMatrixToShow.delta1.firstRow.x11 == 0 ||
          state is HomeSuccess3 &&
              state.resultMatrixToShow.delta1.secoundRow.x22 == 0 ||
          state is HomeSuccess3 &&
              state.resultMatrixToShow.delta1.thirdRow.x33 == 0;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         keyboardType: TextInputType.number,
          //         controller: x11,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X1 +'),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         keyboardType: TextInputType.number,
          //         controller: x12,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X2 +'),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         controller: x13,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X3 '),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text(' = '),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         controller: e1Result,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 45,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         keyboardType: TextInputType.number,
          //         controller: x21,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X1 +'),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         keyboardType: TextInputType.number,
          //         controller: x22,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X2 +'),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         controller: x23,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X3 '),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text(' = '),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         controller: e2Result,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 45,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         keyboardType: TextInputType.number,
          //         controller: x31,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X1 +'),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         keyboardType: TextInputType.number,
          //         controller: x32,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X2 +'),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         controller: x33,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text('X3 '),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Text(' = '),
          //     Container(
          //       width: 40,
          //       child: TextField(
          //         controller: e3Result,
          //         keyboardType: TextInputType.number,
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 12,
          ),
          Text(state is HomeSuccess
              ? ' (Δ۰) مرحله اول '
              : state is HomeSuccess2
                  ? '(Δ1) مرحله دوم'
                  : '(Δ3) مرحله سوم'),
          Text(state is HomeSuccess3 &&
                      state.resultMatrixToShow.delta1.firstRow.x11 == 0 ||
                  state is HomeSuccess3 &&
                      state.resultMatrixToShow.delta1.secoundRow.x22 == 0 ||
                  state is HomeSuccess3 &&
                      state.resultMatrixToShow.delta1.thirdRow.x33 == 0
              ? 'استاد برای این حالت که یکی از المان های قطر صفر باشد کد ننوشته ام و تکمیل خواهم کرد'
              : ''),

          SizedBox(
            height: 12,
          ),
          state is HomeSuccess
              ? firstMatrix(
                  isSuccess3: false,
                  context: context,
                  x11: state.resultMatrixToShow.delta1.firstRow.x11,
                  x12: state.resultMatrixToShow.delta1.firstRow.x12,
                  x13: state.resultMatrixToShow.delta1.firstRow.x13,
                  x21: state.resultMatrixToShow.delta1.secoundRow.x21,
                  x22: state.resultMatrixToShow.delta1.secoundRow.x22,
                  x23: state.resultMatrixToShow.delta1.secoundRow.x23,
                  x31: state.resultMatrixToShow.delta1.thirdRow.x31,
                  x32: state.resultMatrixToShow.delta1.thirdRow.x32,
                  x33: state.resultMatrixToShow.delta1.thirdRow.x33,
                  e1: state.resultMatrixToShow.delta1.firstRow.e1,
                  e2: state.resultMatrixToShow.delta1.secoundRow.e2,
                  e3: state.resultMatrixToShow.delta1.thirdRow.e3,
                )
              : SizedBox(
                  height: 15,
                ),
          state is HomeSuccess2
              ? firstMatrix(
                  isSuccess3: false,
                  context: context,
                  x11: state.resultMatrixToShow.delta1.firstRow.x11,
                  x12: state.resultMatrixToShow.delta1.firstRow.x12,
                  x13: state.resultMatrixToShow.delta1.firstRow.x13,
                  x21: state.resultMatrixToShow.delta1.secoundRow.x21,
                  x22: state.resultMatrixToShow.delta1.secoundRow.x22,
                  x23: state.resultMatrixToShow.delta1.secoundRow.x23,
                  x31: state.resultMatrixToShow.delta1.thirdRow.x31,
                  x32: state.resultMatrixToShow.delta1.thirdRow.x32,
                  x33: state.resultMatrixToShow.delta1.thirdRow.x33,
                  e1: state.resultMatrixToShow.delta1.firstRow.e1,
                  e2: state.resultMatrixToShow.delta1.secoundRow.e2,
                  e3: state.resultMatrixToShow.delta1.thirdRow.e3,
                )
              : SizedBox(
                  height: 12,
                ),
          state is HomeSuccess3
              ? firstMatrix(
                  isSuccess3: true,
                  context: context,
                  x11: state.resultMatrixToShow.delta1.firstRow.x11,
                  x12: state.resultMatrixToShow.delta1.firstRow.x12,
                  x13: state.resultMatrixToShow.delta1.firstRow.x13,
                  x21: state.resultMatrixToShow.delta1.secoundRow.x21,
                  x22: state.resultMatrixToShow.delta1.secoundRow.x22,
                  x23: state.resultMatrixToShow.delta1.secoundRow.x23,
                  x31: state.resultMatrixToShow.delta1.thirdRow.x31,
                  x32: state.resultMatrixToShow.delta1.thirdRow.x32,
                  x33: state.resultMatrixToShow.delta1.thirdRow.x33,
                  e1: state.resultMatrixToShow.delta1.firstRow.e1,
                  e2: state.resultMatrixToShow.delta1.secoundRow.e2,
                  e3: state.resultMatrixToShow.delta1.thirdRow.e3,
                )
              : SizedBox(
                  height: 12,
                ),
          if (state is HomeSuccess || state is HomeSuccess2)
            IconButton(
              iconSize: 32,
              color: Colors.white,
              tooltip: 'محاسبه دلتای بعدی',
              onPressed: () {
                if (state is HomeSuccess) {
                  homeBloc.add(Calculate2BottonClicked(
                    x11: state.resultMatrixToShow.delta1.firstRow.x11,
                    x12: state.resultMatrixToShow.delta1.firstRow.x12,
                    x13: state.resultMatrixToShow.delta1.firstRow.x13,
                    e1Result: state.resultMatrixToShow.delta1.firstRow.e1,
                    x21: state.resultMatrixToShow.delta1.secoundRow.x21,
                    x22: state.resultMatrixToShow.delta1.secoundRow.x22,
                    x23: state.resultMatrixToShow.delta1.secoundRow.x23,
                    e2Result: state.resultMatrixToShow.delta1.secoundRow.e2,
                    x31: state.resultMatrixToShow.delta1.thirdRow.x31,
                    x32: state.resultMatrixToShow.delta1.thirdRow.x32,
                    x33: state.resultMatrixToShow.delta1.thirdRow.x33,
                    e3Result: state.resultMatrixToShow.delta1.thirdRow.e3,
                  ));
                } else if (state is HomeSuccess2) {
                  homeBloc.add(Calculate3BottonClicked(
                    x11: state.resultMatrixToShow.delta1.firstRow.x11,
                    x12: state.resultMatrixToShow.delta1.firstRow.x12,
                    x13: state.resultMatrixToShow.delta1.firstRow.x13,
                    e1Result: state.resultMatrixToShow.delta1.firstRow.e1,
                    x21: state.resultMatrixToShow.delta1.secoundRow.x21,
                    x22: state.resultMatrixToShow.delta1.secoundRow.x22,
                    x23: state.resultMatrixToShow.delta1.secoundRow.x23,
                    e2Result: state.resultMatrixToShow.delta1.secoundRow.e2,
                    x31: state.resultMatrixToShow.delta1.thirdRow.x31,
                    x32: state.resultMatrixToShow.delta1.thirdRow.x32,
                    x33: state.resultMatrixToShow.delta1.thirdRow.x33,
                    e3Result: state.resultMatrixToShow.delta1.thirdRow.e3,
                  ));
                }
              },
              icon: Container(
                  width: 85,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.arrow_downward_rounded)),
            )
          else
            SizedBox(
              height: 12,
            ),

          SizedBox(
            height: 12,
          ),
          // secoundMatrix(
          //   isFirstElementIs1: true,
          //   x11: state.resultMatrixToShow.delta2.firstRow.x11,
          //   x12: state.resultMatrixToShow.delta2.firstRow.x12,
          //   x13: state.resultMatrixToShow.delta2.firstRow.x13,
          //   x21: state.resultMatrixToShow.delta2.secoundRow.x21,
          //   x22: state.resultMatrixToShow.delta2.secoundRow.x22,
          //   x23: state.resultMatrixToShow.delta2.secoundRow.x23,
          //   x31: state.resultMatrixToShow.delta2.thirdRow.x31,
          //   x32: state.resultMatrixToShow.delta2.thirdRow.x32,
          //   x33: state.resultMatrixToShow.delta2.thirdRow.x33,
          //   e1: state.resultMatrixToShow.delta2.firstRow.e1,
          //   e2: state.resultMatrixToShow.delta2.secoundRow.e2,
          //   e3: state.resultMatrixToShow.delta2.thirdRow.e3,
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          // secoundMatrix(
          //   isFirstElementIs1: true,
          //   x11: state.resultMatrixToShow.delta3.firstRow.x11,
          //   x12: state.resultMatrixToShow.delta3.firstRow.x12,
          //   x13: state.resultMatrixToShow.delta3.firstRow.x13,
          //   x21: state.resultMatrixToShow.delta3.secoundRow.x21,
          //   x22: state.resultMatrixToShow.delta3.secoundRow.x22,
          //   x23: state.resultMatrixToShow.delta3.secoundRow.x23,
          //   x31: state.resultMatrixToShow.delta3.thirdRow.x31,
          //   x32: state.resultMatrixToShow.delta3.thirdRow.x32,
          //   x33: state.resultMatrixToShow.delta3.thirdRow.x33,
          //   e1: state.resultMatrixToShow.delta3.firstRow.e1,
          //   e2: state.resultMatrixToShow.delta3.secoundRow.e2,
          //   e3: state.resultMatrixToShow.delta3.thirdRow.e3,
          // )
          !isErrorinHomeSuccess3 && state is HomeSuccess3
              ? Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: Text('نتیجه ی نهایی'),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'X =  ${state.resultMatrixToShow.delta1.firstRow.e1.toFraction().toString()}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32, right: 32),
                      child: Divider(
                        indent: 5,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Y  =  ${state.resultMatrixToShow.delta1.secoundRow.e2.toFraction().toString()}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32, right: 32),
                      child: Divider(
                        indent: 5,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Z =  ${state.resultMatrixToShow.delta1.thirdRow.e3.toFraction().toString()}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                )
              : SizedBox(),
        ],
      );
    } else {
      return Column(
        children: [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      );
    }
  }

  Center firstMatrix({
    required double x11,
    required double x12,
    required double x13,
    required double x21,
    required double x22,
    required double x23,
    required double x31,
    required double x32,
    required double x33,
    required double e1,
    required double e2,
    required double e3,
    required BuildContext context,
    required bool isSuccess3,
  }) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black)),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(x11.toFraction().toString()),
                    Text(x12.toFraction().toString()),
                    Text(x13.toFraction().toString()),
                    Text(e1.toFraction().toString(),
                        style: isSuccess3
                            ? Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Colors.red,
                                )
                            : Theme.of(context).textTheme.bodyText2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(x21.toFraction().toString()),
                    Text(x22.toFraction().toString()),
                    Text(x23.toFraction().toString()),
                    Text(e2.toFraction().toString(),
                        style: isSuccess3
                            ? Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Colors.red,
                                )
                            : Theme.of(context).textTheme.bodyText2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(x31.toFraction().toString()),
                    Text(x32.toFraction().toString()),
                    Text(x33.toFraction().toString()),
                    Text(e3.toFraction().toString(),
                        style: isSuccess3
                            ? Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Colors.red,
                                )
                            : Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Stack secoundMatrix({
    required String x11,
    required String x12,
    required String x13,
    required String x21,
    required String x22,
    required String x23,
    required String x31,
    required String x32,
    required String x33,
    required String e1,
    required String e2,
    required String e3,
    required bool isFirstElementIs1,
  }) {
    final TextStyle isChangedTextStyle =
        TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
    final TextStyle sameTextStyle = TextStyle();
    TextStyle textStyle =
        isFirstElementIs1 ? sameTextStyle : isChangedTextStyle;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(x11, style: textStyle),
                  Text(x12, style: textStyle),
                  Text(x13, style: textStyle),
                  Text(e1, style: textStyle),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(x21, style: isChangedTextStyle),
                  Text(x22, style: isChangedTextStyle),
                  Text(x23, style: isChangedTextStyle),
                  Text(e2, style: isChangedTextStyle),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(x31, style: isChangedTextStyle),
                  Text(x32, style: isChangedTextStyle),
                  Text(x33, style: isChangedTextStyle),
                  Text(e3, style: isChangedTextStyle),
                ],
              ),
            ],
          ),
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
        ),
      ],
    );
  }
}

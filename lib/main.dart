import 'package:flutter/material.dart';
import 'package:my_application_2/gen/fonts.gen.dart';
import 'package:my_application_2/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle =
        TextStyle(fontFamily: FontFamily.yekanRegular);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'استاد اکبربگلو | گاوس جردن',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          snackBarTheme: SnackBarThemeData(contentTextStyle: defaultTextStyle),
          textTheme: TextTheme(
              bodyText2: defaultTextStyle.copyWith(
                fontSize: 16, 
                color: Colors.black,
           
              ),
              headline6: defaultTextStyle,
              headline3: defaultTextStyle.copyWith(
                fontFamily: FontFamily.yekanRegular, 
                fontSize: 20, 
                color: Colors.indigo, 
                
              ),
              bodyText1:
                  TextStyle(fontFamily: FontFamily.yekanBold, fontSize: 18),
              caption: TextStyle(
                fontFamily: FontFamily.yekanRegular,
                fontSize: 12,
              )),
          inputDecorationTheme: InputDecorationTheme(
              floatingLabelStyle: defaultTextStyle,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.5), 
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              labelStyle: TextStyle(fontFamily: FontFamily.yekanRegular),
              hintStyle: TextStyle(fontFamily: FontFamily.yekanBold),
              border: OutlineInputBorder()),
          iconTheme: IconThemeData()),
      home:
          Directionality(textDirection: TextDirection.ltr, child: MyHomePage()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/layout/new_layout.dart';
import 'package:news_app/network/remote/dio_helper.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black,size: 25),
            titleTextStyle: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
          elevation: 0
        ),
            scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.orangeAccent,
              type: BottomNavigationBarType.fixed
      )
      ),
      home: const Home(),
    );
  }

}
class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NewsLayout();
  }
}

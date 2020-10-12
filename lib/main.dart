import 'package:firebase_crud/src/bloc/provider.dart';
import 'package:firebase_crud/src/pages/home_page.dart';
import 'package:firebase_crud/src/pages/home_page_user.dart';
import 'package:firebase_crud/src/pages/insert_page.dart';
import 'package:firebase_crud/src/pages/loginPage.dart';
import 'package:firebase_crud/src/pages/modify_page.dart';
import 'package:firebase_crud/src/pages/registro_page.dart';
import 'package:firebase_crud/src/pages/view_page.dart';
import 'package:firebase_crud/src/pages/welcome_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CrudFirebase',
      initialRoute: 'login',
      routes: {
        'login'    : (BuildContext context) => LoginPage(),
        'home'     : (BuildContext context) => HomePage(),
        'homeuser' : (BuildContext context) => HomePageUser(),
        'welcome'  : (BuildContext context) => WelcomePage(),
        'registro' : (BuildContext context) => RegistroPage(),
        'view'     : (BuildContext context) => ViewPage(),
        'insert'   : (BuildContext context) => InsertPage(),
        'modify'   : (BuildContext context) => ModifyPage(),
        

      },
      
    )
  );
  }
}
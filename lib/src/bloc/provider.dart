

import 'package:firebase_crud/src/bloc/login_bloc.dart';
export 'package:firebase_crud/src/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Provider extends InheritedWidget{
  
  static Provider _instancia;

  factory Provider ({Key key, Widget child}){
    if (_instancia == null) {
      _instancia=new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child})
  : super (key: key, child: child);
  
  final loginBloc = LoginBloc();
  /*
  Provider({Key key, Widget child})
  : super (key: key, child: child);
*/
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
    
    static LoginBloc of (BuildContext context){
      return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
    
  }

  
  
}
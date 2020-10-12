
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:firebase_crud/src/bloc/validator.dart';

class LoginBloc with Validator{
  final _controllerEmail    = BehaviorSubject<String>();
  final _controllerPassword = BehaviorSubject<String>(); 

  //Insertar valores 
  Function(String) get changeEmail    => _controllerEmail.sink.add;
  Function(String) get changePassword => _controllerPassword.sink.add; 

  //CombinarStream
  Stream<bool> get formValidStream =>
       Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //Recuperar Datos 

  Stream<String> get emailStream       => _controllerEmail.stream.transform(validarEmail);
  Stream<String> get passwordStream    => _controllerPassword.stream.transform(validarPassword);

  //Cerrar

  dispose(){
    _controllerEmail?.close();
    _controllerPassword?.close();
  }
}
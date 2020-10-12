import 'dart:ui';

import 'package:firebase_crud/src/widgets/benziercontainer.dart';
import 'package:flutter/material.dart';

class ModifyPage extends StatefulWidget {

  @override
  _ModifyPageState createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondo(),
          SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40.0),
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 65.0,),
                  _crearEquipo(),
                  SizedBox(height: 65.0,),
                  _crearIntegrantes(),
                  SizedBox(height: 65.0,),
                  _crearBoton()


                ],
              )
            ),
          ),
        ),
        ],
      ) 
    );

  }
  Widget _crearEquipo(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Equipo AlfaBuenaMaravilla',
        counterText: 'Nombre de tu Equipo',
      ),
      //onSaved: (value)=> equiposModels.,
    );
  }

  Widget _crearIntegrantes(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Minimo 3 integrantes',
        counterText: 'Miembros del Equipo',
      ),
      //onSaved: ,
    );
  }

  Widget _crearBoton(){
    return RaisedButton.icon(
      onPressed: (){},
      icon: Icon(Icons.save_sharp,color: Colors.white,),
      label: Text('Guardar',style: TextStyle(color: Colors.white),),
      color: Color(0xffe46b10),
      shape: RoundedRectangleBorder() ,
    );
  }

  Widget _fondo(){
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
import 'package:firebase_crud/src/models/equipo_models.dart';
import 'package:firebase_crud/src/providers/equipos_providers.dart';
import 'package:firebase_crud/src/utils/utils.dart' as utils;
import 'package:firebase_crud/src/widgets/benziercontainer.dart';
import 'package:flutter/material.dart';

class InsertPage extends StatefulWidget {

  @override
  _InsertPageState createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {

  final formKey = GlobalKey<FormState>();
  final equiposProvider = new EquiposProvider();
  EquiposModel equiposModel= new EquiposModel();
  @override
  Widget build(BuildContext context) {
    final EquiposModel equiData=ModalRoute.of(context).settings.arguments;
    if (equiData != null) {
      equiposModel = equiData;
      
    }
    return Scaffold(
      body: Stack(
        children: [
          _fondo(),
          SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40.0),
            child: Form(
              key: formKey,
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
      initialValue: equiposModel.name,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Equipo AlfaBuenaMaravilla',
        counterText: 'Nombre de tu Equipo',
      ),
      validator: (value){
        if (value.length < 3) {
          return 'Ingrese un nombre correcto';
        }else{
          return null;
        }
      },
      onSaved: (value)=> equiposModel.name = value,
    );
  }

  Widget _crearIntegrantes(){
    return TextFormField(
      initialValue: equiposModel.nint.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Minimo 3 integrantes',
        counterText: 'Miembros del Equipo',
      ),
      validator: (value){
        if(utils.isNumeric(value)){
          return null;
        }else {
          return 'Solo numeros';
        }
      },
      onSaved: (value) => equiposModel.nint = int.parse(value),
    );
  }

  Widget _crearBoton(){
    return RaisedButton.icon(
      onPressed: (){_submit();},
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

  void _submit(){

    if (!formKey.currentState.validate()) return;
    print('Todo ok');

    formKey.currentState.save();

    if(equiposModel.id== null){
      equiposProvider.crearEquipo(equiposModel);
    }else{
      equiposProvider.editarEquipo(equiposModel);
    }

    

    print(equiposModel.name);
    print(equiposModel.nint);
  }

}

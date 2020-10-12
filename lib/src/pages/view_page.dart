import 'package:firebase_crud/src/providers/equipos_providers.dart';
import 'package:firebase_crud/src/models/equipo_models.dart';
import 'package:firebase_crud/src/widgets/benziercontainer.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final equiposProvider= new EquiposProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondo(),
          _crearlistado()
          
        ],
      ),
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

  Widget _crearlistado(){
    return FutureBuilder(
      future: equiposProvider.cargarEquipos(),
      builder: (BuildContext context,AsyncSnapshot<List<EquiposModel>>snapshot){
        if (snapshot.hasData) {
          final equipos= snapshot.data; 
          return ListView.builder(
            itemCount: equipos.length,
            itemBuilder: (context,i) => _crearItem(equipos[i],context),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(), 
          );
        }
      }
    );
  }

  Widget _crearItem(EquiposModel equiposModel,BuildContext context){
    return Dismissible( 
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed:(direction){
        equiposProvider.borrarEquipos(equiposModel.id);
      } ,
          child: ListTile(
            title: Text('${equiposModel.name}-${equiposModel.nint}'),
            subtitle: Text('${equiposModel.id}'),
            onTap: ()=> Navigator.pushNamed(context,'insert',arguments: equiposModel)
      ),
    );
  }

  

}


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_crud/src/models/equipo_models.dart';

class EquiposProvider{

  final String _url = 'https://crudfirebase-7e66c.firebaseio.com/';

  Future<bool> crearEquipo(EquiposModel equiposModel) async {
    final url ='$_url/equipos.json';

    final resp = await http.post(url,body: equiposModelToJson(equiposModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<EquiposModel>> cargarEquipos() async {
    final url ='$_url/equipos.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<EquiposModel> equipos = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, equip) { 

      final equipTemp= EquiposModel.fromJson(equip);
      equipTemp.id=id;

      equipos.add(equipTemp);

    });

    print(equipos);

    return equipos;
  }

  Future<int> borrarEquipos(String id) async {
    final url ='$_url/equipos/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarEquipo(EquiposModel equiposModel) async {
    final url ='$_url/equipos/${equiposModel.id}.json';

    final resp = await http.put(url,body: equiposModelToJson(equiposModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}
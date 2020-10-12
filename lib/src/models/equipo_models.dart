import 'dart:convert';

EquiposModel equiposModelFromJson(String str) => EquiposModel.fromJson(json.decode(str));

String equiposModelToJson(EquiposModel data) => json.encode(data.toJson());

class EquiposModel {
    EquiposModel({
        this.id,
        this.name='',
        this.nint=0,
    });

    String id;
    String name;
    int nint;

    factory EquiposModel.fromJson(Map<String, dynamic> json) => EquiposModel(
        id: json["id"],
        name: json["name"],
        nint: json["nint"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nint": nint,
    };
}

// ignore: file_names

//CONFIGURACIÓN DE LO AUE REQUERIRA CADA TARJETA DE PLANTA

class Plantas {
  final String name;
  final String cuidado;
  final String imagen;
  final String descripcion;

  Plantas({required this.name, required this.cuidado, required this.imagen, required this.descripcion});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Plantas &&
      other.name == name &&
      other.cuidado == cuidado &&
      other.imagen == imagen &&
      other.descripcion == descripcion;
  }

  @override
  int get hashCode {
    return name.hashCode ^
           cuidado.hashCode ^
           imagen.hashCode ^
           descripcion.hashCode;
  }
}
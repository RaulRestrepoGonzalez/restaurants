class Item {
  String id;
  String nombre;
  double precio;
  String unidad;
  String imagen;
  int cantidad;

  Item(
      {required this.id,
      required this.nombre,
      required this.precio,
      required this.unidad,
      required this.imagen,
      required this.cantidad});

  factory Item.map(dynamic o) {
    return Item(
        id: o['id'],
        nombre: o['nombre'],
        precio: o['precio'],
        unidad: o['unidad'],
        imagen: o['imagen'],
        cantidad: o['cantidad']);
    /*this.id = o['id'];
    this.nombre = o['nombre'];
    this.precio = o['precio'];
    this.unidad = o['unidad'];
    this.imagen = o['imagen'];
    this.cantidad = o['cantidad'];*/
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['id'] = id;
    map['nombre'] = nombre;
    map['precio'] = precio;
    map['unidad'] = unidad;
    map['imagen'] = imagen;
    map['cantidad'] = cantidad;

    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['precio'] = this.precio;
    data['unidad'] = this.unidad;
    data['imagen'] = this.imagen;
    data['cantidad'] = this.cantidad;

    return data;
  }

  Item copyWith({
    String? id,
    String? nombre,
    double? precio,
    String? unidad,
    String? imagen,
    int? cantidad,
  }) {
    return Item(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      precio: precio ?? this.precio,
      unidad: unidad ?? this.unidad,
      imagen: imagen ?? this.imagen,
      cantidad: cantidad ?? this.cantidad,
    );
  }
}

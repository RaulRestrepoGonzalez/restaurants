class cartaMap {
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;

  const cartaMap(
      {required this.id,
      required this.nombre,
      required this.precio,
      required this.imagen,
      required this.descripcion});
}

final platos = [
  new cartaMap(
      id: 1,
      nombre: 'bandeja paisa',
      precio: 45.500,
      imagen: 'Comida-típica-de-Colombia-Platos-Imprescindibles.jpg',
      descripcion:
          'Ingredientes: frijoles, arroz blanco, chicharrón, carne en polvo, chorizo, huevo frito, plátano maduro, aguacate y arepa'),
  new cartaMap(
      id: 2,
      nombre: 'hamburguesa',
      precio: 15.000,
      imagen: 'comida-rapida-casera.jpg',
      descripcion:
          'Ingredientes: carne parrilla, queso, tocino, lechuga, tomate y mayonesa'),
  new cartaMap(
      id: 3,
      nombre: 'pastas',
      precio: 27.500,
      imagen: 'Recetas-de-comidas-para-niños.jpg',
      descripcion:
          'Ingredientes: pastas preparadas, queso parmesano, queso crema y leche'),
  new cartaMap(
      id: 4,
      nombre: 'carne guisada',
      precio: 35.800,
      imagen: 'cocina-tradicional-calidad.jpg',
      descripcion:
          'Ingredientes: carne de lomo de res, canela, tomillo, pimienta, hoja de laurel, pan frances y papa'),
];

final bebidas = [
  new cartaMap(
      id: 5,
      nombre: 'limonada',
      precio: 18.000,
      imagen: 'limon.jpg',
      descripcion:
          'Ingredientes: limon mas el añadido elegido por el cliente (cereza, coco, vodka)'),
  new cartaMap(
      id: 6,
      nombre: 'jugo de naranja',
      precio: 18.000,
      imagen: 'jugoN.jpg',
      descripcion:
          'Ingredientes: sumo de naranja exprimido el añadido elegido por el cliente (cereza, fresa, vodka)'),
  new cartaMap(
      id: 7,
      nombre: 'coctel sin alcohol',
      precio: 25.000,
      imagen: 'cocktail-3327242_1920-1170x780.jpg',
      descripcion: 'Ingredientes: fruta t tipo de soda a eleccion del cliente'),
];

final postres = [
  new cartaMap(
      id: 8,
      nombre: 'noche nevada',
      precio: 45.000,
      imagen: 'nochenevada.jpg',
      descripcion:
          'Ingredientes: helado de vainilla, frutos rojos y crema batida'),
  new cartaMap(
      id: 9,
      nombre: 'flan con galletas y chocolate',
      precio: 63.000,
      imagen:
          'paso_a_paso_para_realizar_tarta_de_flan_con_galletas_y_chocolate_sin_azucar_resultado_final_1ce8842f_600x600.jpg',
      descripcion:
          'Ingredientes: galletas, flan, chocolate fundido y crema batida'),
  new cartaMap(
      id: 10,
      nombre: 'gelatina',
      precio: 25.000,
      imagen: 'gelatina.jpg',
      descripcion: 'Ingredientes: sabor al gusto del cliente'),
];

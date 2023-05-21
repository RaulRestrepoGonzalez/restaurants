import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurants/carrito/carrito.dart';

import 'package:restaurants/main.dart';
import 'package:restaurants/models/cartaMap.dart';
import 'package:restaurants/models/item.dart';

void main() {
  testWidgets('Añadir al carrrito', (WidgetTester tester) async {
    final carrito = Carrito();
    final carta = cartaMap(
        id: 1,
        nombre: 'bandeja paisa',
        precio: 45.500,
        imagen: 'Comida-típica-de-Colombia-Platos-Imprescindibles.jpg',
        descripcion: 'preparado...');

    //carrito.agregarItem(Item(carta), 1);
    //carrito.agregarItem(producto_id, nombre, precio, unidad, imagen, cantidad)
    carrito.items == carta;

    expect(carrito.incrementarCatidadItem.toString(), 1);
  });

  test('Eliminar del carrito', () {
    final carrito = Carrito();
    final carta = cartaMap(
        id: 1,
        nombre: 'bandeja paisa',
        precio: 45.500,
        imagen: 'Comida-típica-de-Colombia-Platos-Imprescindibles.jpg',
        descripcion: 'preparado...');

    //carrito.agregarItem(producto_id, nombre, precio, unidad, imagen, cantidad);
    //carrito.decrementarCantidadItem(carta);

    expect(carrito.removerItem, 1);
  });

  test('Error carrito', () {
    final carrito = Carrito();

    carrito.items == null;
  });
}

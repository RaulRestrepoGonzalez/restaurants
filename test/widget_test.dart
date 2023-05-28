import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurants/carrito/carrito.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurants/main.dart';
import 'package:restaurants/models/cartaMap.dart';
import 'package:restaurants/models/item.dart';

class MockItem extends Mock implements Item {}

void main() {
  /*testWidgets('Añadir al carrrito', (WidgetTester tester) async {
    final carrito = Carrito();
    final item1 = Item(
        id: '1',
        nombre: 'bandeja paisa',
        precio: 45.500,
        unidad: '1',
        imagen: 'Comida-típica-de-Colombia-Platos-Imprescindibles.jpg',
        cantidad: 1);

    carrito.agregarItem(
      item1.id,
      item1.nombre,
      item1.precio,
      item1.unidad,
      item1.imagen,
      item1.cantidad,
    ); 

    //carrito.agregarItem(Item(carta), 1);
    //carrito.agregarItem(producto_id, nombre, precio, unidad, imagen, cantidad)
    
    expect(carrito.incrementarCatidadItem, 1);
  });*/

  test('Añadir carrito', () {
    final carrito = Carrito();
    final item1 = Item(
      id: '1',
      nombre: 'bandeja paisa',
      precio: 45.500,
      unidad: '1',
      imagen: 'Comida-típica-de-Colombia-Platos-Imprescindibles.jpg',
      cantidad: 1,
    );

    carrito.agregarItem2(
      item1.id,
      item1.nombre,
      item1.precio,
      item1.unidad,
      item1.imagen,
      item1.cantidad,
    ); // Agrega el item1 al carrito

    expect(carrito.items.length,
        equals(1)); // Verifica que el carrito tenga 1 item
    expect(carrito.items.values.first.nombre,
        equals('bandeja paisa')); // Verifica el nombre del item agregado
    expect(carrito.items.values.first.precio,
        equals(45.500)); // Verifica el precio del item agregado
    expect(carrito.items.values.first.cantidad,
        equals(1)); // Verifica la cantidad del item agregado

    carrito.incrementarCantidadItem2(
        item1.id); // Incrementa la cantidad del item1 en 1

    expect(carrito.items.values.first.cantidad,
        2); // Verifica que la cantidad del item1 sea 2
  });

  test('Eliminar del carrito', () {
    final carrito = Carrito();
    final item1 = Item(
      id: '1',
      nombre: 'bandeja paisa',
      precio: 45.500,
      unidad: '1',
      imagen: 'Comida-típica-de-Colombia-Platos-Imprescindibles.jpg',
      cantidad: 1,
    );

    // carrito.agregarItem(item1); // Comentamos esta línea para simular un carrito vacío
    expect(carrito.items.length, 0); // Verifica que el carrito esté vacío

    carrito.decrementarCantidadItem(
        item1.id); // Decrementa la cantidad del item1 en 1

    expect(
        carrito.items.length, 0); // Verifica que el carrito siga estando vacío
  });

  test('Error carrito', () {
    final carrito = Carrito();

    carrito.items == null;
  });

  /*----------Pruebas de integracion ascendente y descendente-------------*/
  test('Prueba de integración ascendente - Carrito', () {
    // Crear una instancia del carrito
    final carrito = Carrito();

    // Crear una instancia mock de Item
    final mockItem = MockItem();

    // Configurar el comportamiento del mock
    when(mockItem.id).thenReturn('1');
    when(mockItem.nombre).thenReturn('bandeja paisa');
    when(mockItem.precio).thenReturn(45.500);
    when(mockItem.unidad).thenReturn('1');
    when(mockItem.imagen)
        .thenReturn('Comida-típica-de-Colombia-Platos-Imprescindibles.jpg');
    when(mockItem.cantidad).thenReturn(1);

    // Verificar que el carrito esté vacío inicialmente
    expect(carrito.items.length, equals(0));
    expect(carrito.numeroItems, equals(0));
    expect(carrito.subTotal, equals(0.0));
    expect(carrito.impuesto, equals(0.0));
    expect(carrito.total, equals(0.0));

    // Agregar el mockItem al carrito
    carrito.agregarItem2(
      mockItem.id,
      mockItem.nombre,
      mockItem.precio,
      mockItem.unidad,
      mockItem.imagen,
      mockItem.cantidad,
    );

    // Verificar que el item se agregó correctamente al carrito
    expect(carrito.items.length, equals(1));
    expect(carrito.items.values.first.nombre, equals('bandeja paisa'));
    expect(carrito.items.values.first.precio, equals(45.500));
    expect(carrito.items.values.first.cantidad, equals(1));
    expect(carrito.numeroItems, equals(1));
    expect(carrito.subTotal, equals(45.500));
    expect(carrito.impuesto, equals(8.19));
    expect(carrito.total, equals(53.690));

    // Incrementar la cantidad del item en el carrito
    carrito.incrementarCantidadItem2(mockItem.id);

    // Verificar que la cantidad del item se incrementó correctamente
    expect(carrito.items.values.first.cantidad, equals(2));
    expect(carrito.numeroItems, equals(2));
    expect(carrito.subTotal, equals(91.000));
    expect(carrito.impuesto, equals(16.38));
    expect(carrito.total, equals(107.380));

    // Remover el item del carrito
    carrito.removerItem(mockItem.id);

    // Verificar que el item se removió correctamente del carrito
    expect(carrito.items.length, equals(0));
    expect(carrito.numeroItems, equals(0));
    expect(carrito.subTotal, equals(0.0));
    expect(carrito.impuesto, equals(0.0));
    expect(carrito.total, equals(0.0));
  });

  test('Prueba de integración descendente - Carrito', () {
    // Crear una instancia mock de Item
    final mockItem = MockItem();

    // Configurar el comportamiento del mock
    when(mockItem.id).thenReturn('1');
    when(mockItem.nombre).thenReturn('bandeja paisa');
    when(mockItem.precio).thenReturn(45.500);
    when(mockItem.unidad).thenReturn('1');
    when(mockItem.imagen)
        .thenReturn('Comida-típica-de-Colombia-Platos-Imprescindibles.jpg');
    when(mockItem.cantidad).thenReturn(1);

    // Crear una instancia del carrito
    final carrito = Carrito();

    // Agregar el mockItem al carrito
    carrito.agregarItem2(
      mockItem.id,
      mockItem.nombre,
      mockItem.precio,
      mockItem.unidad,
      mockItem.imagen,
      mockItem.cantidad,
    );

    // Verificar que el item se agregó correctamente al carrito
    expect(carrito.items.length, equals(1));
    expect(carrito.items.values.first.nombre, equals('bandeja paisa'));
    expect(carrito.items.values.first.precio, equals(45.500));
    expect(carrito.items.values.first.cantidad, equals(1));
    expect(carrito.numeroItems, equals(1));
    expect(carrito.subTotal, equals(45.500));
    expect(carrito.impuesto, equals(8.19));
    expect(carrito.total, equals(53.690));

    // Incrementar la cantidad del item en el carrito
    carrito.incrementarCantidadItem2(mockItem.id);

    // Verificar que la cantidad del item se incrementó correctamente
    expect(carrito.items.values.first.cantidad, equals(2));
    expect(carrito.numeroItems, equals(2));
    expect(carrito.subTotal, equals(91.000));
    expect(carrito.impuesto, equals(16.38));
    expect(carrito.total, equals(107.380));

    // Remover el item del carrito
    carrito.removerItem(mockItem.id);

    // Verificar que el item se removió correctamente del carrito
    expect(carrito.items.length, equals(0));
    expect(carrito.numeroItems, equals(0));
    expect(carrito.subTotal, equals(0.0));
    expect(carrito.impuesto, equals(0.0));
    expect(carrito.total, equals(0.0));
  });
}

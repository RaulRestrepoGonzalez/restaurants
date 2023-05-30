import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurants/carrito/carrito.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurants/main.dart';
import 'package:restaurants/models/cartaMap.dart';
import 'package:restaurants/models/item.dart';
import 'package:mockito/annotations.dart';

class MockItem extends Mock implements Item {}

void main() {
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
  test('Prueba de integración ascendente para el Carrito', () {
    final carrito = Carrito();

    // Agregar un item al carrito
    carrito.agregarItem(
      '1',
      'Producto 1',
      10.0,
      'Unidad',
      'imagen1.jpg',
      1,
    );

    // Verificar que el item se haya agregado correctamente
    expect(carrito.items.length, equals(1));
    expect(carrito.items['1'], isNotNull);

    // Incrementar la cantidad de un item en el carrito
    carrito.incrementarCatidadItem('1');

    // Verificar que la cantidad del item se haya incrementado correctamente
    expect(carrito.items['1']!.cantidad, equals(2));

    // Remover un item del carrito
    carrito.removerItem('1');

    // Verificar que el item se haya removido correctamente
    expect(carrito.items.length, equals(0));
  });

  //descendente
  group('Carrito', () {
    test('agregarItem debería agregar un elemento al carrito', () {
      final carrito = Carrito();
      final item = Item(
        id: '1',
        nombre: 'Bandeja paisa',
        precio: 45.500,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 1,
      );

      carrito.agregarItem(
        item.id,
        item.nombre,
        item.precio,
        item.unidad,
        item.imagen,
        item.cantidad,
      );

      expect(carrito.items.length, 1);
      expect(carrito.items.containsKey(item.id), true);
      expect(carrito.items[item.id].toString(), item.toString());
    });

    test('removerItem debería eliminar un elemento del carrito', () {
      final carrito = Carrito();
      final item = Item(
        id: '1',
        nombre: 'Bandeja paisa',
        precio: 45.500,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 1,
      );

      carrito.agregarItem(
        item.id,
        item.nombre,
        item.precio,
        item.unidad,
        item.imagen,
        item.cantidad,
      );

      carrito.removerItem(item.id);

      expect(carrito.items.length, 0);
      expect(carrito.items.containsKey(item.id), false);
    });
    test(
        'decrementarCantidadItem debería disminuir la cantidad de un elemento en el carrito',
        () {
      final carrito = Carrito();
      final item = Item(
        id: '1',
        nombre: 'Bandeja paisa',
        precio: 45.500,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 2,
      );

      carrito.agregarItem2(
        item.id,
        item.nombre,
        item.precio,
        item.unidad,
        item.imagen,
        item.cantidad,
      );

      carrito.decrementarCantidadItem2(item.id);

      final carritoItem = carrito.items[item.id];
      final cantidadEsperada = item.cantidad - 1;
      expect(carritoItem?.cantidad, equals(cantidadEsperada));
    });

    test(
        'incrementarCantidadItem debería aumentar la cantidad de un elemento en el carrito',
        () {
      final carrito = Carrito();
      final item = Item(
        id: '1',
        nombre: 'Bandeja paisa',
        precio: 45.500,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 2,
      );

      carrito.agregarItem(
        item.id,
        item.nombre,
        item.precio,
        item.unidad,
        item.imagen,
        item.cantidad,
      );

      carrito.incrementarCantidadItem2(item.id);

      expect(carrito.items[item.id]!.cantidad, 2);
    });

    test('subTotal debería calcular el subtotal correctamente', () {
      final carrito = Carrito();
      final item1 = Item(
        id: '1',
        nombre: 'Bandeja paisa',
        precio: 45.500,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 2,
      );
      final item2 = Item(
        id: '2',
        nombre: 'Hamburguesa',
        precio: 15.000,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 3,
      );

      carrito.agregarItem2(
        item1.id,
        item1.nombre,
        item1.precio,
        item1.unidad,
        item1.imagen,
        item1.cantidad,
      );
      carrito.agregarItem2(
        item2.id,
        item2.nombre,
        item2.precio,
        item2.unidad,
        item2.imagen,
        item2.cantidad,
      );

      final expectedSubTotal =
          (item1.precio * item1.cantidad) + (item2.precio * item2.cantidad);
      expect(carrito.subTotal, expectedSubTotal);
    });

    test('impuesto debería calcular el impuesto correctamente', () {
      final carrito = Carrito();
      final item = Item(
        id: '1',
        nombre: 'Bandeja paisa',
        precio: 45.500,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 1,
      );

      carrito.agregarItem(
        item.id,
        item.nombre,
        item.precio,
        item.unidad,
        item.imagen,
        item.cantidad,
      );

      final expectedImpuesto = carrito.subTotal * 0.18;
      expect(carrito.impuesto, expectedImpuesto);
    });

    test('total debería calcular el total correctamente', () {
      final carrito = Carrito();
      final item = Item(
        id: '1',
        nombre: 'Bandeja paisa',
        precio: 45.500,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 2,
      );

      carrito.agregarItem(
        item.id,
        item.nombre,
        item.precio,
        item.unidad,
        item.imagen,
        item.cantidad,
      );

      final expectedTotal = carrito.subTotal * 1.18;
      expect(carrito.total, expectedTotal);
    });

    test('carrito debería vaciar el carrito', () {
      final carrito = Carrito();
      final item = Item(
        id: '1',
        nombre: 'Bandeja paisa',
        precio: 45.500,
        unidad: 'unidad',
        imagen: 'imagen.jpg',
        cantidad: 1,
      );

      carrito.agregarItem(
        item.id,
        item.nombre,
        item.precio,
        item.unidad,
        item.imagen,
        item.cantidad,
      );

      carrito.carrito();

      expect(carrito.items.length, 0);
    });
  });
}

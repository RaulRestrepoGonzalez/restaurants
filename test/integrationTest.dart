import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurants/carrito/carrito.dart';

class MockServicioRestaurante extends Mock implements Carrito {}

/*void main() {
  test('Prueba de integración del carrito de compras', () {
    final mockServicio = MockServicioRestaurante();
    final carrito = CarritoDeCompras(servicioRestaurante: mockServicio);

    // Definimos el comportamiento esperado del mock
    when(mockServicio.calcularTotal()).thenReturn(25.98);

    // Simulamos agregar productos al carrito
    final producto1 = Producto('Pizza', 12.99);
    final producto2 = Producto('Bebida', 3.99);
    carrito.agregarProducto(producto1);
    carrito.agregarProducto(producto2);

    // Verificamos que se hayan llamado los métodos esperados en el mock
    verify(mockServicio.agregarProducto(producto1));
    verify(mockServicio.agregarProducto(producto2));

    // Probamos el cálculo del total del carrito
    final total = carrito.calcularTotal();

    // Verificamos el resultado esperado
    expect(total, 25.98);
  });
}*/

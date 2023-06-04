import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/carrito/carrito.dart';
import 'package:url_launcher/url_launcher.dart';

class CarritoCompra extends StatefulWidget {
  const CarritoCompra({Key? key}) : super(key: key);

  @override
  State<CarritoCompra> createState() => _CarritoCompraState();
}

class _CarritoCompraState extends State<CarritoCompra> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
        backgroundColor: Colors.amber.shade400,
        appBar: AppBar(
          title: Text('Pedidos'),
          elevation: 0,
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: carrito.numeroItems != 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (var item in carrito.items.values)
                      Card(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image.asset(
                              'assets/image/' + item.imagen,
                              width: 100,
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.all(5),
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(item.nombre),
                                  Text('S/.' +
                                      item.precio.toString() +
                                      ' x ' +
                                      item.unidad),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                carrito.decrementarCantidadItem(
                                                    item.id);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 15,
                                            )),
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                      ),
                                      Container(
                                        width: 20,
                                        child: Center(
                                          child: Text(item.cantidad.toString()),
                                        ),
                                      ),
                                      Container(
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              carrito.incrementarCatidadItem(
                                                  item.id);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 15,
                                          ),
                                        ),
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                            Container(
                              height: 100,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(206, 255, 224, 84)),
                              child: Center(
                                child: Text('S/.' +
                                    (item.precio * item.cantidad).toString()),
                              ),
                            )
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('SubTotal')),
                          Text('S/.' + carrito.subTotal.toStringAsFixed(2)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('Impuestos')),
                          Text('S/.' + carrito.impuesto.toStringAsFixed(2)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('Total')),
                          Text('S/.' + carrito.total.toStringAsFixed(2)),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text('Carrito vacio'),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String pedido = '';
            carrito.items.forEach((key, value) {
              pedido = '$pedido' +
                  value.nombre +
                  'catidad :' +
                  value.cantidad.toString() +
                  'preio unitario :' +
                  value.precio.toString() +
                  'precio total :' +
                  (value.cantidad * value.precio).toStringAsFixed(2) +
                  '\n';
            });
            pedido = '$pedido' +
                'SubTotal :' +
                carrito.subTotal.toStringAsFixed(2) +
                '\n';
            pedido = '$pedido' +
                'Impuesto :' +
                carrito.impuesto.toStringAsFixed(2) +
                '\n';
            pedido = '$pedido' +
                'Total :' +
                carrito.total.toStringAsFixed(2) +
                '\n***************************\n';

            //vinculo de whatsapp
            String celular = "+573016582921";
            String mensaje = pedido;
            String url = "whatsapp://send?phone=$celular&text=$mensaje";

            if (await canLaunch(url)) {
              await (launch(url));
              log(pedido);
              //throw ('No se envio el mensaje');
            } else {
              await (launch(url));
              log(pedido);
            }
          },
          backgroundColor: Colors.red,
          child: Icon(
            Icons.send,
            color: Colors.amber,
          ),
        ),
      );
    });
  }
}

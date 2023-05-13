import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/carrito/carrito.dart';

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
                                                  carrito
                                                      .decrementarCantidadItem(
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
                                            child:
                                                Text(item.cantidad.toString()),
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
                    ],
                  )
                : Center(
                    child: Text('Carrito vacio'),
                  )),
      );
    });
  }
}

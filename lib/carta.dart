import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/carrito/carrito.dart';
import 'package:restaurants/carritoCompra.dart';
import 'package:restaurants/home.dart';
import 'package:restaurants/models/cartaMap.dart';

class Carta extends StatefulWidget {
  const Carta({Key? key}) : super(key: key);

  @override
  State<Carta> createState() => _CartaState();
}

class _CartaState extends State<Carta> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _globalKey,
          backgroundColor: Colors.amber.shade400,
          appBar: AppBar(
            backgroundColor: Colors.amber.shade700,
            title: Text("Carta"),
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("Platos",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("Bebidas",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("Postres",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              new Stack(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        carrito.numeroItems != 0
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext) => CarritoCompra(),
                              ))
                            : _globalKey.currentState!.showSnackBar(SnackBar(
                                content: Text(
                                'Agregar un producto',
                                textAlign: TextAlign.center,
                              )));
                      },
                      icon: Icon(Icons.shopping_cart_checkout))
                ],
              ),
              new Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  constraints: BoxConstraints(minWidth: 10, minHeight: 10),
                  child: Text(
                    carrito.numeroItems.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ),
              )
            ],
          ),
          drawer: MenuLateral(),
          body: TabBarView(
            children: <Widget>[
              Container(
                //child: Text("Platos"),
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: platos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height) /
                        1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x000005cc),
                            blurRadius: 30,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset("assets/image/" + platos[index].imagen),
                          Text(
                            platos[index].nombre,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            platos[index].descripcion,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Valor: " + platos[index].precio.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          RaisedButton.icon(
                            onPressed: () {
                              setState(() {
                                carrito.agregarItem(
                                  platos[index].id.toString(),
                                  platos[index].nombre,
                                  platos[index].precio,
                                  '1', //platos[index].unidad = ,
                                  platos[index].imagen,
                                  1, //platos[index].cantidad,
                                );
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            color: Colors.orange,
                            icon: Icon(Icons.shopping_cart),
                            label: Text('Agregar'),
                            elevation: 0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                //child: Text("Bebidas"),
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: bebidas.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height) /
                        1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x000005cc),
                            blurRadius: 30,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset("assets/image/" + bebidas[index].imagen),
                          Text(
                            bebidas[index].nombre,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            bebidas[index].descripcion,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Valor: " + bebidas[index].precio.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          RaisedButton.icon(
                            onPressed: () {
                              setState(() {
                                carrito.agregarItem(
                                  bebidas[index].id.toString(),
                                  bebidas[index].nombre,
                                  bebidas[index].precio,
                                  '1', //platos[index].unidad,
                                  bebidas[index].imagen,
                                  1, //platos[index].cantidad,
                                );
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            color: Colors.orange,
                            icon: Icon(Icons.shopping_cart),
                            label: Text('Agregar'),
                            elevation: 0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                //child: Text("Postres"),
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: postres.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height) /
                        1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x000005cc),
                            blurRadius: 30,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset("assets/image/" + postres[index].imagen),
                          Text(
                            postres[index].nombre,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            postres[index].descripcion,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Valor: " + postres[index].precio.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          RaisedButton.icon(
                            onPressed: () {
                              setState(() {
                                carrito.agregarItem(
                                  postres[index].id.toString(),
                                  postres[index].nombre,
                                  postres[index].precio,
                                  '1', //platos[index].unidad,
                                  postres[index].imagen,
                                  1, //platos[index].cantidad,
                                );
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            color: Colors.orange,
                            icon: Icon(Icons.shopping_cart),
                            label: Text('Agregar'),
                            elevation: 0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Restaurante"),
            decoration: BoxDecoration(
              color: Colors.amber.shade400,
            ),
            accountEmail: null,
          ),
          InkWell(
              child: new ListTile(
                title: Text("Inicio",
                    style: TextStyle(color: Colors.amber.shade400)),
                leading: Icon(
                  Icons.home_filled,
                  color: Colors.amber.shade400,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext) => Home(),
                  ),
                );
              }),
          InkWell(
              child: new ListTile(
                title: Text("Carta",
                    style: TextStyle(color: Colors.amber.shade400)),
                leading: Icon(
                  Icons.library_books,
                  color: Colors.amber.shade400,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext) => Carta(),
                  ),
                );
              }),
          InkWell(
              child: new ListTile(
                title: Text("Compras",
                    style: TextStyle(color: Colors.amber.shade400)),
                leading: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.amber.shade400,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext) => CarritoCompra(),
                  ),
                );
              }),
          InkWell(
              child: new ListTile(
                title: Text("Informacion",
                    style: TextStyle(color: Colors.amber.shade400)),
                leading: Icon(
                  Icons.info,
                  color: Colors.amber.shade400,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext) => Home(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

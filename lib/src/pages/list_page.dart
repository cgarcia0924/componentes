import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _ListaNumeros = new List();
  int _ultimoItem = 0;
  bool _cargando = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      print('scroll');
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent)
        //_agregar10();
        fetchData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[
            _crearLista(),
            _crearCarga(),
          ],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obternerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _ListaNumeros.length,
        itemBuilder: (BuildContext context, int index) {

          // se usa para que no se devuelva a la primer imagen sino que continue a partir de la que está
          
          final imagen = _ListaNumeros[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obternerPagina() async{
    final duration = new Duration(seconds: 2);
     new Timer(duration, (){
      _ListaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);

  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _ListaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _cargando = true;

    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _cargando = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(microseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
    _agregar10();
  }

  Widget _crearCarga() {
//indicador de progreso...

    if (_cargando) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            CircularProgressIndicator(),
          ]),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;

  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=4UxPpzjkqatUd1l6G2WK5V6pwbUWM8Rg&limit=20&rating=r");
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=4UxPpzjkqatUd1l6G2WK5V6pwbUWM8Rg&q=$_search&limit=20&offset=$_offset&rating=r&lang=en");

    return json.decode(response.body);
  }

  @override
  void iniState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.network(
              "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Column(
            children: <Widget>[
        Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
              labelText: "Pesquise Aqui",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder()
          ),
          style: TextStyle(color: Colors.white, fontSize: 10.0),
          textAlign: TextAlign.center,
        ),
    )
    ],
    ),
    );
  }
}

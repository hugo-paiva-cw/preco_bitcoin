import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _apiUrl = 'https://blockchain.info/ticker';
  var _btcBuyPrice = 'R\$ 0';

  void _getBtcPrice() async {
    var uri = Uri.parse(_apiUrl);

    http.Response response;
    response = await http.get(uri);
    Map<String, dynamic> object = json.decode(response.body);

    setState(() {
      _btcBuyPrice = 'R\$ ' + object['BRL']['buy'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bitcoin.png',
            ),
            Padding(padding: const EdgeInsets.only(bottom: 30, top: 30),
            child: Text(
                _btcBuyPrice,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            RaisedButton(
              onPressed: _getBtcPrice,
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
              color: Colors.orange,
              child: const Text(
                'Atualizar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

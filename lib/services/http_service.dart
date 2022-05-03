import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  static const _apiUrl = 'https://blockchain.info/ticker';
  var currentPrice = 'R\$ 0';
  late String currency;

  Future getPrice({currency = 'BRL'}) async {
    this.currency = currency;
    var uri = Uri.parse(_apiUrl);

    http.Response response;
    response = await http.get(uri);
    Map<String, dynamic> object = json.decode(response.body);
    currentPrice = object[currency]['symbol'].toString() + ' ' + object[currency]['buy'].toString();

    return currentPrice;
  }

}
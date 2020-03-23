import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String url = 'https://apiv2.bitcoinaverage.com';
const String apiKey = 'MzYyYzkwNjExOGRlNDY1YmI3MTQ4YjU0MWNkZWNmOTQ';

Future<List<dynamic>> getAllCurrencies() async {
  Map<String, String> headers = {'x-ba-key': apiKey};
  var response =
      await http.get("$url/constants/exchangerates/global", headers: headers);
  var jsonData = convert.jsonDecode(response.body);
  List<dynamic> currencies = jsonData['rates']
      .values
      .toList()
      .map((f) => [f['name'], f['rate']])
      .toList();

  return currencies;
}

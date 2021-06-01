import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(Uri.http(BaseUrl, BasePage)).timeout(
              Duration(seconds: 5),
            );
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.http(BaseUrl, BasePage),
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 400){
      throw Exception('There was an error. Submitting transaction.');

    }
    if (response.statusCode == 401) {
      throw Exception('There was an error. Authentication failed.');
    }

    return Transaction.fromJson(jsonDecode(response.body));
  }
}

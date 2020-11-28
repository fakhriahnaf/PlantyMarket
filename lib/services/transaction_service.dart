part of 'service.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions({http.Client client}) async {

    client ??= http.Client(); 
    
    String url = baseURL + 'transaction/?limit=1000';
    var response = await client.get(url, headers: {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer ${Users.token}"
    });

    if( response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Transaction> transaction = (data['data']['data'] as Iterable)
      .map((e) => Transaction.fromJson(e)).toList();

    return ApiReturnValue(value: transaction);
    // await Future.delayed(Duration(seconds: 3));
    // return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
    Transaction transaction, {http.Client client}) async {

      String url = baseURL + 'checkout';

      var response = await client.post(url, 
        headers: {
          "Content-Type" : "application/json",
          "Authorization" : "Bearer ${Users.token}",
        },
        body: jsonEncode(<String, dynamic> {
          'item_id': transaction.items.id,
          'user_id' : transaction.users.id,
          'quantity': transaction.quantity,
          'total' : transaction.total,
          'status' : "PENDING"
        })
      );

      if(response.statusCode != 200) {
        return ApiReturnValue(message: 'please try again');
      }

      var data = jsonDecode(response.body);
      Transaction value = Transaction.fromJson(data['data']);

      return ApiReturnValue(value: value);

      // await Future.delayed(Duration(seconds : 2));
      // return ApiReturnValue(value: transactions.copyWith(id: 123, status: TransactionStatus.pending));
    }
}
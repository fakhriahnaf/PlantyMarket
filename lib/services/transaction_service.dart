part of 'service.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(seconds: 3));
    
    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
    Transaction transactions) async {

      await Future.delayed(Duration(seconds : 2));
      
      return ApiReturnValue(value: transactions.copyWith(id: 123, status: TransactionStatus.pending));
    }
}
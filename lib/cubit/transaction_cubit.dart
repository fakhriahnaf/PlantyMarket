import 'package:PlantyMarket/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:PlantyMarket/services/service.dart';
import 'package:bloc/bloc.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState>{
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result = await TransactionService.getTransactions();

    if(result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadingFailed(result.message));
    }
  }
  Future <String> submitTransaction(Transaction transactions) async {
    ApiReturnValue<Transaction> result = 
      await TransactionService.submitTransaction(transactions);

    if (result.value != null) {
      emit(TransactionLoaded(
        (state as TransactionLoaded).transactions + [result.value]));
      return result.value.paymentUrl;
    } else {
      return null;
    }
  }
}
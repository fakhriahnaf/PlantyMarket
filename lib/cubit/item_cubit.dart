import 'package:equatable/equatable.dart';
import 'package:PlantyMarket/services/service.dart';
import 'package:bloc/bloc.dart';
import 'package:PlantyMarket/models/models.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState>{
  ItemCubit() : super(ItemInitial());

  Future<void> getItem() async {
    ApiReturnValue<List<Items>> result = await ItemService.getItems();

    if(result.value != null) {
      emit(ItemLoaded(result.value));
    } else {
      emit(ItemLoadingFailed(result.message));
    }
  }
}
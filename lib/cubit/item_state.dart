part of 'item_cubit.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override 
  List<Object> get props => [];
}

class ItemInitial extends ItemState {
}

class ItemLoaded extends ItemState {
  final List<Items> items;
  ItemLoaded(this.items);

  @override 
  List<Object> get props => [items];
}

class ItemLoadingFailed extends ItemState {
  final String message;

  ItemLoadingFailed(this.message);

  @override 
  List<Object> get props => [message];

}
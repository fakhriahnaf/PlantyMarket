part of 'user_cubit.dart';


abstract class UserState extends Equatable {
  const UserState();

  @override 
  List<Object> get props => [];

}

class UserInitial extends UserState {
}

class UserLoaded extends UserState {
  final Users users;
  UserLoaded(this.users);

  @override 
  List<Object> get props => [users];
}

class UserLoadingFailed extends UserState {
  final String message;

  UserLoadingFailed(this.message);

  @override 
  List<Object> get props => [message];

  
}


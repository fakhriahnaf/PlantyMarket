import 'package:PlantyMarket/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:PlantyMarket/services/service.dart';
import 'package:bloc/bloc.dart';

part 'user_state.dart';

 
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email ,String password ) async {
    ApiReturnValue<Users> result =  await UserService.signIn(email, password);

    if(result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }


}
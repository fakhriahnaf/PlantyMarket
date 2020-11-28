import 'dart:async';
import 'dart:core';
import 'dart:convert';
//import 'dart:html';
import 'dart:io';
//import 'package:http/http.dart' as http;


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

  Future<void> signUp(Users users,String password, {File pictureFile }) async {
    ApiReturnValue<Users> result = await UserService.signUp(users, password, pictureFile: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }
  Future<void> uploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result = await UserService.uploadProfilePicture(pictureFile);

    if(result.value != null) {
      emit(UserLoaded((state as UserLoaded).users.copyWith(
        picturePath: "http://localhost:8000/storage/" + result.value
      )));
    } 
  }


}
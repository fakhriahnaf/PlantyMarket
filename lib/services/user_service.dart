part of 'service.dart';


class UserService {
   static Future<ApiReturnValue<Users>>signIn(String email, String password) async{
    await Future.delayed(Duration(milliseconds: 500));
    
    return ApiReturnValue(value: mockUsers);
    //return ApiReturnValue(message: "wrong Email and password");
  }
}
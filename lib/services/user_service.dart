part of 'service.dart';


class UserService {
   static Future<ApiReturnValue<Users>>signIn(String email, String password, {http.Client client}) async{
     if(client == null) {
       client = http.Client();
     }
     String url = baseURL + 'login';

     var response  = await client.post(
       url, 
       headers:{'Content-Type': 'application/json'},
       body: jsonEncode(<String, String>{'email': email, 'password': password})
      );

      if (response.statusCode != 200) {
        return ApiReturnValue(message: 'please try again');
      }

      var data = jsonDecode(response.body);
      Users.token = data['data']['accesss_token'];
      Users value = Users.fromJson(data['data']['users']);

      return ApiReturnValue(value: value);
    // await Future.delayed(Duration(milliseconds: 500));
    // return ApiReturnValue(value: mockUsers);
    //return ApiReturnValue(message: "wrong Email and password");
  }

  static Future<ApiReturnValue<Users>> signUp(Users users, String password, {File pictureFile, http.Client client}) async {
    if(client == null) {
      client= http.Client();
    }

    String url = baseURL + 'register';

    var response = await client.post(url,
    headers: {'Content-type':"application/json"},
    body: jsonEncode(<String, String> {
      'name': users.name,
      'email': users.email,
      'passwrod': password,
      'password_confirmation': password,
      'address': users.address,
      'city': users.city,
      'portalCode':users.portalCode,
      'phoneNumber': users.phoneNumber,
    }
    ));

    if(response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }
    var data =jsonDecode(response.body);

    Users.token= data['data']['access_token'];
    Users value = Users.fromJson(data['data']['users']);

    //upload image

    if(pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if(result.value != null) {
        value = value.copyWith(picturePath: "http://localhost:8000/storage/" + result.value);
      }
    }
    return ApiReturnValue(value: value);

  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,{http.MultipartRequest request}) async {
    String url = baseURL + 'user/photo';
    var uri = Uri.parse(url);

    if(request == null) {
      request= http.MultipartRequest("POST", uri)
      ..headers["Content-Type"]= 'application/json'
      ..headers["Authorization"] = "Bearer ${Users.token}";

    }
    var multipartFile= await http.MultipartFile.fromPath('file', pictureFile.path);
      request.files.add(multipartFile);

    var response = await request.send();

    if(response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data =jsonDecode(responseBody);

      String imagePath =data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading profile picture fail');
    }
  }
}
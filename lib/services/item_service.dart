part of 'service.dart';

class ItemService {
  static Future<ApiReturnValue<List<Items>>>getItems({http.Client client}) async{
    
    client ??= http.Client();
    String url =baseURL + 'items';
    var response = await client.get(url);
    
    if(response.statusCode != 200){
      return ApiReturnValue(message: 'please try again');
    }

    var data = jsonDecode(response.body);
    List<Items> items = (data['data']['data'] as Iterable).map((e) => Items.fromJson(e)).toList(); 
    
    // await Future.delayed(Duration(milliseconds: 500))
    // return ApiReturnValue(value: mockItems);
  }
}
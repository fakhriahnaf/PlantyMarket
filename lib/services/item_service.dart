part of 'service.dart';

class ItemService {
  static Future<ApiReturnValue<List<Items>>>getItems() async{
    await Future.delayed(Duration(milliseconds: 500));
    
    return ApiReturnValue(value: mockItems);
  }
}
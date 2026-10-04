
import 'package:boy/Modals/get_order_details_modal.dart';
import 'package:boy/Modals/get_order_modal.dart';
import 'package:boy/apiandurl/api_url.dart';
import 'package:dio/dio.dart';

class ApiClass {
  //ValueNotifier<List<Datum>> productNotifier = ValueNotifier([]);
  // ApiClass._internal();
  static ApiClass instance = ApiClass();
  factory() {
    return instance;
  }

  final dio = Dio();
  final url = URL();

  ApiClass() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.json,
    );
  }

  Future<get_order_modals?> get_order_api(FormData formdata) async {
    try {
      final result = await dio.post(url.get_order_end, data: formdata);
      return get_order_modals.fromJson(result.data);
      print("hellosssss");
    } on DioException catch (e) {
      print("erooor");
      print(e);
    }
  }




Future<get_order_details_modals?> get_order_details_api(FormData formdata) async {
    try {
      final result = await dio.post(url.get_order_details_end, data: formdata);
      return get_order_details_modals.fromJson(result.data);
    } on DioException catch (e) {
      print(e);
    }
  }

}

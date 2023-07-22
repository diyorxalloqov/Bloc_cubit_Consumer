import 'package:bloc_consumer_app/core/constants/api.dart';
import 'package:bloc_consumer_app/model/CommentsModel.dart';
import 'package:dio/dio.dart';

class CommentsService {
  Future<dynamic> getComments() async {
    try {
      Response response = await Dio().get(Api.api);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CommentsModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.error.toString();
    }
  }
}

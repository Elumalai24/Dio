import 'package:dio/dio.dart';

import '../model/user_model.dart';

class ApiService {
  Future<List<Users>> fetchData() async {
    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/todos');

      if (response.statusCode == 200) {
        List<Users> user =
            (response.data as List).map((e) => Users.fromJson(e)).toList();
        return user;
      } else {
        throw Exception('Failed to fetch user');
      }
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }
}

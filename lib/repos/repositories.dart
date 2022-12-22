import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:internetconnectivityusingbloc/repos/user_model.dart';

class UserRepositories {
  // String urlEndPoint = "https://reqres.in/api/users?page=2";

  Future<List<UserModel>> getUsers() async {
    String urlEndPoint = "https://reqres.in/api/users?page=2";

    // Await the http get response, then decode the json-formatted response.
    Response response = await http.get(Uri.parse(urlEndPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
      // print('Request failed with status: ${response.statusCode}.');
    }
  }
}

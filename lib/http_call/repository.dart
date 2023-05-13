import 'dart:convert';

import 'http_client.dart';

class Repository {
  final HttpClient _httpClient = HttpClient();

  /// `gets data for rocket list`
  Future<List<Map<String, dynamic>>> getRocketList() async {
    var response = await _httpClient.get(
        serverUrl: 'https://api.spacexdata.com/v4/rockets');
    var body = json.decode(response['body']);
    List<Map<String, dynamic>> rocketList = [];
    for (var item in body) {
      rocketList.add(Map<String, dynamic>.from(item));
    }
    return rocketList;
  }

  /// `gets data for rocket list detailed data`
  Future<Map<String, dynamic>> getRocketListDetails({
    required String id,
  }) async {
    var response = await _httpClient.get(
        serverUrl: 'https://api.spacexdata.com/v4/rockets/$id');
    var body = json.decode(response['body']);

    return body;
  }
}

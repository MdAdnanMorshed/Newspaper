import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class NewsRepo {
  Future getAllNewsList() async {
    var baseUrl = 'https://newsapi.org/v2/';
    var apiKey = 'd91efeb4def9438abb5ca114e97d3de6';
    Uri url = Uri.parse('${baseUrl}everything?q=bitcoin&apiKey=$apiKey');

    try {
      final response = await http.get(url, headers: {
        "Accept": "application/json",
      });
      if (kDebugMode) {
        print(' url  $url');
        print(' Status Code ${response.statusCode.toString()}');
        print(' res  ${response.body.toString()}');
      }
      return response;
    } on Exception catch (exception) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }
}

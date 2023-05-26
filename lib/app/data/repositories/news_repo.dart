import 'dart:convert';

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
        //print(' res  ${response.body.toString()}');
      }
      return response;
    } on Exception catch (exception) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future signInAuth(String email, String password) async {
    var baseUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:';
    var apiKey = 'AIzaSyBYUSOoaw-txTtN4-keHiBq-qTIB6-TyFY';
    Uri url = Uri.parse('${baseUrl}signInWithPassword?key=$apiKey');

    try {
      final response = await http.post(url,
          body: jsonEncode({
            'email': email.toString(),
            'password': password.toString(),
            'returnSecureToken': true,
          }),
          headers: {
            "Accept": "application/json",
          });
      if (kDebugMode) {
        print(' url  $url');
        print(' Status Code ${response.statusCode.toString()}');
        print(' res  ${jsonDecode(response.body.toString())}');

      }
      return response;
    } on Exception catch (exception) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future signUpAuth(String email, String password) async {
    var baseUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:';
    var apiKey = 'AIzaSyBYUSOoaw-txTtN4-keHiBq-qTIB6-TyFY';
    Uri url = Uri.parse('${baseUrl}signUp?key=$apiKey');

    try {
      final response = await http.post(url,
          body: jsonEncode({
            'email': email.toString(),
            'password': password.toString(),
          }),
          headers: {
            "Accept": "application/json",
          });
      if (kDebugMode) {
        print(' url  $url');
        print(' Status Code ${response.statusCode.toString()}');
        print(' res  ${jsonDecode(response.body)}');
      }
      return response;
    } on Exception catch (exception) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }
}

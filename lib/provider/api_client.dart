import 'dart:convert';

import 'package:flutter_bloc_example/utils/resources.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const int NetworkError = -1;

abstract class Api {
  final String baseUrl;
  final http.Client client = http.Client();

  Api({@required this.baseUrl});

  Future<Resource<dynamic>> get(String url, Map<String, String> headers) async {
    try {
      final response = await client.get(url, headers: headers);
      switch (response.statusCode) {
        case 200:
          return Resource.success(json.decode(utf8.decode(response.bodyBytes)));
          break;
        case 401:
          return Resource.error("User Not Authorized.",
              code: response.statusCode);
          break;
        case 403:
          return Resource.error("User Not Authorized.",
              code: response.statusCode);
          break;
        default:
          return Resource.error(
              "An unkown error has occured. Please try again.",
              code: response.statusCode);
          break;
      }
    } catch (error) {
      return Resource.error("An unkown error has occured. Please try again.",
          code: NetworkError);
    }
  }

  Future<Resource<dynamic>> post(String url, Map<String, String> headers,
      {dynamic body}) async {
    try {
      final response = await client.post(url, headers: headers, body: json.encode(body));
      switch (response.statusCode) {
        case 203:
        case 200:
          dynamic body;
          if (response.body.length > 0) {
            body = json.decode(utf8.decode(response.bodyBytes));
          } else {
            body = "";
          }
          return Resource.success(body);
          break;
        case 401:
          return Resource.error("User Not Authorized.",
              code: response.statusCode);
          break;
        case 404:
          return Resource.error("Requested Item Not Found",
              code: response.statusCode);
          break;
        case 400:
          if (response.body.length > 0) {
            body = json.decode(utf8.decode(response.bodyBytes));
          } else {
            body = "";
          }
          return Resource.error("Error 400", data: body,
              code: response.statusCode);
          break;
        default:
          return Resource.error(
              "An unkown error has occured. Please try again.",
              code: response.statusCode);
          break;
      }
    } catch (error) {
      return Resource.error("An unkown error has occured. Please try again.",
          code: NetworkError);
    }
  }
}

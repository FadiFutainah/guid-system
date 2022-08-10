import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/application/utils/exceptions.dart';
import 'package:app/data/helpers/rest.dart';
import 'package:app/data/services/local_storage.dart';
import 'package:http/http.dart' as http;

class RestApiService extends Rest {
  RestApiService(String serverAddress) : super(serverAddress);

  @override
  Future get(
    String endpoint, {
    Map<String, String> headers = Rest.defaultHeaders,
    bool hasToken = false,
  }) async {
    try {
      if (hasToken) {
        String token = await LocalStorage().token;
        headers['Authorization'] = 'bearar $token';
      }
      var uri = Uri.parse(serverAddress + endpoint);
      var response = await http
          .get(
            uri,
            headers: headers,
          )
          .timeout(timeoutDuration);
      return returnResponse(response);
    } catch (e) {
      throwException(e);
    }
  }

  @override
  post(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String> headers = Rest.defaultHeaders,
    bool hasToken = false,
  }) async {
    try {
      if (hasToken) {
        String token = await LocalStorage().token;
        headers['Authorization'] = 'bearar $token';
      }
      var uri = Uri.parse(serverAddress + endpoint);
      var response = await http
          .post(
            uri,
            body: body,
            headers: headers,
          )
          .timeout(timeoutDuration);
      return returnResponse(response);
    } catch (e) {
      throwException(e);
    }
  }

  @override
  delete(String endpoint) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  put(String endpoint) {
    // TODO: implement put
    throw UnimplementedError();
  }

  void throwException(Object e) {
    if (e is SocketException) {
      throw InternetConnectionException();
    } else if (e is TimeoutException) {
      throw WeakInternetConnection();
    } else {
      throw AppException('unexpected error happend');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 404:
        throw NotFoundException(response.statusCode);
      case 500:
        throw FetchDataException(response.statusCode);
      default:
        throw InternetConnectionException();
    }
  }
}

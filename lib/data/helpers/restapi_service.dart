import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/application/utils/exceptions.dart';
import 'package:app/data/helpers/rest.dart';
import 'package:dio/dio.dart';
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
        headers = await addTokenHeader(headers);
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
    bool encode = true,
  }) async {
    try {
      if (hasToken) {
        headers = await addTokenHeader(headers);
      }
      var uri = Uri.parse(serverAddress + endpoint);
      var response = await http
          .post(
            uri,
            body: encode ? jsonEncode(body) : body,
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
    throw UnimplementedError();
  }

  @override
  put(String endpoint) {
    throw UnimplementedError();
  }

  @override
  patch(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String> headers = Rest.defaultHeaders,
    bool hasToken = false,
    bool encode = true,
  }) async {
    try {
      if (hasToken) {
        headers = await addTokenHeader(headers);
      }
      var uri = Uri.parse(serverAddress + endpoint);
      var response = await http
          .patch(
            uri,
            body: encode ? jsonEncode(body) : body,
            headers: headers,
          )
          .timeout(timeoutDuration);
      return returnResponse(response);
    } catch (e) {
      throwException(e);
    }
  }

  Future editProfilePhoto(
    String endpoint,
    String photoPath, {
    Map<String, String> headers = Rest.defaultHeaders,
    bool hasToken = false,
    bool encode = true,
  }) async {
    try {
      if (hasToken) {
        headers = await addTokenHeader(headers);
      }
      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(photoPath),
      });

      var uri = serverAddress + endpoint;
      var response = await Dio()
          .patch(
            uri,
            data: formData,
            options: Options(headers: headers),
          )
          .timeout(timeoutDuration);
      return response.data;
    } catch (e) {
      throwException(e);
    }
  }

  addProjectRequest(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String> headers = Rest.defaultHeaders,
    bool hasToken = false,
    bool encode = true,
  }) async {
    try {
      if (hasToken) {
        headers = await addTokenHeader(headers);
      }

      FormData formData = FormData.fromMap(
        {
          'position': body['position'],
          'project': {
            'title': body['project']['title'],
            'description': body['project']['description'],
            'link': body['project']['link'],
            'start_date': body['project']['start_date'],
            'end_date': body['project']['end_date'],
            'photo': await MultipartFile.fromFile(
              body['project']['photo'],
              filename: 'photo',
            ),
          },
        },
      );

      var uri = serverAddress + endpoint;
      var response = await Dio()
          .post(
            uri,
            data: formData,
            options: Options(headers: headers),
          )
          .timeout(timeoutDuration);
      return returnResponse(response.data);
    } catch (e) {
      throwException(e);
    }
  }

  void throwException(Object e) {
    if (e is SocketException) {
      throw InternetConnectionException();
    } else if (e is TimeoutException) {
      throw WeakInternetConnection();
    } else if (e is NotFoundException) {
      throw e;
    } else {
      throw AppException('unexpected error happend');
    }
  }

  dynamic returnResponse(http.Response response, {bool decode = true}) {
    switch (response.statusCode) {
      case 200:
        if (decode) {
          return jsonDecode(response.body);
        }
        return response.body;
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

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokedex/core/values/enviroments.dart';
import 'package:pokedex/data/models/enums/request_method.enum.dart';
import 'package:pokedex/data/providers/api_exceptions.dart';

class ApiProvider {
  ApiProvider._privateConstructor();
  static final ApiProvider _instance = ApiProvider._privateConstructor();
  static ApiProvider get instance => _instance;

  // ignore: prefer_typing_uninitialized_variables
  var jsonError;

  Future<dynamic> request<T>(RequestMethod method, String endPoint,
      {bool useDefaultUrl = true,
      String body = '',
      bool returnFullResponse = false}) async {
    http.Response resp;

    final Uri url =
        Uri.parse((useDefaultUrl ? Environments.apiPoke : '') + endPoint);

    final Map<String, String> headers = <String, String>{};
    headers.putIfAbsent(
        HttpHeaders.contentTypeHeader, () => 'application/json');

    try {
      if (method == RequestMethod.get) {
        resp = await http.get(url, headers: headers);
      } else if (method == RequestMethod.put) {
        resp = await http.put(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.patch) {
        resp = await http.patch(url, headers: headers, body: body);
      } else if (method == RequestMethod.post) {
        resp = await http.post(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.delete) {
        resp = await http.delete(
          url,
          headers: headers,
        );
      } else {
        throw Exception('Otro error');
      }

      jsonError = resp;
      return _returnResponse(resp, returnFullResponse);
    } on TimeoutException catch (e) {
      throw Exception(e);
    } on SocketException catch (e) {
      throw Exception(e);
    } on Error catch (_) {
      _returnResponse(jsonError, returnFullResponse);
      throw Exception();
    }
  }

  dynamic _returnResponse(http.Response response, bool returnFullResponse) {
    switch (response.statusCode) {
      case 200:
        if (returnFullResponse) return response;
        var responseJson = response;
        return responseJson;
      case 201:
        var responseJson = response;
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

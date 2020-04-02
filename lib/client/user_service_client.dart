import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ripple_io_example/common/constants.dart';
import 'package:ripple_io_example/models/dto/link_response_dto.dart';
import 'package:ripple_io_example/models/user/dto/request.dart';
import 'package:ripple_io_example/models/user/dto/response.dart';

class UserServiceHttpClient {
  final http.Client httpClient;
  String _url =
      ServiceHosts.USER_SERVICE_HOST + ServiceRoutes.USER_SERVICE_ROUTE;

  UserServiceHttpClient({@required this.httpClient}) : assert(httpClient != null);

  Future<UserDto> fetchUserInfo(UserRequest request, String authToken) async {
    if (null == request) {
      throw new Exception("Invalid request");
    } else if (request.email.isNotEmpty) {
      _url = _url + "?email=${request.email}";
    } else if (request.contactNumber.isNotEmpty) {
      _url = _url + "?contact_number=${request.contactNumber}";
    } else {
      throw new Exception("Invalid request");
    }

    Map<String, String> headers = _generateHeaders(authToken);

    final response = await this.httpClient.get(_url, headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      return UserDto.fromJson(jsonDecode(response.body));
    } else {
      throw new HttpException(response.reasonPhrase);
    }
  }

  Future<LinkResponseDto> createUser(
      UserDto userRequest, String authToken) async {
    Map<String, String> headers = _generateHeaders(authToken);

    final String requestBody = jsonEncode(userRequest);

    final response =
        await this.httpClient.put(_url, headers: headers, body: requestBody);
    if (response.statusCode == HttpStatus.ok) {
      return LinkResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw new HttpException(response.reasonPhrase);
    }
  }

  Future<String> deleteUser(String email, String authToken) async {
    final headers = this._generateHeaders(authToken);
    final response =
        await this.httpClient.delete(_url + "?email=$email", headers: headers);

    if (response.statusCode == HttpStatus.accepted ||
        response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      return response.reasonPhrase;
    }
  }

  Map<String, String> _generateHeaders(String authToken) {
    return {
      HttpHeaders.contentTypeHeader: ContentType.json.toString(),
      HttpHeaders.acceptHeader: ContentType.json.toString(),
      HttpHeaders.authorizationHeader: "Bearer $authToken"
    };
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:ripple_io_example/models/login/dto/request.dart';
import 'package:ripple_io_example/models/login/dto/response.dart';
import 'package:ripple_io_example/common/constants.dart' as api_constant;
import 'package:http/http.dart' as http;

class SessionHttpClient {
  final String _url = api_constant.ServiceHosts.LOGIN_SERVICE_HOST +
      api_constant.ServiceRoutes.LOGIN_SERVICE_ROUTE;

  final http.Client httpClient;

  SessionHttpClient({@required this.httpClient}) : assert(httpClient != null);

  Future<LoginResponse> authenticate(LoginRequest loginRequest) async {
    final response = await this
        .httpClient
        .put(_url, headers: _generateHeaders(), body: jsonEncode(loginRequest));

    try {
      if (response.statusCode == HttpStatus.ok) {
        final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
        return loginResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    } finally {
      httpClient.close();
    }
  }

  Map<String, String> _generateHeaders() {
    return {
      HttpHeaders.contentTypeHeader: ContentType.json.toString(),
      HttpHeaders.acceptHeader: ContentType.json.toString()
    };
  }
}

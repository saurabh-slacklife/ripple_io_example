import 'package:flutter/cupertino.dart';
import 'package:ripple_io_example/client/session_service_client.dart';
import 'package:ripple_io_example/models/login/dto/request.dart';
import 'package:ripple_io_example/models/login/dto/response.dart';

class SessionService{
  final SessionHttpClient sessionHttpClient;

  SessionService({@required this.sessionHttpClient}): assert(sessionHttpClient!=null);

  Future<LoginResponse> authenticate(LoginRequest request) async{
    return await this.sessionHttpClient.authenticate(request);
  }

}
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ripple_io_example/models/login/dto/request.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();
}

class FetchAuth extends SessionEvent {
  final LoginRequest request;

  const FetchAuth({@required this.request}) : assert(request != null);

  @override
  List<Object> get props => [this.request];
}

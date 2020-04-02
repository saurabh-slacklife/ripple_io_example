import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ripple_io_example/models/login/dto/request.dart';
import 'package:ripple_io_example/models/login/dto/response.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class SessionEmpty extends SessionState {
  final LoginRequest loginRequest;

  const SessionEmpty({this.loginRequest});

  @override
  List<Object> get props => [this.loginRequest];
}

class SessionLoading extends SessionState {}

class SessionLoaded extends SessionState {
  final LoginResponse loginResponse;

  const SessionLoaded({@required this.loginResponse});

  @override
  List<Object> get props => [this.loginResponse];
}

class SessionError extends SessionState {
  final Exception exception;
  const SessionError({this.exception});
  @override
  List<Object> get props => [this.exception];
}

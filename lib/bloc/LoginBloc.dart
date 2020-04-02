import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ripple_io_example/bloc/login_bloc.dart';
import 'package:ripple_io_example/bloc/login_state.dart';
import 'package:ripple_io_example/models/login/dto/response.dart';
import 'package:ripple_io_example/service/session_service.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SessionService sessionService;

  SessionBloc({@required this.sessionService}) : assert(sessionService != null);

  @override
  SessionState get initialState => SessionEmpty();

  @override
  Stream<SessionState> mapEventToState(SessionEvent sessionEvent) async* {
    if (sessionEvent is FetchAuth) {
      yield SessionLoading();
      try {
        final LoginResponse response = await sessionService.authenticate(sessionEvent.request);
        yield SessionLoaded(loginResponse: response);
      } catch (e) {
        yield SessionError();
      }
    }
  }
}

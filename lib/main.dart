import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ripple_io_example/bloc/LoginBloc.dart';
import 'package:ripple_io_example/client/session_service_client.dart';
import 'package:ripple_io_example/service/session_service.dart';
import 'package:http/http.dart' as http;
import 'package:ripple_io_example/views/home_page.dart';

class SessionBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SessionBlocDelegate();

  final sessionHttpClient = SessionHttpClient(httpClient: http.Client());

  final SessionService sessionService =
      SessionService(sessionHttpClient: sessionHttpClient);

  runApp(MyApp(
    sessionService: sessionService,
  ));
}

class MyApp extends StatelessWidget {
  final SessionService sessionService;

  MyApp({Key key, @required this.sessionService})
      : assert(sessionService != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quote'),
        ),
        body: BlocProvider(
          create: (context) => SessionBloc(sessionService: sessionService),
          child: LoginPage(),
        ),
      ),
    );
  }
}

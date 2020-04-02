import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ripple_io_example/bloc/LoginBloc.dart';
import 'package:ripple_io_example/bloc/login_bloc.dart';
import 'package:ripple_io_example/bloc/login_state.dart';
import 'package:ripple_io_example/models/login/dto/request.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        if (state is SessionEmpty) {
          final request =
              LoginRequest(email: 'saurabh1@user.com', password: 'password');
          BlocProvider.of<SessionBloc>(context)
              .add(FetchAuth(request: request));
        }
        if (state is SessionError) {
          return Center(
            child: Text('failed to fetch quote'),
          );
        }
        if (state is SessionLoaded) {
          return ListTile(
            leading: Text(
              '${state.loginResponse.authToken}',
              style: TextStyle(fontSize: 10.0),
            ),
            title: Text(state.loginResponse.refreshToken),
            isThreeLine: true,
            subtitle: Text(state.loginResponse.ttl.toString()),
            dense: true,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

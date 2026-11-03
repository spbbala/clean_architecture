import 'package:clean/presentation/pages/debounce_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasources/auth_remote_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_use_case.dart';
import 'presentation/bloc/login_bloc.dart';
import 'presentation/pages/login_page.dart';

void main() {

  final remoteDataSource = AuthRemoteDataSource();

  final AuthRepository authRepository = AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );


  final loginUseCase = LoginUseCase(authRepository);


  runApp(
    MyApp(loginUseCase: loginUseCase),
  );
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;

  const MyApp({
    super.key,
    required this.loginUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => LoginBloc(
          loginUseCase: loginUseCase,
        ),
       // child: const LoginPage(),
        child: const SearchPage(),
      ),
    );
  }
}
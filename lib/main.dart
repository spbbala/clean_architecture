import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasources/auth_remote_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_use_case.dart';
import 'presentation/bloc/login_bloc.dart';
import 'presentation/pages/login_page.dart';

void main() {
  // 1. Create the data source
  final remoteDataSource = AuthRemoteDataSource();

  // 2. Create the repository implementation
  //    and inject the data source into it.
  final AuthRepository authRepository = AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  // 3. Create the use case
  //    and inject the repository into it.
  final loginUseCase = LoginUseCase(authRepository);

  // 4. Provide the BLoC to the UI.
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
        child: const LoginPage(),
      ),
    );
  }
}
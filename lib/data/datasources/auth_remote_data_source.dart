class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(
      String email,
      String password,
      ) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'test@example.com' &&
        password == 'password123') {
      return {
        'id': '1',
        'name': 'Bala',
        'email': email,
      };
    }

    throw Exception('Invalid email or password');
  }
}
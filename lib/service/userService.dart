part of 'services.dart';

class Userservice {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(Duration(microseconds: 500));

    // loginSucess
    return ApiReturnValue(value: mockUser);

    // login failed
    // return ApiReturnValue(message: 'failed to log in');
  }
}

part of 'models.dart';

class ApiReturnValue<T> {
  final String? message;
  final T? value;

  ApiReturnValue({this.message, this.value});
}

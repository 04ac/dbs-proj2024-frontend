part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {}

class LoginScreenActionEvent extends LoginScreenEvent {}

class InvalidUnamePassEntered extends LoginScreenActionEvent {}

class CreateCustomerEvent extends LoginScreenEvent {
  final String uname, passwd;

  CreateCustomerEvent({required this.uname, required this.passwd});
}

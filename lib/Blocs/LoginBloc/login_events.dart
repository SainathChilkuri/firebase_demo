import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvents extends Equatable{
  @override
  List<Object> get props => [];
}
class LoginPressedEvent extends LoginEvents{
  final String email;
  final String password;
  LoginPressedEvent({
    @required this.email,
    @required this.password
}):assert(email!=null && password !=null);
  @override
  List<Object> get props => [email,password];
}
class LogoutButtonPressed extends LoginEvents{}
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginStates extends Equatable{
  @override
  List<Object> get props =>[];
}
class InitialLoginState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccesfulState extends LoginStates{
  final UserDetails user;
  LoginSuccesfulState({
    @required this.user
}):assert(user!=null);
}
class LoginFailedState extends LoginStates{}
class LogoutState extends LoginStates{}
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthState extends Equatable{

}
class AuthInitial extends AuthState{
  @override
  List<Object> get props => [];
}
class AuthSuccesful extends AuthState{
  final UserDetails user;
  AuthSuccesful({
    @required this.user
  }): assert(user!=null);
  @override
  List<Object> get props => [user];
}
class UnAuthState extends AuthState{
  @override
  List<Object> get props => [];

}
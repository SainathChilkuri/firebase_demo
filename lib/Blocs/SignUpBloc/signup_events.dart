import 'package:equatable/equatable.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class SignUpEvents extends Equatable{

  @override
  List<Object> get props => [];
}
class SignUpButtonPressed extends SignUpEvents{
  final String email;
  final String password;
  final UserDetails user;
  SignUpButtonPressed({
    @required this.email,
    @required this.password,
    @required this.user
}):assert(email!=null && password !=null && user!=null);

  @override
  List<Object> get props => [email,password];
}
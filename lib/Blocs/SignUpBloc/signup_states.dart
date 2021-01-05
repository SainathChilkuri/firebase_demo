import 'package:equatable/equatable.dart';

abstract class SignUpStates extends Equatable{

  @override
  List<Object> get props => [];
}
class SignUpInitial extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessful extends SignUpStates{

}
class SignUpFailed extends SignUpStates{}
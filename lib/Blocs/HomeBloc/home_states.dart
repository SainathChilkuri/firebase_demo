import 'package:equatable/equatable.dart';

abstract class HomeStates extends Equatable{

  @override
  List<Object> get props=>[];
}
class HomeInitialState extends HomeStates{}
class HomeLogoutSuccesfulState extends HomeStates{}
class HomeLogoutFailedState extends HomeStates{}
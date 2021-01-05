import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Blocs/HomeBloc/home_events.dart';
import 'package:firebase_demo/Blocs/HomeBloc/home_states.dart';
import 'package:firebase_demo/Repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents,HomeStates>{
  UserRepository _userRepository;
  HomeBloc() : super(HomeInitialState()){
    _userRepository=UserRepository();
  }

  @override
  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    if(event is HomeLogoutPressed){
      print("Event : Home Logout Pressed");
      try{
        var isSignedIn = await _userRepository.isSignedIn();
        if(isSignedIn){
          print("User is Signed in: $isSignedIn");
          await _userRepository.signout();
          yield HomeLogoutSuccesfulState();
        }else{
          yield HomeLogoutFailedState();
        }
      }catch(e){
        yield HomeLogoutFailedState();
      }

    }
  }

}
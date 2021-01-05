import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Blocs/AuthBloc/auth_event.dart';
import 'package:firebase_demo/Blocs/AuthBloc/auth_state.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Repository/user_collections.dart';
import 'package:firebase_demo/Repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  UserRepository _userRepository;
  AuthBloc() : super(AuthInitial()){
    _userRepository = UserRepository();
  }
  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
   if(event is AppStarted){
     print("-----App Started Event------:");
     try{
       var isSignedIn = await _userRepository.isSignedIn();
       if(isSignedIn){
         print("isSignedIn: $isSignedIn");
         print("------User is present----");
         User user = await _userRepository.getUser();
         if(user!=null){
           print("User: ${user.email}");
           UserDetails userDetails = await UserCollections.getuserDetails(user.uid);
           print(user);
           yield AuthSuccesful(user:userDetails);
         }else{
           print("No User");
           yield UnAuthState();
         }
       }else{
         print("---------------not Signed in-----------");
         yield UnAuthState();
       }
     }catch(e){
       print(e.toString());
       //yield AuthInitial();
     }
   }
  }
}
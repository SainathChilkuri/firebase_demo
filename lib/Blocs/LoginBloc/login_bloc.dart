import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Blocs/LoginBloc/login_events.dart';
import 'package:firebase_demo/Blocs/LoginBloc/login_state.dart';
import 'package:firebase_demo/Model/user_model.dart';
import 'package:firebase_demo/Repository/user_collections.dart';
import 'package:firebase_demo/Repository/user_repository.dart';
import 'package:firebase_demo/Session/user_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
   UserRepository _userRepository;
  LoginBloc() : super(InitialLoginState()){
    _userRepository = UserRepository();
  }

  @override
  Stream<LoginStates> mapEventToState(LoginEvents event) async* {
   if(event is LoginPressedEvent){
     print("Login Pressed:");
     yield LoginLoadingState();
     try{
       UserCredential user = await _userRepository.signInWithCredentials(event.email, event.password);
       if(user!=null){
         print("USER: ${user.user.email}");
         UserDetails userdetails = await UserCollections.getuserDetails(user.user.uid);
        // var user_details = UserDetails().fromMap(userdetails.data());
         print(userdetails.lastname + userdetails.firstname + userdetails.UID);
         print("User Session: ----------->");
         UserSession.storeSession(userdetails);
         yield LoginSuccesfulState(user:userdetails);
       }else{
         yield LoginFailedState();
       }
     }catch(e){
       print(e.toString());
       yield LoginFailedState();
     }
   }
   if(event is LogoutButtonPressed){
     var isSignedIn = await _userRepository.isSignedIn();
     if(isSignedIn){
       await _userRepository.signout();
       yield LogoutState();
     }else{
       print("------------------Logout Button Pressed--------------------");
     }
   }
  }


}
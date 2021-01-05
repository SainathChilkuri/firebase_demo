import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Blocs/SignUpBloc/signup_events.dart';
import 'package:firebase_demo/Blocs/SignUpBloc/signup_states.dart';
import 'package:firebase_demo/Repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvents,SignUpStates>{
  UserRepository _userRepository;
  SignUpBloc() : super(SignUpInitial()){
    _userRepository = UserRepository();
  }

  @override
  Stream<SignUpStates> mapEventToState(SignUpEvents event) async*{
   if(event is SignUpButtonPressed){
     try{
       print({event.email});
       yield SignUpLoadingState();
       UserCredential user = await _userRepository.createUserWithEmailandPassword(event.email, event.password,event.user);
       if(user!=null){
         print(user.user.email);
         yield SignUpSuccessful();
         _userRepository.signout();
       }else{
         yield SignUpFailed();
       }
     }catch(e){
       yield SignUpFailed();
     }

   }
  }

}
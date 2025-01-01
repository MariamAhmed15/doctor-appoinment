import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/user_model.dart';
import '../states/auth_states.dart';

class authCubit extends Cubit <authStates> {
  authCubit() :super(authInitialState());
  late UserModel userModel;
  static String ?x;
  Future<void> signUp(UserModel user)async{
    emit(authLoadingState());
    try{
      final response=await Dio().post(
        EndPoints.signUpUrl,
        data: user.toJson(),
      );
      if(response.statusCode==200){
        final token= response.data["data"]["token"];
        final message= response.data["message"];
        x = token;
        final userModel=user;
        emit(authSuccessState(message, token));
      }else{
        emit(authErrorState("SignUp failed, Please try again."));
      }

    }catch(e){
      emit(authErrorState(e.toString()));
    }
  }
}